close all
figure(1)
subplot(1,2,1)

data = Angle3010Trials;

I1 = ~isnan(data.Theta1);
plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Theta1(I1), 'Color', 'r') 
hold on 

I2 = ~isnan(data.Theta1_2);
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Theta1_2(I2), 'Color', '#D95319') 

I3 = ~isnan(data.Theta1_3);
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Theta1_3(I3), 'Color', 'yellow') 

I4 = ~isnan(data.Theta1_4);
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Theta1_4(I4), 'Color', 'green') 

I5 = ~isnan(data.Theta1_5);
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Theta1_5(I5), 'Color', 'blue') 

I6 = ~isnan(data.Theta1_6);
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Theta1_6(I6), 'Color', 'cyan') 

I7 = ~isnan(Angle3010Trials.Theta1_7);
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Theta1_7(I7), 'Color', 'magenta') 

I8 = ~isnan(Angle3010Trials.Theta1_8);
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Theta1_8(I8), 'Color', [0.6350 0.0780 0.1840]) 

I9 = ~isnan(Angle3010Trials.Theta1_9);
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Theta1_9(I9), 'Color', '#77AC30') 

I10 = ~isnan(Angle3010Trials.Theta1_10);
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Theta1_10(I10), 'Color', [0.3010 0.7450 0.9330]) 

grid on
title(['\theta1 vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-40 40])
xlabel('Time (s)')
ylabel('\theta1 (degrees)')


subplot(1,2,2)

plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Theta1Projected(I1), 'Color', 'r') 
hold on 
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Theta1Projected1(I2), 'Color', '#D95319') 
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Theta1Projected2(I3), 'Color', 'yellow') 
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Theta1Projected3(I4), 'Color', 'green') 
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Theta1Projected4(I5), 'Color', 'blue') 
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Theta1Projected5(I6), 'Color', 'cyan') 
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Theta1Projected6(I7), 'Color', 'magenta') 
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Theta1Projected7(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Theta1Projected8(I9), 'Color', '#77AC30') 
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Theta1Projected9(I10), 'Color', [0.3010 0.7450 0.9330])

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
plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Theta2(I1), 'Color', 'r') 
hold on 
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Theta2_2(I2), 'Color', '#D95319') 
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Theta2_3(I3), 'Color', 'yellow') 
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Theta2_4(I4), 'Color', 'green') 
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Theta2_5(I5), 'Color', 'blue') 
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Theta2_6(I6), 'Color', 'cyan') 
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Theta2_7(I7), 'Color', 'magenta') 
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Theta2_8(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Theta2_9(I9), 'Color', '#77AC30') 
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Theta2_10(I10), 'Color', [0.3010 0.7450 0.9330])

title(['\theta2 vs. Time for 10 trials at 30 ' char(176) 'initial angle'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
grid on
ylim([-80 80])
xlabel('Time (s)')
ylabel('\theta2 (degrees)')

subplot(1,2,2)
plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Theta2Projected(I1), 'Color', 'r') 
hold on 
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Theta2Projected1(I2), 'Color', '#D95319') 
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Theta2Projected2(I3), 'Color', 'yellow') 
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Theta2Projected3(I4), 'Color', 'green') 
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Theta2Projected4(I5), 'Color', 'blue') 
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Theta2Projected5(I6), 'Color', 'cyan') 
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Theta2Projected6(I7), 'Color', 'magenta') 
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Theta2Projected7(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Theta2Projected8(I9), 'Color', '#77AC30') 
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Theta2Projected9(I10), 'Color', [0.3010 0.7450 0.9330])

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
plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Error1(I1), 'Color', 'r') 
hold on 
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Error1_1(I2), 'Color', '#D95319') 
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Error1_2(I3), 'Color', 'yellow') 
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Error1_3(I4), 'Color', 'green') 
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Error1_4(I5), 'Color', 'blue') 
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Error1_5(I6), 'Color', 'cyan') 
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Error1_6(I7), 'Color', 'magenta') 
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Error1_7(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Error1_8(I9), 'Color', '#77AC30') 
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Error1_9(I10), 'Color', [0.3010 0.7450 0.9330])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
title(['Error 1 for 30' char(176) 'initial angle for 10 trials'])
ylim([-80 80])
xlabel('Time (s)')
ylabel('Error 1 (degrees)')

subplot(1,2,2)
plot(Angle3010Trials.Time(I1) - Angle3010Trials.Time(1), Angle3010Trials.Error2(I1), 'Color', 'r') 
hold on 
plot(Angle3010Trials.Time1(I2) - Angle3010Trials.Time1(1), Angle3010Trials.Error2_1(I2), 'Color', '#D95319') 
plot(Angle3010Trials.Time2(I3) - Angle3010Trials.Time2(1), Angle3010Trials.Error2_2(I3), 'Color', 'yellow') 
plot(Angle3010Trials.Time3(I4) - Angle3010Trials.Time3(1), Angle3010Trials.Error2_3(I4), 'Color', 'green') 
plot(Angle3010Trials.Time4(I5) - Angle3010Trials.Time4(1), Angle3010Trials.Error2_4(I5), 'Color', 'blue') 
plot(Angle3010Trials.Time5(I6) - Angle3010Trials.Time5(1), Angle3010Trials.Error2_5(I6), 'Color', 'cyan') 
plot(Angle3010Trials.Time6(I7) - Angle3010Trials.Time6(1), Angle3010Trials.Error2_6(I7), 'Color', 'magenta') 
plot(Angle3010Trials.Time7(I8) - Angle3010Trials.Time7(1), Angle3010Trials.Error2_7(I8), 'Color', [0.6350 0.0780 0.1840]) 
plot(Angle3010Trials.Time8(I9) - Angle3010Trials.Time8(1), Angle3010Trials.Error2_8(I9), 'Color', '#77AC30') 
plot(Angle3010Trials.Time9(I10) - Angle3010Trials.Time9(1), Angle3010Trials.Error2_9(I10), 'Color', [0.3010 0.7450 0.9330])
grid on
title(['Error 2 for 30' char(176) 'initial angle for 10 trials'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-200 200])
xlabel('Time (s)')
ylabel('Error 2 (degrees)')
set(3, 'WindowState', 'maximized')
saveas(gcf, 'Error_30_10TrialPlot.png')

data = Angle3010Trials;

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