close all
figure(1)
subplot(1,2,1)

I1 = ~isnan(data12degbackup.Theta1_1);
plot(data12degbackup.Time_1(I1), data12degbackup.Theta1_1(I1),Color='r') 
hold on 
I2 = ~isnan(data12degbackup.Theta1_2);
plot(data12degbackup.Time_2(I2), data12degbackup.Theta1_2(I2),Color="#D95319") 

I3 = ~isnan(data12degbackup.Theta1_3);
plot(data12degbackup.Time_3(I3), data12degbackup.Theta1_3(I3),Color='yellow') 

I4 = ~isnan(data12degbackup.Theta1_4);
plot(data12degbackup.Time_4(I4), data12degbackup.Theta1_4(I4),Color='green') 

I5 = ~isnan(data12degbackup.Theta1_5);
plot(data12degbackup.Time_5(I5), data12degbackup.Theta1_5(I5),Color='blue') 

I6 = ~isnan(data12degbackup.Theta1_6);
plot(data12degbackup.Time_6(I6), data12degbackup.Theta1_6(I6),Color='cyan') 

I7 = ~isnan(data12degbackup.Theta1_7);
plot(data12degbackup.Time_7(I7), data12degbackup.Theta1_7(I7),Color='magenta') 

I8 = ~isnan(data12degbackup.Theta1_8);
plot(data12degbackup.Time_8(I8), data12degbackup.Theta1_8(I8),Color=[0.6350 0.0780 0.1840]) 

I9 = ~isnan(data12degbackup.Theta1_9);
plot(data12degbackup.Time_9(I9), data12degbackup.Theta1_9(I9),Color="#77AC30") 

I10 = ~isnan(data12degbackup.Theta1_10);
plot(data12degbackup.Time_10(I10), data12degbackup.Theta1_10(I10),Color=[0.3010 0.7450 0.9330]) 
grid on
title(['\theta1 vs. Time for 10 trials at 12 ' char(176) 'initial angle'])
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
ylim([-20 20])
xlabel('Time (s)')
ylabel('\theta1 (degrees)')


subplot(1,2,2)

plot(data12degbackup.Time_1(I1), data12degbackup.Theta1P_1(I1),Color='r') 

hold on 

plot(data12degbackup.Time_2(I2), data12degbackup.Theta1P_2(I2),Color="#D95319") 

plot(data12degbackup.Time_3(I3), data12degbackup.Theta1P_3(I3),Color='yellow') 

plot(data12degbackup.Time_4(I4), data12degbackup.Theta1P_4(I4),Color='green') 

plot(data12degbackup.Time_5(I5), data12degbackup.Theta1P_5(I5),Color='blue') 

plot(data12degbackup.Time_6(I6), data12degbackup.Theta1P_6(I6),Color='cyan') 

plot(data12degbackup.Time_7(I7), data12degbackup.Theta1P_7(I7),Color='magenta') 

plot(data12degbackup.Time_8(I8), data12degbackup.Theta1P_8(I8),Color=[0.6350 0.0780 0.1840]) 

plot(data12degbackup.Time_9(I9), data12degbackup.Theta1P_9(I9),Color="#77AC30") 

plot(data12degbackup.Time_10(I10), data12degbackup.Theta1P_10(I10),Color=[0.3010 0.7450 0.9330])

title(['\theta1 Projected vs. Time for 10 trials at 12 ' char(176) 'initial angle'])
grid on
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
ylim([-20 20])
xlabel('Time (s)')
ylabel('\theta1 Projected (degrees)')
set(1, 'WindowState', 'maximized')
saveas(gcf,'Theta1_12_10TrialPlot.png')


figure(2)
subplot(1,2,1)
plot(data12degbackup.Time_1(I1), data12degbackup.Theta2_1(I1),Color='r') 

hold on 

plot(data12degbackup.Time_2(I2), data12degbackup.Theta2_2(I2),Color="#D95319") 

plot(data12degbackup.Time_3(I3), data12degbackup.Theta2_3(I3),Color='yellow') 

plot(data12degbackup.Time_4(I4), data12degbackup.Theta2_4(I4),Color='green') 

plot(data12degbackup.Time_5(I5), data12degbackup.Theta2_5(I5),Color='blue') 

plot(data12degbackup.Time_6(I6), data12degbackup.Theta2_6(I6),Color='cyan') 

plot(data12degbackup.Time_7(I7), data12degbackup.Theta2_7(I7),Color='magenta') 

plot(data12degbackup.Time_8(I8), data12degbackup.Theta2_8(I8),Color=[0.6350 0.0780 0.1840]) 

plot(data12degbackup.Time_9(I9), data12degbackup.Theta2_9(I9),Color="#77AC30") 

plot(data12degbackup.Time_10(I10), data12degbackup.Theta2_10(I10),Color=[0.3010 0.7450 0.9330])

title(['\theta2 vs. Time for 10 trials at 12 ' char(176) 'initial angle'])
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
grid on
ylim([-40 40])
xlabel('Time (s)')
ylabel('\theta2 (degrees)')


subplot(1,2,2)

plot(data12degbackup.Time_1(I1), data12degbackup.Theta2P_1(I1),Color='r') 

hold on 

plot(data12degbackup.Time_2(I2), data12degbackup.Theta2P_2(I2),Color="#D95319") 

plot(data12degbackup.Time_3(I3), data12degbackup.Theta2P_3(I3),Color='yellow') 

plot(data12degbackup.Time_4(I4), data12degbackup.Theta2P_4(I4),Color='green') 

plot(data12degbackup.Time_5(I5), data12degbackup.Theta2P_5(I5),Color='blue') 

plot(data12degbackup.Time_6(I6), data12degbackup.Theta2P_6(I6),Color='cyan') 

plot(data12degbackup.Time_7(I7), data12degbackup.Theta2P_7(I7),Color='magenta') 

plot(data12degbackup.Time_8(I8), data12degbackup.Theta2P_8(I8),Color=[0.6350 0.0780 0.1840]) 

plot(data12degbackup.Time_9(I9), data12degbackup.Theta2P_9(I9),Color="#77AC30") 

plot(data12degbackup.Time_10(I10), data12degbackup.Theta2P_10(I10),Color=[0.3010 0.7450 0.9330])

title(['\theta2 Projected vs. Time for 10 trials at 12 ' char(176) 'initial angle'])
grid on
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
ylim([-60 60])
xlabel('Time (s)')
ylabel('\theta2 Projected (degrees)')
set(2, 'WindowState', 'maximized')
saveas(gcf,'Theta2_12_10TrialPlot.png')

%Error Plot
figure(3)
subplot(1,2,1)

plot(data12degbackup.Time_1(I1), data12degbackup.Error1_1(I1),Color='r') 

hold on 

plot(data12degbackup.Time_2(I2), data12degbackup.Error1_2(I2),Color="#D95319") 

plot(data12degbackup.Time_3(I3), data12degbackup.Error1_3(I3),Color='yellow') 

plot(data12degbackup.Time_4(I4), data12degbackup.Error1_4(I4),Color='green') 

plot(data12degbackup.Time_5(I5), data12degbackup.Error1_5(I5),Color='blue') 

plot(data12degbackup.Time_6(I6), data12degbackup.Error1_6(I6),Color='cyan') 

plot(data12degbackup.Time_7(I7), data12degbackup.Error1_7(I7),Color='magenta') 

plot(data12degbackup.Time_8(I8), data12degbackup.Error1_8(I8),Color=[0.6350 0.0780 0.1840]) 

plot(data12degbackup.Time_9(I9), data12degbackup.Error1_9(I9),Color="#77AC30") 

plot(data12degbackup.Time_10(I10), data12degbackup.Error1_10(I10),Color=[0.3010 0.7450 0.9330])

grid on
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
title(['Error 1 for 12' char(176) 'initial angle for 10 trials'])
ylim([-60 60])
xlabel('Time (s)')
ylabel('Error 1 (degrees)')



subplot(1,2,2)

plot(data12degbackup.Time_1(I1), data12degbackup.Error2_1(I1),Color='r') 

hold on 

plot(data12degbackup.Time_2(I2), data12degbackup.Error2_2(I2),Color="#D95319") 

plot(data12degbackup.Time_3(I3), data12degbackup.Error2_3(I3),Color='yellow') 

plot(data12degbackup.Time_4(I4), data12degbackup.Error2_4(I4),Color='green') 

plot(data12degbackup.Time_5(I5), data12degbackup.Error2_5(I5),Color='blue') 

plot(data12degbackup.Time_6(I6), data12degbackup.Error2_6(I6),Color='cyan') 

plot(data12degbackup.Time_7(I7), data12degbackup.Error2_7(I7),Color='magenta') 

plot(data12degbackup.Time_8(I8), data12degbackup.Error2_8(I8),Color=[0.6350 0.0780 0.1840]) 

plot(data12degbackup.Time_9(I9), data12degbackup.Error2_9(I9),Color="#77AC30") 

plot(data12degbackup.Time_10(I10), data12degbackup.Error2_10(I10),Color=[0.3010 0.7450 0.9330])

grid on
title(['Error 2 for 12' char(176) 'initial angle for 10 trials'])
legend('Trial 1' ,'Trial 2' ,'Trial 3' ,'Trial 4' ,'Trial 5' ,'Trial 6' ,'Trial 7' ,'Trial 8' ,'Trial 9' ,'Trial 10' )
ylim([-80 80])
xlabel('Time (s)')
ylabel('Error 1 (degrees)')
set(3, 'WindowState', 'maximized')
saveas(gcf,'Error_12_10TrialPlot.png')

data = data12degbackup;

% Define the column indices that contain the error values.
error1index = 6:7:70;  % adjust these indices as needed
error2index = 7:7:70;

% Preallocate arrays for RMS errors.
rmstheta1 = zeros(length(error1index), 1);
rmstheta2 = zeros(length(error2index), 1);

% Compute RMS error for each theta1 error column.
for i = 1:length(error1index)
    col = error1index(i);
    dataArray = data{:, col};
    dataArray = dataArray(~isnan(dataArray));
    rmstheta1(i) = sqrt(mean(dataArray.^2));
end

% Compute RMS error for each theta2 error column.
for i = 1:length(error2index)
    col = error2index(i);
    dataArray = data{:, col};
    dataArray = dataArray(~isnan(dataArray));
    rmstheta2(i) = sqrt(mean(dataArray.^2));
end

disp('RMS error for theta1:')
disp(rmstheta1)
disp('RMS error for theta2:')
disp(rmstheta2)

figure(4)
plot(1:10, rmstheta1, 'r')
title(['RMS Errors for initial angle of 12' char(176)])
xlabel('Trial Number')
ylabel('RMS Error (degrees)')
ylim([0 40])
hold on
plot(1:10, rmstheta2, 'b')
grid on
legend('\theta1','\theta2')
meanrmstheta1 = mean(rmstheta1);
meanrmstheta2 = mean(rmstheta2);
totalrms = meanrmstheta1 + meanrmstheta2;
annotation('textbox', [0.15, 0.80, 0.1, 0.1],'String', sprintf('Mean RMS:\n\\theta1: %.2f\n\\theta2: %.2f\nTotal: %.2f',meanrmstheta1, meanrmstheta2, totalrms),'FitBoxToText', 'on', 'EdgeColor', 'none');
saveas(gcf, 'rmserror12.png')
