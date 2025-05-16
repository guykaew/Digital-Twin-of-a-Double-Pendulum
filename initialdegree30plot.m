close all
figure(1)
subplot(1,2,1)

data = Angle30Trial2;  % Original data is loaded here

I1 = ~isnan(data.Theta1_1);
plot(data.Time_1(I1) - data.Time_1(1), data.Theta1_1(I1), 'Color', 'r') 
hold on 

I2 = ~isnan(data.Theta1_2);
plot(data.Time_2(I2) - data.Time_2(1), data.Theta1_2(I2), 'Color', '#D95319') 

I3 = ~isnan(data.Theta1_3);
plot(data.Time_3(I3) - data.Time_3(1), data.Theta1_3(I3), 'Color', 'yellow') 

I4 = ~isnan(data.Theta1_4);
plot(data.Time_4(I4) - data.Time_4(1), data.Theta1_4(I4), 'Color', 'green') 

I5 = ~isnan(data.Theta1_5);
plot(data.Time_5(I5) - data.Time_5(1), data.Theta1_5(I5), 'Color', 'blue') 

I6 = ~isnan(data.Theta1_6);
plot(data.Time_6(I6) - data.Time_6(1), data.Theta1_6(I6), 'Color', 'cyan') 

I7 = ~isnan(data.Theta1_7);
plot(data.Time_7(I7) - data.Time_7(1), data.Theta1_7(I7), 'Color', 'magenta') 

I8 = ~isnan(data.Theta1_8);
plot(data.Time_8(I8) - data.Time_8(1), data.Theta1_8(I8), 'Color', [0.6350 0.0780 0.1840]) 

I9 = ~isnan(data.Theta1_9);
plot(data.Time_9(I9) - data.Time_9(1), data.Theta1_9(I9), 'Color', '#77AC30') 

I10 = ~isnan(data.Theta1_10);
plot(data.Time_10(I10) - data.Time_10(1), data.Theta1_10(I10), 'Color', [0.3010 0.7450 0.9330]) 

grid on
title(['\theta1 vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-40 40])
xlabel('Time (s)')
ylabel('\theta1 (degrees)')

subplot(1,2,2)

plot(data.Time_1(I1) - data.Time_1(1), data.Theta1P_1(I1), 'Color', 'r') 
hold on 
plot(data.Time_2(I2) - data.Time_2(1), data.Theta1P_2(I2), 'Color', '#D95319') 
plot(data.Time_3(I3) - data.Time_3(1), data.Theta1P_3(I3), 'Color', 'yellow') 
plot(data.Time_4(I4) - data.Time_4(1), data.Theta1P_4(I4), 'Color', 'green') 
plot(data.Time_5(I5) - data.Time_5(1), data.Theta1P_5(I5), 'Color', 'blue') 
plot(data.Time_6(I6) - data.Time_6(1), data.Theta1P_6(I6), 'Color', 'cyan') 
plot(data.Time_7(I7) - data.Time_7(1), data.Theta1P_7(I7), 'Color', 'magenta') 
plot(data.Time_8(I8) - data.Time_8(1), data.Theta1P_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(data.Time_9(I9) - data.Time_9(1), data.Theta1P_9(I9), 'Color', '#77AC30') 
plot(data.Time_10(I10) - data.Time_10(1), data.Theta1P_10(I10), 'Color', [0.3010 0.7450 0.9330])

title(['\theta1 Projected vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-50 50])
xlabel('Time (s)')
ylabel('\theta1 Projected (degrees)')
set(1, 'WindowState', 'maximized')
saveas(gcf, 'Theta1_30_10TrialPlot.png')


figure(2)
subplot(1,2,1)
plot(data.Time_1(I1) - data.Time_1(1), data.Theta2_1(I1), 'Color', 'r') 
hold on 
plot(data.Time_2(I2) - data.Time_2(1), data.Theta2_2(I2), 'Color', '#D95319') 
plot(data.Time_3(I3) - data.Time_3(1), data.Theta2_3(I3), 'Color', 'yellow') 
plot(data.Time_4(I4) - data.Time_4(1), data.Theta2_4(I4), 'Color', 'green') 
plot(data.Time_5(I5) - data.Time_5(1), data.Theta2_5(I5), 'Color', 'blue') 
plot(data.Time_6(I6) - data.Time_6(1), data.Theta2_6(I6), 'Color', 'cyan') 
plot(data.Time_7(I7) - data.Time_7(1), data.Theta2_7(I7), 'Color', 'magenta') 
plot(data.Time_8(I8) - data.Time_8(1), data.Theta2_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(data.Time_9(I9) - data.Time_9(1), data.Theta2_9(I9), 'Color', '#77AC30') 
plot(data.Time_10(I10) - data.Time_10(1), data.Theta2_10(I10), 'Color', [0.3010 0.7450 0.9330])

title(['\theta2 vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
grid on
ylim([-80 80])
xlabel('Time (s)')
ylabel('\theta2 (degrees)')

subplot(1,2,2)
plot(data.Time_1(I1) - data.Time_1(1), data.Theta2P_1(I1), 'Color', 'r') 
hold on 
plot(data.Time_2(I2) - data.Time_2(1), data.Theta2P_2(I2), 'Color', '#D95319') 
plot(data.Time_3(I3) - data.Time_3(1), data.Theta2P_3(I3), 'Color', 'yellow') 
plot(data.Time_4(I4) - data.Time_4(1), data.Theta2P_4(I4), 'Color', 'green') 
plot(data.Time_5(I5) - data.Time_5(1), data.Theta2P_5(I5), 'Color', 'blue') 
plot(data.Time_6(I6) - data.Time_6(1), data.Theta2P_6(I6), 'Color', 'cyan') 
plot(data.Time_7(I7) - data.Time_7(1), data.Theta2P_7(I7), 'Color', 'magenta') 
plot(data.Time_8(I8) - data.Time_8(1), data.Theta2P_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(data.Time_9(I9) - data.Time_9(1), data.Theta2P_9(I9), 'Color', '#77AC30') 
plot(data.Time_10(I10) - data.Time_10(1), data.Theta2P_10(I10), 'Color', [0.3010 0.7450 0.9330])

title(['\theta2 Projected vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-140 140])
xlabel('Time (s)')
ylabel('\theta2 Projected (degrees)')
set(2, 'WindowState', 'maximized')
saveas(gcf, 'Theta2_30_10TrialPlot.png')


% Error Plot
figure(3)
subplot(1,2,1)
plot(data.Time_1(I1) - data.Time_1(1), data.Diff1_1(I1), 'Color', 'r') 
hold on 
plot(data.Time_2(I2) - data.Time_2(1), data.Diff1_2(I2), 'Color', '#D95319') 
plot(data.Time_3(I3) - data.Time_3(1), data.Diff1_3(I3), 'Color', 'yellow') 
plot(data.Time_4(I4) - data.Time_4(1), data.Diff1_4(I4), 'Color', 'green') 
plot(data.Time_5(I5) - data.Time_5(1), data.Diff1_5(I5), 'Color', 'blue') 
plot(data.Time_6(I6) - data.Time_6(1), data.Diff1_6(I6), 'Color', 'cyan') 
plot(data.Time_7(I7) - data.Time_7(1), data.Diff1_7(I7), 'Color', 'magenta') 
plot(data.Time_8(I8) - data.Time_8(1), data.Diff1_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(data.Time_9(I9) - data.Time_9(1), data.Diff1_9(I9), 'Color', '#77AC30') 
plot(data.Time_10(I10) - data.Time_10(1), data.Diff1_10(I10), 'Color', [0.3010 0.7450 0.9330])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
title(['Error 1 for 30' char(176) 'initial angle for 10 trials'])
ylim([-80 80])
xlabel('Time (s)')
ylabel('Error 1 (degrees)')


subplot(1,2,2)
plot(data.Time_1(I1) - data.Time_1(1), data.Diff2_1(I1), 'Color', 'r') 
hold on 
plot(data.Time_2(I2) - data.Time_2(1), data.Diff2_2(I2), 'Color', '#D95319') 
plot(data.Time_3(I3) - data.Time_3(1), data.Diff2_3(I3), 'Color', 'yellow') 
plot(data.Time_4(I4) - data.Time_4(1), data.Diff2_4(I4), 'Color', 'green') 
plot(data.Time_5(I5) - data.Time_5(1), data.Diff2_5(I5), 'Color', 'blue') 
plot(data.Time_6(I6) - data.Time_6(1), data.Diff2_6(I6), 'Color', 'cyan') 
plot(data.Time_7(I7) - data.Time_7(1), data.Diff2_7(I7), 'Color', 'magenta') 
plot(data.Time_8(I8) - data.Time_8(1), data.Diff2_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(data.Time_9(I9) - data.Time_9(1), data.Diff2_9(I9), 'Color', '#77AC30') 
plot(data.Time_10(I10) - data.Time_10(1), data.Diff2_10(I10), 'Color', [0.3010 0.7450 0.9330])
grid on
title(['Error 2 for 30' char(176) 'initial angle for 10 trials'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-200 200])
xlabel('Time (s)')
ylabel('Error 2 (degrees)')
set(3, 'WindowState', 'maximized')
saveas(gcf, 'Error_30_10TrialPlot.png')

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

%Compute RMS error for each theta2 error column.
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
title(['RMS Errors for initial angle of 30' char(176)])
xlabel('Trial Number')
ylabel('RMS Error (degrees)')
hold on
plot(1:10, rmstheta2, 'b')
grid on
legend('\theta1','\theta2')
meanrmstheta1 = mean(rmstheta1);
meanrmstheta2 = mean(rmstheta2);
totalrms = meanrmstheta1 + meanrmstheta2;
annotation('textbox', [0.15, 0.80, 0.1, 0.1],'String', sprintf('Mean RMS:\n\\theta1: %.2f\n\\theta2: %.2f\nTotal: %.2f',meanrmstheta1, meanrmstheta2, totalrms),'FitBoxToText', 'on', 'EdgeColor', 'none');
saveas(gcf, 'rmserror30.png')


figure(5)
subplot(2,2,1)
plot(data.Time_1,data.Theta1_1)
title('\theta1 vs. Time')
xlabel('Time (s)')
ylabel('\theta1 (degrees)')
grid on
subplot(2,2,2)
plot(data.Time_1,data.Theta1P_1)
title('\theta1 Projected vs. Time')
xlabel('Time (s)')
ylabel('\theta1 Projected (degrees)')
grid on
subplot(2,2,3)
plot(data.Time_1,data.Theta2_1)
title('\theta2 vs. Time')
xlabel('Time (s)')
ylabel('\theta2 (degrees)')
grid on
subplot(2,2,4)
plot(data.Time_1,data.Theta2P_1)
title('\theta2 Projected vs. Time')
xlabel('Time (s)')
ylabel('\theta2 Projected (degrees)')
grid on
set(5, 'WindowState', 'maximized')
saveas(gcf,'plotcomparison.png')

figure(6)
subplot(1,2,1)
plot(data.Time_1,data.Theta1_1,color='r')
hold on
plot(data.Time_1,data.Theta1P_1, color = 'b')
legend('Actual', 'Projected')
title('Actual vs. Projected for first pendulum')
ylim([0 20])
xlim([35 50])
xlabel('Time (s)')
ylabel('\theta1 (degrees)')
grid on
subplot(1,2,2)
plot(data.Time_1,data.Theta2_1,color='r')
hold on
plot(data.Time_1,data.Theta2P_1, color = 'b')
legend('Actual', 'Projected')
title('Actual vs. Projected for second pendulum')
grid on
ylim([0 35])
xlim([35 50])
xlabel('Time (s)')
ylabel('\theta2 (degrees)')
set(6, 'WindowState', 'maximized')
saveas(gcf,'actualvspredicted.png')

% Plot the histograms
%Calculating and finding acceleration for theta1
% acc1_1 = diff(diff(data.Theta1_1(I1)))
% acc1_2 = diff(diff(data.Theta1_2(I2)))
% acc1_3 = diff(diff(data.Theta1_3(I3)))
% acc1_4 = diff(diff(data.Theta1_4(I4)))
% acc1_5 = diff(diff(data.Theta1_5(I5)))
% acc1_6 = diff(diff(data.Theta1_6(I6)))
% acc1_7 = diff(diff(data.Theta1_7(I7)))
% acc1_8 = diff(diff(data.Theta1_8(I8)))
% acc1_9 = diff(diff(data.Theta1_9(I9)))
% acc1_10 = diff(diff(data.Theta1_10(I10)))
acc1_1 = data.Theta1_1(I1)
acc1_2 = data.Theta1_2(I2)
acc1_3 = data.Theta1_3(I3)
acc1_4 = data.Theta1_4(I4)
acc1_5 = data.Theta1_5(I5)
acc1_6 = data.Theta1_6(I6)
acc1_7 = data.Theta1_7(I7)
acc1_8 = data.Theta1_8(I8)
acc1_9 = data.Theta1_9(I9)
acc1_10 = data.Theta1_10(I10)

%Calculating and finding acceleration for theta2
acc2_1 = diff(diff(data.Theta2_1(I1)))
acc2_2 = diff(diff(data.Theta2_2(I2)))
acc2_3 = diff(diff(data.Theta2_3(I3)))
acc2_4 = diff(diff(data.Theta2_4(I4)))
acc2_5 = diff(diff(data.Theta2_5(I5)))
acc2_6 = diff(diff(data.Theta2_6(I6)))
acc2_7 = diff(diff(data.Theta2_7(I7)))
acc2_8 = diff(diff(data.Theta2_8(I8)))
acc2_9 = diff(diff(data.Theta2_9(I9)))
acc2_10 = diff(diff(data.Theta2_10(I10)))

% Create a combined array of all theta1 accelerations
acc1_combined = [acc1_1; acc1_2; acc1_3; acc1_4; acc1_5; acc1_6; acc1_7; acc1_8; acc1_9; acc1_10];

% Create a combined array of all theta2 accelerations
acc2_combined = [acc2_1; acc2_2; acc2_3; acc2_4; acc2_5; acc2_6; acc2_7; acc2_8; acc2_9; acc2_10];

figure(7)
subplot(1,2,1)
histogram(acc1_combined,20)
title('\theta1 Acceleration Histogram')
ylabel('Frequency')
xlabel('Acceleration')

subplot(1,2,2)
histogram(acc2_combined,20)
title('\theta2 Acceleration Histogram')
ylabel('Frequency')
xlabel('Acceleration')