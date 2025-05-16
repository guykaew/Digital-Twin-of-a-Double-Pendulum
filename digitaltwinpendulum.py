import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import socket
import threading
import math
from matplotlib.widgets import RadioButtons, Button
from scipy.integrate import odeint
import sys
import pandas as pd
import sympy as smp
import time
from filterpy.kalman import UnscentedKalmanFilter, MerweScaledSigmaPoints


#Prevents program from crashing when 2 figures are opened at once
plt.close("all")

#Initialise time
modeltime = 0
starttime = 0


#initialise list for storing data
pend1me_store = []
pend2me_store = []
totalme_store = []
time_data = []
sensortime_data = []
time_elapsed = 0
theta1dev = []
theta2dev = []
deviationtime = 0
projectedtheta1_history = []
theta1_history = []
# Number of points to display in the phase space plot
no_points = 500

# IP and port for connection
ESP_IP = "192.168.4.1"
PORT = 12345
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Initialise variables and conditions


data_lock = threading.Lock()
send_lock = threading.Lock()
#initial mode
current_mode = "Prediction"
simulationstate = [math.radians(30), 0.0, math.radians(0), 0.0]
if current_mode == "Prediction":
    latestangles = (math.radians(0), math.radians(0))

else: 
    latestangles = (math.radians(0), math.radians(0))

#initialise data lists
data_history = []  
covariance_history = []
projected_history = []
delay_history = []
smp.init_printing()
t, g = smp.symbols('t g')
m1, m2 = smp.symbols('m1 m2')
L1, L2 = smp.symbols('L1 L2')  
w = smp.symbols('w')
the1, the2 = smp.symbols(r'\theta_1, \theta_2', cls=smp.Function)
k = smp.symbols('k')
c = smp.symbols('c')
the1_t = the1(t)
the2_t = the2(t)

the1_d = smp.diff(the1_t, t)
the2_d = smp.diff(the2_t, t)
the1_dd = smp.diff(the1_d, t)
the2_dd = smp.diff(the2_d, t)

x1 = 0.5 * L1 * smp.sin(the1_t)
y1 = -0.5 * L1 * smp.cos(the1_t)
x2 = L1 * smp.sin(the1_t) + (L2/2) * smp.sin(the2_t)
y2 = -L1 * smp.cos(the1_t) - (L2/2) * smp.cos(the2_t)
I1= 0.005822240404356  
I2 = 0.001682464671227
# Kinetic energies
T1 = 0.5 * m1 * (smp.diff(x1, t)**2 + smp.diff(y1, t)**2) + 0.5 * I1 * the1_d**2
T2 = 0.5 * m2 * (smp.diff(x2, t)**2 + smp.diff(y2, t)**2) + 0.5 * I2 * the2_d**2
T = T1 + T2

#Potential energies terms
V1 = m1 * g * y1
V2 = m2 * g * y2
V = V1 + V2
#Lagrangian Derivation
Lagrangian = T - V
# Equations of motion (with damping term -k*velocity)
LE1 = smp.diff(Lagrangian, the1_t) - smp.diff(smp.diff(Lagrangian, the1_d), t).simplify() - k*the1_d
LE2 = smp.diff(Lagrangian, the2_t) - smp.diff(smp.diff(Lagrangian, the2_d), t).simplify() - c*the2_d

#Solve for the accelerations
solution = smp.solve([LE1, LE2], (the1_dd, the2_dd),
                        simplify=True, rational=True)

# Create numerical functions for the accelerations and velocities from defined symbolic terms
dz1dt_f = smp.lambdify((t, g, m1, m2, L1, L2,
                         the1_t, the2_t, the1_d, the2_d, w, k, c),
                        solution[the1_dd])
dz2dt_f = smp.lambdify((t, g, m1, m2, L1, L2,
                         the1_t, the2_t, the1_d, the2_d, w, k,c),
                        solution[the2_dd])
dthe1dt_f = smp.lambdify(the1_d, the1_d)
dthe2dt_f = smp.lambdify(the2_d, the2_d)

# Define the ODE system for odeint
def dSdt(S, t):
    theta1, omega1, theta2, omega2 = S
    return [
        dthe1dt_f(omega1),
        dz1dt_f(t, g, m1, m2, l1, l2, theta1, theta2, omega1, omega2, w, k,c),
        dthe2dt_f(omega2),
        dz2dt_f(t, g, m1, m2, l1, l2, theta1, theta2, omega1, omega2, w, k,c),
    ]

m1,m2,l1,l2,w =  [0.31069+0.118, 0.13139, 0.2315, 0.2 ,0.03]
I1 = 0.005822240404356
I2 = 0.001682464671227
g = 9.81
k = 1.76e-5
c = 5.08e-6


def close():
    sock.close()
    print("Socket closed")
   
# Tare zero angle
def reset_zero_position(event):
    try:
        with send_lock:
            sock.send("RESET\n".encode())
        print("Zero position reset command sent")
    except Exception as e:
        print(f"Reset failed: {e}")

# Connect to ESP32 via access point through port
def connect_esp():
    try:
        sock.connect((ESP_IP, PORT))
        sock.settimeout(0.1) 
        print("Successfully connected to ESP32")
    except Exception as e:
        print(f"Connection error: {e}")
        sys.exit(1)

# Receiver thread for continuous data reception
def receiver_thread():
    global latestangles,sensortime
    buffer = ""
    while True:
        try:
            with send_lock:
                data = sock.recv(1024).decode()
            if data:
                buffer += data
                while '\n' in buffer:
                    line, buffer = buffer.split('\n', 1)
                    if ',' in line:
                        try:
                            # Split data sent from ESP32
                            stime, a1, a2 = map(float, line.strip().split(','))
                            a2 = a2-a1
                            # angle2 = (a2 + a1)%180
                            angle1 = -np.radians(a1)
                            angle2 = np.radians(a2)
                            angle1 = ((angle1 + np.pi) % (2*np.pi)) - np.pi
                            angle2 = ((angle2 + np.pi) % (2*np.pi)) - np.pi
                            with data_lock:
                                
                                #latestangles = (math.radians(a1), math.radians(angle2))
                                latestangles = (angle1, angle2)
                                sensortime= stime

                        #for smoothness in case value error, but arduino code already returns 0.0 when it doesnt read any values
                        except ValueError:
                            print(f"Ignoring invalid data: {line}")
        except socket.timeout:
            continue
        except Exception as e:
            print(f"Receive error: {e}")
            break

# Mode selection callback function for defined modes
def modeselect(label):
    global current_mode, simulationstate
    with data_lock:
        dt = 0.05
        # get current angles from sensor 
        current_theta1, current_theta2 = latestangles
        current_mode = label
        # compute omega1 and omega2 based on data_history if available
        if data_history:
            last_theta1, last_omega1, last_theta2, last_omega2 = data_history[-1]
            # Calculate angle differences with unwrapping
            dtheta1 = (current_theta1 - last_theta1 + np.pi) % (2 * np.pi) - np.pi
            dtheta2 = (current_theta2 - last_theta2 + np.pi) % (2 * np.pi) - np.pi
            omega1 = dtheta1 / dt
            omega2 = dtheta2 / dt
        # runs this else when program first runs
        else:
            omega1 = omega2 = 0.0
        if current_mode == 'Simulation':
            # Update simulationstate in-place
            simulationstate[:] = [current_theta1, omega1, current_theta2, omega2]
        
def stateestimate_function(x,dt):
    
    projected_state = odeint(dSdt, x, [0, 10*dt])
    theta1,omega1,theta2,omega2 = projected_state[-1]
    theta1 = ((theta1 + np.pi) % (2 * np.pi)) - np.pi
    theta2 = ((theta2 + np.pi) % (2 * np.pi)) - np.pi

    return np.array([theta1,omega1,theta2,omega2])

def residual_x(a, b):

    dx = a - b
    # Wrap theta1
    dx[0] = (dx[0] + np.pi) % (2 * np.pi) - np.pi
    # Wrap theta2
    dx[2] = (dx[2] + np.pi) % (2 * np.pi) - np.pi
    return dx

def residual_z(a, b):
    dz = a - b
    dz[0] = (dz[0] + np.pi) % (2 * np.pi) - np.pi 
    dz[1] = (dz[1] + np.pi) % (2 * np.pi) - np.pi  
    return dz

def measurement_function(x):

    theta1 = ((x[0] + np.pi) % (2 * np.pi)) - np.pi
    theta2 = ((x[2] + np.pi) % (2 * np.pi)) - np.pi
    return np.array([theta1, theta2])

#Sigma sample points
SigmaPoints = MerweScaledSigmaPoints(4, alpha=1e-3, beta=2., kappa=0)
dt = 0.05
ukf = UnscentedKalmanFilter(dim_x=4, dim_z=2, dt=dt,fx=stateestimate_function,hx=measurement_function, points=SigmaPoints, residual_x= residual_x,residual_z=residual_z)

ukf.x = np.array([latestangles[0],0,latestangles[1],0])

#Initial covariance matrix for process (Ode)
ukf.P =  np.diag([math.radians(52.58), math.radians(548.58), math.radians(122.61), math.radians(1258.42)])
#Initialise process noise, these will update during the run, use the max rms noise for sensor and prediction of 1
ukf.Q = np.diag([0.1,0.1,0.1,0.1]) #could be optimised more
#Measurement Noise for 12 bit sensor 
sensorthetavar = ((360/4096)/0.1)**2 + 2.25e-4
ukf.R = np.diag([sensorthetavar, sensorthetavar])
ukf.predict()
covariance_history.append(ukf.P)
            

# Initialise the plot axes and elements
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 8))
ax1.set_xlim(-(l1+l2+0.1), l1+l2+0.1)
ax1.set_ylim(-(l1+l2+0.1), l1+l2+0.1)
ax1.set_aspect('equal')
ax1.set_title("Double Pendulum Animation")
ax1.set_xlabel('Angular Displacement (m)')
ax1.set_ylabel('Angular Displacement (m)')

theta_text = ax1.text(0.05, 0.95, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder = 1000)
sensorangle_text = ax1.text(0.05, 0.75, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder = 1000)
omega_text = ax1.text(0.05, 0.85, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder = 1000)
deviation_text = ax1.text(0.05, 1.5, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder = 1000)
time_text = ax1.text(0.05, 0.65, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder = 1000)
ax1.grid()
actualtime = ax1.text(0.05, 0.6, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder=1000)
sensortimetext= ax1.text(0.05,0.55, '', transform=ax1.transAxes, fontsize=12, verticalalignment='top', zorder=1000)
#Phase space plot initialisation
ax2.set_title("Phase Space")
ax2.set_xlabel("Angle (rad)")
ax2.set_ylabel("Angular Velocity (rad/s)")
ax2.grid(True)
ax2.set_ylim(-50, 50)
ax2.set_xlim(-np.pi, np.pi)
phase_line1, = ax2.plot([], [], 'b', lw=1, alpha=0.5, label='Theta1')
phase_line2, = ax2.plot([], [], 'r', lw=1, alpha=0.5, label='Theta2')
ax2.legend()

#Control widgets
radio_ax = plt.axes([0.001, 0.8, 0.12, 0.15])
mode_radio = RadioButtons(radio_ax, ("Prediction",'Simulation Assisted', "Simulation",'Tracking'))
mode_radio.on_clicked(modeselect)

reset_ax = plt.axes([0.001, 0.7, 0.1, 0.075])
reset_btn = Button(reset_ax, 'Tare Angle', color='White')
reset_btn.on_clicked(reset_zero_position)

#Pendulum graphical elements

projectedline1, = ax1.plot([], [], 'blue', lw=20,zorder = 20, alpha = 0.3)
projectedline2, = ax1.plot([], [], 'blue', lw=20,zorder = 20,alpha = 0.3)
joint1 = ax1.scatter(0, 0, s=50, c='black', zorder=500)
joint2 = ax1.scatter([], [],s=50, c='black',zorder=1000)


GLOBAL_START_TIME = None

# Animation update function
sensortime = None
def animate(frame, simulationstate, data_history, theta1dev, theta2dev, deviationtime,starttime):
    

    global time_elapsed, GLOBAL_START_TIME, latestangles,sensortime
    #Symbolic takes a bit of time to compute so initialise time when animation actually starts.
    if GLOBAL_START_TIME is None:
        GLOBAL_START_TIME = time.time()
    if sensortime is None:
        sensortime = 0;
    try:
        timebenchmark = time.time()
        #initialise dt to calculate omega in sensor mode
        dt = 0.05
        theta1devcurrent = 0.0
        theta2devcurrent = 0.0
        realtime = time.time() - GLOBAL_START_TIME
        time_text.set_text(f'Model Running Time: {time_elapsed:.2f} s')
        if current_mode == 'Tracking':
            projectedline1, = ax1.plot([], [], 'grey', lw=20,zorder = 20)
            projectedline2, = ax1.plot([], [], 'grey', lw=20,zorder = 20)
            with data_lock:
                if data_history:
                    current_theta1, current_theta2 = latestangles
                    last_theta1, last_omega1, last_theta2, last_omega2 = data_history[-1]
                    #Angle unwrapping for omega
                    dtheta1 = (last_theta1 - current_theta1 + np.pi) % (2*np.pi) - np.pi
                    dtheta2 = (last_theta2 - current_theta2 + np.pi) % (2*np.pi) - np.pi
                    omega1 = dtheta1 / dt
                    omega2 = dtheta2 / dt
                    projected_state = [current_theta1, omega1, current_theta2, omega2]
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state
                
                else :
                    omega1 = 0;
                    omega2 = 0;
                    
                projected_state = [current_theta1, omega1, current_theta2, omega2]
                projected_theta1, projected_omega1, projected_theta2, projected_omega2 = projected_state                
                new_state = (current_theta1, omega1, current_theta2, omega2)
                data_history.append(new_state)
                projected_history.append(projected_state)
                theta1, omega1, theta2, omega2 = new_state
                x1_projected = l1 * math.sin(projected_theta1)
                y1_projected = -l1 * math.cos(projected_theta1)
                x2_projected = x1_projected + l2 * math.sin(projected_theta2)
                y2_projected = y1_projected - l2 * math.cos(projected_theta2)
                
        elif current_mode == "Prediction":
            projectedline1, = ax1.plot([], [], 'grey', lw=20,zorder = 20)
            projectedline2, = ax1.plot([], [], 'grey', lw=20,zorder = 20)
            #Get current angles (+ transmission delay) through wifi
            with data_lock:
                current_theta1, current_theta2 = latestangles

            if data_history:
                try:
                    last_theta1, last_omega1, last_theta2, last_omega2 = data_history[-1]
                    #Angle unwrapping for omega
                    dtheta1 = (last_theta1 - current_theta1 + np.pi) % (2*np.pi) - np.pi
                    dtheta2 = (last_theta2 - current_theta2 + np.pi) % (2*np.pi) - np.pi
                    
                    omega1 = dtheta1 / dt
                    omega2 = dtheta2 / dt

                   
                    delay = realtime-sensortime
                    delay_history.append(delay)

                    #Updating then predicting to reduce discrepancy
                    ukf.update(np.array([current_theta1,current_theta2]))
                    
                    ukf.predict()
                    covariance_history.append(ukf.P)                   
                    projected_state = ukf.x
                    projected_state[0] = ((projected_state[0] + np.pi) % (2*np.pi) - np.pi)
                    projected_state[2] = ((projected_state[2] + np.pi) % (2*np.pi) - np.pi)
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state

                   
                except:
                    #except condition for filter instability
                    print('Chaos might have occurred')
                    projected_state = [current_theta1, omega1, current_theta2, omega2]
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state
        
            else:
               try:
                    omega1 = omega2 = 0.0
                    #intial phase 
                    
                    ukf.update(np.array([current_theta1,current_theta2]))
                    ukf.predict()
                    covariance_history.append(ukf.P)
                    projected_state = ukf.x
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state
               except:
                    omega1 = omega2 = 0.0
                    projected_state = [current_theta1, omega1, current_theta2, omega2]
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state


            new_state = (current_theta1, omega1, current_theta2, omega2)
            data_history.append(new_state)
            projected_history.append(projected_state)
            theta1, omega1, theta2, omega2 = new_state
            x1_projected = l1 * math.sin(projected_theta1)
            y1_projected = -l1 * math.cos(projected_theta1)
            x2_projected = x1_projected + l2 * math.sin(projected_theta2)
            y2_projected = y1_projected - l2 * math.cos(projected_theta2) 
            
        elif current_mode == "Simulation Assisted":
            projectedline1, = ax1.plot([], [], 'blue', lw=20,zorder = 20)
            projectedline2, = ax1.plot([], [], 'blue', lw=20,zorder = 20)
            #Get current angles (+ transmission delay) through wifi
            with data_lock:
                current_theta1, current_theta2 = latestangles

            if data_history:
                    last_theta1, last_omega1, last_theta2, last_omega2 = data_history[-1]
                    #Angle unwrapping for omega
                    dtheta1 = (last_theta1 - current_theta1 + np.pi) % (2*np.pi) - np.pi
                    dtheta2 = (last_theta2 - current_theta2 + np.pi) % (2*np.pi) - np.pi
                    
                    omega1 = dtheta1 / dt
                    omega2 = dtheta2 / dt

                   
                    delay = realtime-sensortime
                    delay_history.append(delay)

                    #projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay])[-1]
                    projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay+(9*dt)])[-1]

                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state
                    
                    projected_state[0] = ((projected_state[0] + np.pi) % (2*np.pi) - np.pi)
                    projected_state[2] = ((projected_state[2] + np.pi) % (2*np.pi) - np.pi)
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state

                   
        
            else:
                    omega1 = omega2 = 0.0
                    #projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay])[-1]
                    #adjusting how far the prediction is made
                    projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay+(9*dt)])[-1]
                    projected_state[0] = ((projected_state[0] + np.pi) % (2*np.pi) - np.pi)
                    projected_state[2] = ((projected_state[2] + np.pi) % (2*np.pi) - np.pi)
                    projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state


            new_state = (current_theta1, omega1, current_theta2, omega2)
            data_history.append(new_state)
            projected_history.append(projected_state)
            theta1, omega1, theta2, omega2 = new_state
            x1_projected = l1 * math.sin(projected_theta1)
            y1_projected = -l1 * math.cos(projected_theta1)
            x2_projected = x1_projected + l2 * math.sin(projected_theta2)
            y2_projected = y1_projected - l2 * math.cos(projected_theta2)    
        
        
        else:
            # Simulation mode
            projectedline1, = ax1.plot([], [], 'blue', lw=20,zorder = 20, alpha = 0.3)
            projectedline2, = ax1.plot([], [], 'blue', lw=20,zorder = 20,alpha = 0.3)
            t = [realtime, realtime + dt]
            new_state = odeint(dSdt, simulationstate, t)[-1]
            simulationstate[:] = new_state
            theta1, omega1, theta2, omega2 = new_state
            theta1 = (theta1 + np.pi) % (2 * np.pi) - np.pi
            theta2 = (theta2 + np.pi) % (2 * np.pi) - np.pi
            data_history.append((theta1, omega1, theta2, omega2))
            theta1 
            delay = 0
            #calculate deviation in simulation mode
            theta1devcurrent = theta1-latestangles[0]
            theta2devcurrent = theta2-latestangles[1]
            theta1dev.append(theta1devcurrent)
            theta2dev.append(theta2devcurrent)
            theta1 = (theta1 + np.pi) % (2 * np.pi) - np.pi
            theta2 = (theta2 + np.pi) % (2 * np.pi) - np.pi
            projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay])[-1]
            projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state
            projected_history.append(projected_state)

            projected_state = odeint(dSdt, data_history[-1], [realtime, realtime+delay])[-1]
            projected_theta1,projected_omega1,projected_theta2,projected_omega2 = projected_state

            x1_projected = l1 * math.sin(projected_theta1)
            y1_projected = -l1 * math.cos(projected_theta1)
            x2_projected = x1_projected + l2 * math.sin(projected_theta2)
            y2_projected = y1_projected - l2 * math.cos(projected_theta2)
    
    
    
        time_elapsed += dt
        time_data.append(realtime)
        sensortime_data.append(sensortime)
        
        
        projectedline1.set_data([0, x1_projected], [0, y1_projected ])
        projectedline2.set_data([x1_projected, x2_projected], [y1_projected, y2_projected])
        joint1.set_offsets([[0, x1_projected]])
        joint2.set_offsets([[x1_projected, y1_projected]])
        
        recent_data = data_history[-no_points:]
        #check if there is recent data
        if recent_data:
            th1, om1, th2, om2 = zip(*recent_data)

        else:
            th1, om1, th2, om2 = ([], [], [], [])
        
        projectedtheta1_history.append(projected_theta1)  
        n = min(len(time_data), len(th1), len(projectedtheta1_history))
        phase_line1.set_data(th1[-n:], om1[-n:])
        phase_line2.set_data(th2[-n:], om2[-n:])
  
        
        theta_text.set_text(f'Predicted Theta1: {math.degrees(projected_theta1):.2f}\nPredicted Theta2: {math.degrees(projected_theta2):.2f}')
        deviation_text.set_text(f'Theta 1 deviation: {math.degrees(theta1devcurrent)%360:.2f}\nTheta 2 deviation: {math.degrees(theta2devcurrent)%360:.2f}')
        sensorangle_text.set_text(f'Sensor 1 Angle: {math.degrees(latestangles[0]):.2f}\nSensor 2 Angle: {math.degrees(latestangles[1]):.2f}')
        omega_text.set_text(f'Omega1: {math.degrees(omega1):.2f}°/s\n'f'Omega2: {math.degrees(omega2):.2f}°/s')
        time_text.set_text(f'Time Elapsed Model: {(time_elapsed):.2f}')
        actualtime.set_text(f'Actual Time Elapsed: {(realtime):.2f}')
        sensortimetext.set_text(f'Time Elapsed Sensor: {(sensortime):.2f}')

   
    except Exception as e:
        print(f"Animation error: {e}")
    
    return joint2,phase_line1, phase_line2, projectedline1,projectedline2, theta_text, omega_text,sensorangle_text, deviation_text, time_text, actualtime, sensortimetext


# Initialise connection and start the receiver thread
connect_esp()
threading.Thread(target=receiver_thread, daemon=True).start()

# Start the animation loop
ani = animation.FuncAnimation(fig, animate, frames =None,fargs=(simulationstate, data_history, theta1dev, theta2dev, deviationtime, starttime), interval=20,blit=True, cache_frame_data=False)



def on_close(event):
    close()
    datahistory_array = np.array(data_history)
    projected_array = np.array(projected_history)
    diff1 = np.subtract(np.degrees(projected_array[:,0]),np.degrees(datahistory_array[:,0]))
    diff2 = np.subtract(np.degrees(projected_array[:,2]),np.degrees(datahistory_array[:,2]))                                        
    datahistory_array[:,0] = np.degrees(datahistory_array[:,0])
    datahistory_array[:,2] = np.degrees(datahistory_array[:,2])
    data = np.column_stack((datahistory_array[:,0], datahistory_array[:,2]))
    dataexp = pd.DataFrame(data, columns=['theta 1', 'theta 2'])
    fig2, (ax5, ax6, ax7) = plt.subplots(1, 3, figsize=(16, 8),gridspec_kw={'width_ratios': [1, 1,1]})
    dataexp['time'] = time_data
    dataexp['sensortime'] = sensortime_data
    errorline1 = ax5.plot(time_data,diff1,'blue', label = 'Error 1',zorder = 10)
    errorline2 = ax5.plot(time_data ,diff2,'red', label = 'Error 2',zorder = 1)
    ax5.legend()
    actualline1 = ax6.plot(time_data, projected_array[:,0],'blue', label = 'Theta 1 Future',zorder = 10)
    projectedline1 = ax6.plot(time_data, np.radians(datahistory_array[:,0]), 'red',label = 'Theta 1 Actual',zorder = 1)
    ax6.legend()
    projectedline2 = ax7.plot(time_data, projected_array[:,2], 'blue',label = 'Theta 2 Future',zorder = 1)    
    actualline2 = ax7.plot(time_data, np.radians(datahistory_array[:,2]),'red' ,label = 'Theta 2 Actual',zorder = 10)
    ax7.legend()
    dataexp['theta 1 projected'] = np.degrees(projected_array[:, 0])
    dataexp['theta 2 projected'] = np.degrees(projected_array[:, 2])
    dataexp['omega1'] =np.degrees(datahistory_array[:, 1])
    dataexp['omega2'] =np.degrees(datahistory_array[:, 3])
    dataexp['diff1'] = pd.Series(diff1)
    dataexp['diff2'] = pd.Series(diff2)
    #file saved to current program directory with name in quotations
    dataexp.to_excel('data_history2.xlsx')

    print("Closed.")
#Trigger closing event
fig.canvas.mpl_connect('close_event', on_close)

plt.show()
