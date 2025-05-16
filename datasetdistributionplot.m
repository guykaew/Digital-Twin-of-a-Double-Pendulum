close all
figure(1)
subplot(1,2,1)
%datasets provided can be switched between data, data1, data2
%data1 = Angle13WithFilter;
data1 = data12degbackup
data = Angle20latest;  % Original data is loaded here
%data2 =  Angle30Trial2;
data2 = Deg30WithFilter
%data2 = Angle3010Trials
dt_13= CalcTimeDiff(data1);
dt_20= CalcTimeDiff(data);
dt_30= CalcTimeDiff(data2);
%Angle 13 data indexing
I113 = ~isnan(data1.Theta1_1);
I213 = ~isnan(data1.Theta1_2);
I313 = ~isnan(data1.Theta1_3);
I413 = ~isnan(data1.Theta1_4);
I513 = ~isnan(data1.Theta1_5);
I613 = ~isnan(data1.Theta1_6);
I713 = ~isnan(data1.Theta1_7);
I813 = ~isnan(data1.Theta1_8);
I913 = ~isnan(data1.Theta1_9);
I1013 = ~isnan(data1.Theta1_10);



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

%Indexing for 30 degree dataset

I130 = ~isnan(data2.Theta1_1);

I230 = ~isnan(data2.Theta1_2);

I330 = ~isnan(data2.Theta1_3);

I430 = ~isnan(data2.Theta1_4);

I530 = ~isnan(data2.Theta1_5);

I630 = ~isnan(data2.Theta1_6);

I730 = ~isnan(data2.Theta1_7);

I830 = ~isnan(data2.Theta1_8);

I930 = ~isnan(data2.Theta1_9);

I1030 = ~isnan(data2.Theta1_10);


grid on
title(['\theta1 vs. Time for 10 trials at 20 ' char(176) 'initial angle'])
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

title(['\theta1 Projected vs. Time for 10 trials at 20 ' char(176) 'initial angle'])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-50 50])
xlabel('Time (s)')
ylabel('\theta1 Projected (degrees)')
set(1, 'WindowState', 'maximized')
saveas(gcf, 'Theta1_20_10TrialPlot.png')


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

title(['\theta2 vs. Time for 10 trials at 20 ' char(176) 'initial angle'])
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

title(['\theta2 Projected vs. Time for 10 trials at 20 ' char(176) 'initial angle'])
grid on
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-140 140])
xlabel('Time (s)')
ylabel('\theta2 Projected (degrees)')
set(2, 'WindowState', 'maximized')
saveas(gcf, 'Theta2_20_10TrialPlot.png')


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
title(['Error 1 for 20' char(176) 'initial angle for 10 trials'])
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
title(['Error 2 for 20' char(176) 'initial angle for 10 trials'])
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6','Trial 7','Trial 8','Trial 9','Trial 10')
ylim([-200 200])
xlabel('Time (s)')
ylabel('Error 2 (degrees)')
set(3, 'WindowState', 'maximized')
saveas(gcf, 'Error_20_10TrialPlot.png')

% column indices where the error values are located. 
error1index = 6:7:70; 
error2index = 7:7:70;
theta1index = 1:7:70; 
theta2index = 2:7:70;
theta1pindex = 4:7:70;
theta2pindex = 5:7:70;
 
% Preallocate arrays
rmstheta1 = zeros(length(error1index), 1);
rmstheta2 = zeros(length(error2index), 1);

% Compute RMS error for each theta1 error column.
for i = 1:length(error1index)
    %col = error1index(i);
    col = theta1index(i);
    col2 = theta1pindex(i);
    %dataArray = data2{:, col};
    %dataArray = dataArray(~isnan(dataArray));
    theta1array = data{:,col};
    theta1array = theta1array(~isnan(theta1array))
    theta1parray = data{:,col2};
    theta1parray = theta1parray(~isnan(theta1parray))
    error1array = theta1array-theta1parray
    %rmstheta1(i) = sqrt(mean(dataArray.^2));
    rmstheta1(i) = sqrt(mean(error1array.^2));
end

% Compute RMS error for each theta2 error column.
for i = 1:length(error2index)
    %col = error2index(i);
    col = theta2index(i);
    col2 = theta2pindex(i);
    % dataArray = data2{:, col};
    % dataArray = dataArray(~isnan(dataArray));
    theta2array = data{:,col};
    theta2array = theta2array(~isnan(theta2array))
    theta2parray = data{:,col2};
    theta2parray = theta2parray(~isnan(theta2parray))
    error2array = theta2array-theta2parray
    %rmstheta2(i) = sqrt(mean(dataArray.^2));
    rmstheta2(i) = sqrt(mean(error2array.^2));

end

disp('RMS error for theta1:')
disp(rmstheta1)
disp('RMS error for theta2:')
disp(rmstheta2)

figure(4)
plot(1:10, rmstheta1, 'r')
title(['RMS Errors for initial angle of 20' char(176)])
xlabel('Trial Number')
ylim([0 40])
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
saveas(gcf,'plotcomparison20.png')

figure(6)
%subplot(1,2,1)
%plot(data2.Time_1,data2.Theta1_1,color='r')
%hold on
plot(data2.Time_1,data2.Theta1P_1, color = 'b')
%legend('Actual', 'Projected')
title('Predicted \theta1 Trajectory')
xlim([10 20])
ylim([-25 25])
xlabel('Time (s)')
ylabel('\theta1 (degrees)')
grid on
hold on
%subplot(1,2,2)
%plot(data2.Time_1,data2.Theta2_1,color='r')
%hold on
%plot(data2.Time_1,data2.Theta2P_1, color = 'r')
%legend('Actual', 'Projected')
%title('Actual vs. Projected for second pendulum')
grid on
%ylim([0 35])
%xlim([52 64])
xlabel('Time (s)')
ylabel('Predicted \theta1 (degrees)')
set(6, 'WindowState', 'maximized')
saveas(gcf,'actualvspredicted20.png')

%Calculating for 13 degrees for theta 1 and 2
%Theta 1
angle131_1 = data1.Theta1_1(I113);
angle131_2 = data1.Theta1_2(I213);
angle131_3 = data1.Theta1_3(I313);
angle131_4 = data1.Theta1_4(I413);
angle131_5 = data1.Theta1_5(I513);
angle131_6 = data1.Theta1_6(I613);
angle131_7 = data1.Theta1_7(I713);
angle131_8 = data1.Theta1_8(I813);
angle131_9 = data1.Theta1_9(I913);
angle131_10 = data1.Theta1_10(I1013);
%Theta 2
angle132_1 = data1.Theta2_1(I113);
angle132_2 = data1.Theta2_2(I213);
angle132_3 = data1.Theta2_3(I313);
angle132_4 = data1.Theta2_4(I413);
angle132_5 = data1.Theta2_5(I513);
angle132_6 = data1.Theta2_6(I613);
angle132_7 = data1.Theta2_7(I713);
angle132_8 = data1.Theta2_8(I813);
angle132_9 = data1.Theta2_9(I913);
angle132_10 = data1.Theta2_10(I1013);

%Calculating for 13 degrees omega 1 and 2
%Omega 1

omega131_1 = diff(data1.Theta1_1(I113))./dt_13{1};
omega131_2 = diff(data1.Theta1_2(I213))./dt_13{2};
omega131_3 = diff(data1.Theta1_3(I313))./dt_13{3};
omega131_4 = diff(data1.Theta1_4(I413))./dt_13{4};
omega131_5 = diff(data1.Theta1_5(I513))./dt_13{5};
omega131_6 = diff(data1.Theta1_6(I613))./dt_13{6};
omega131_7 = diff(data1.Theta1_7(I713))./dt_13{7};
omega131_8 = diff(data1.Theta1_8(I813))./dt_13{8};
omega131_9 = diff(data1.Theta1_9(I913))./dt_13{9};
omega131_10 = diff(data1.Theta1_10(I1013))./dt_13{10};

%Omega 2

omega132_1 = diff(data1.Theta2_1(I113))./dt_13{1};
omega132_2 = diff(data1.Theta2_2(I213))./dt_13{2};
omega132_3 = diff(data1.Theta2_3(I313))./dt_13{3};
omega132_4 = diff(data1.Theta2_4(I413))./dt_13{4};
omega132_5 = diff(data1.Theta2_5(I513))./dt_13{5};
omega132_6 = diff(data1.Theta2_6(I613))./dt_13{6};
omega132_7 = diff(data1.Theta2_7(I713))./dt_13{7};
omega132_8 = diff(data1.Theta2_8(I813))./dt_13{8};
omega132_9 = diff(data1.Theta2_9(I913))./dt_13{9};
omega132_10 = diff(data1.Theta2_10(I1013))./dt_13{10};

%Calculating for 20 deg theta 1
angle201_1 = data.Theta1_1(I1);
angle201_2 = data.Theta1_2(I2);
angle201_3 = data.Theta1_3(I3);
angle201_4 = data.Theta1_4(I4);
angle201_5 = data.Theta1_5(I5);
angle201_6 = data.Theta1_6(I6);
angle201_7 = data.Theta1_7(I7);
angle201_8 = data.Theta1_8(I8);
angle201_9 = data.Theta1_9(I9);
angle201_10 = data.Theta1_10(I10);

%Angle for theta1 of 30 degrees
angle301_1 = data2.Theta1_1(I130);
angle301_2 = data2.Theta1_2(I230);
angle301_3 = data2.Theta1_3(I330);
angle301_4 = data2.Theta1_4(I430);
angle301_5 = data2.Theta1_5(I530);
angle301_6 = data2.Theta1_6(I630);
angle301_7 = data2.Theta1_7(I730);
angle301_8 = data2.Theta1_8(I830);
angle301_9 = data2.Theta1_9(I930);
angle301_10 = data2.Theta1_10(I1030);
% --------------------Theta 2------------------
%For Theta 2, 20 degrees
angle202_1 = data.Theta2_1(I1);
angle202_2 = data.Theta2_2(I2);
angle202_3 = data.Theta2_3(I3);
angle202_4 = data.Theta2_4(I4);
angle202_5 = data.Theta2_5(I5);
angle202_6 = data.Theta2_6(I6);
angle202_7 = data.Theta2_7(I7);
angle202_8 = data.Theta2_8(I8);
angle202_9 = data.Theta2_9(I9);
angle202_10 = data.Theta2_10(I10);

%Theta 2 30 deg
angle302_1 = data2.Theta2_1(I130);
angle302_2 = data2.Theta2_2(I230);
angle302_3 = data2.Theta2_3(I330);
angle302_4 = data2.Theta2_4(I430);
angle302_5 = data2.Theta2_5(I530);
angle302_6 = data2.Theta2_6(I630);
angle302_7 = data2.Theta2_7(I730);
angle302_8 = data2.Theta2_8(I830);
angle302_9 = data2.Theta2_9(I930);
angle302_10 = data2.Theta2_10(I1030);

%Calculating omega 1 for 20 degrees
omega201_1 = diff(data.Theta1_1(I1))./dt_20{1};
omega201_2 = diff(data.Theta1_2(I2))./dt_20{2};
omega201_3 = diff(data.Theta1_3(I3))./dt_20{3};
omega201_4 = diff(data.Theta1_4(I4))./dt_20{4};
omega201_5 = diff(data.Theta1_5(I5))./dt_20{5};
omega201_6 = diff(data.Theta1_6(I6))./dt_20{6};
omega201_7 = diff(data.Theta1_7(I7))./dt_20{7};
omega201_8 = diff(data.Theta1_8(I8))./dt_20{8};
omega201_9 = diff(data.Theta1_9(I9))./dt_20{9};
omega201_10 = diff(data.Theta1_10(I10))./dt_20{10};


%Calculating and finding Omega 2 for 20 degrees
omega202_1 = diff(data.Theta2_1(I1))./dt_20{1};
omega202_2 = diff(data.Theta2_2(I2))./dt_20{2};
omega202_3 = diff(data.Theta2_3(I3))./dt_20{3};
omega202_4 = diff(data.Theta2_4(I4))./dt_20{4};
omega202_5 = diff(data.Theta2_5(I5))./dt_20{5};
omega202_6 = diff(data.Theta2_6(I6))./dt_20{6};
omega202_7 = diff(data.Theta2_7(I7))./dt_20{7};
omega202_8 = diff(data.Theta2_8(I8))./dt_20{8};
omega202_9 = diff(data.Theta2_9(I9))./dt_20{9};
omega202_10 = diff(data.Theta2_10(I10))./dt_20{10};

%Calculating omega 1 for 30 degrees

omega301_1 = diff(data2.Theta1_1(I130))./dt_30{1};
omega301_2 = diff(data2.Theta1_2(I230))./dt_30{2};
omega301_3 = diff(data2.Theta1_3(I330))./dt_30{3};
omega301_4 = diff(data2.Theta1_4(I430))./dt_30{4};
omega301_5 = diff(data2.Theta1_5(I530))./dt_30{5};
omega301_6 = diff(data2.Theta1_6(I630))./dt_30{6};
omega301_7 = diff(data2.Theta1_7(I730))./dt_30{7};
omega301_8 = diff(data2.Theta1_8(I830))./dt_30{8};
omega301_9 = diff(data2.Theta1_9(I930))./dt_30{9};
omega301_10 = diff(data2.Theta1_10(I1030))./dt_30{10};

%Omega 2 for 30 degrees

omega302_1 = diff(data2.Theta2_1(I130))./dt_30{1};
omega302_2 = diff(data2.Theta2_2(I230))./dt_30{2};
omega302_3 = diff(data2.Theta2_3(I330))./dt_30{3};
omega302_4 = diff(data2.Theta2_4(I430))./dt_30{4};
omega302_5 = diff(data2.Theta2_5(I530))./dt_30{5};
omega302_6 = diff(data2.Theta2_6(I630))./dt_30{6};
omega302_7 = diff(data2.Theta2_7(I730))./dt_30{7};
omega302_8 = diff(data2.Theta2_8(I830))./dt_30{8};
omega302_9 = diff(data2.Theta2_9(I930))./dt_30{9};
omega302_10 = diff(data2.Theta2_10(I1030))./dt_30{10};

% Calculate Acceleration
% Acceleration for 13 Deg

acc131_1 = diff(omega131_1)./dt_13{1}(1:end-1);
acc131_2 = diff(omega131_2)./dt_13{2}(1:end-1);
acc131_3 = diff(omega131_3)./dt_13{3}(1:end-1);
acc131_4 = diff(omega131_4)./dt_13{4}(1:end-1);
acc131_5 = diff(omega131_5)./dt_13{5}(1:end-1);
acc131_6 = diff(omega131_6)./dt_13{6}(1:end-1);
acc131_7 = diff(omega131_7)./dt_13{7}(1:end-1);
acc131_8 = diff(omega131_8)./dt_13{8}(1:end-1);
acc131_9 = diff(omega131_9)./dt_13{9}(1:end-1);
acc131_10 = diff(omega131_10)./dt_13{10}(1:end-1);

acc132_1 = diff(omega132_1)./dt_13{1}(1:end-1);
acc132_2 = diff(omega132_2)./dt_13{2}(1:end-1);
acc132_3 = diff(omega132_3)./dt_13{3}(1:end-1);
acc132_4 = diff(omega132_4)./dt_13{4}(1:end-1);
acc132_5 = diff(omega132_5)./dt_13{5}(1:end-1);
acc132_6 = diff(omega132_6)./dt_13{6}(1:end-1);
acc132_7 = diff(omega132_7)./dt_13{7}(1:end-1);
acc132_8 = diff(omega132_8)./dt_13{8}(1:end-1);
acc132_9 = diff(omega132_9)./dt_13{9}(1:end-1);
acc132_10 = diff(omega132_10)./dt_13{10}(1:end-1);

% Acceleration for 20 Deg
acc201_1 = diff(omega201_1)./dt_20{1}(1:end-1);
acc201_2 = diff(omega201_2)./dt_20{2}(1:end-1);
acc201_3 = diff(omega201_3)./dt_20{3}(1:end-1);
acc201_4 = diff(omega201_4)./dt_20{4}(1:end-1);
acc201_5 = diff(omega201_5)./dt_20{5}(1:end-1);
acc201_6 = diff(omega201_6)./dt_20{6}(1:end-1);
acc201_7 = diff(omega201_7)./dt_20{7}(1:end-1);
acc201_8 = diff(omega201_8)./dt_20{8}(1:end-1);
acc201_9 = diff(omega201_9)./dt_20{9}(1:end-1);
acc201_10 = diff(omega201_10)./dt_20{10}(1:end-1);

acc202_1 = diff(omega202_1)./dt_20{1}(1:end-1);
acc202_2 = diff(omega202_2)./dt_20{2}(1:end-1);
acc202_3 = diff(omega202_3)./dt_20{3}(1:end-1);
acc202_4 = diff(omega202_4)./dt_20{4}(1:end-1);
acc202_5 = diff(omega202_5)./dt_20{5}(1:end-1);
acc202_6 = diff(omega202_6)./dt_20{6}(1:end-1);
acc202_7 = diff(omega202_7)./dt_20{7}(1:end-1);
acc202_8 = diff(omega202_8)./dt_20{8}(1:end-1);
acc202_9 = diff(omega202_9)./dt_20{9}(1:end-1);
acc202_10 = diff(omega202_10)./dt_20{10}(1:end-1);

% Acceleration for 30 Deg
acc301_1 = diff(omega301_1)./dt_30{1}(1:end-1);
acc301_2 = diff(omega301_2)./dt_30{2}(1:end-1);
acc301_3 = diff(omega301_3)./dt_30{3}(1:end-1);
acc301_4 = diff(omega301_4)./dt_30{4}(1:end-1);
acc301_5 = diff(omega301_5)./dt_30{5}(1:end-1);
acc301_6 = diff(omega301_6)./dt_30{6}(1:end-1);
acc301_7 = diff(omega301_7)./dt_30{7}(1:end-1);
acc301_8 = diff(omega301_8)./dt_30{8}(1:end-1);
acc301_9 = diff(omega301_9)./dt_30{9}(1:end-1);
acc301_10 = diff(omega301_10)./dt_30{10}(1:end-1);

acc302_1 = diff(omega302_1)./dt_30{1}(1:end-1);
acc302_2 = diff(omega302_2)./dt_30{2}(1:end-1);
acc302_3 = diff(omega302_3)./dt_30{3}(1:end-1);
acc302_4 = diff(omega302_4)./dt_30{4}(1:end-1);
acc302_5 = diff(omega302_5)./dt_30{5}(1:end-1);
acc302_6 = diff(omega302_6)./dt_30{6}(1:end-1);
acc302_7 = diff(omega302_7)./dt_30{7}(1:end-1);
acc302_8 = diff(omega302_8)./dt_30{8}(1:end-1);
acc302_9 = diff(omega302_9)./dt_30{9}(1:end-1);
acc302_10 = diff(omega302_10)./dt_30{10}(1:end-1);


% Create a combined array of all theta1 accelerations
% angle1_combined = [angle201_1; angle201_2; angle201_3; angle201_4; angle201_5; angle201_6; angle201_7; angle201_8; angle201_9; angle201_10;angle301_1;angle301_2;angle301_3;angle301_4;angle301_5;angle301_6;angle301_7;angle301_8;angle301_9;angle301_10;angle131_1; angle131_2; angle131_3; angle131_4; angle131_5; angle131_6; angle131_7; angle131_8; angle131_9; angle131_10;];
% angle2_combined = [angle202_1; angle202_2; angle202_3; angle202_4; angle202_5; angle202_6; angle202_7; angle202_8; angle202_9; angle202_10;angle302_1;angle302_2;angle302_3;angle302_4;angle302_5;angle302_6;angle302_7;angle302_8;angle302_9;angle302_10; angle132_1; angle132_2; angle132_3; angle132_4; angle132_5; angle132_6; angle132_7; angle132_8; angle132_9; angle132_10;];
% 
% % Create a combined array of all theta2 accelerations
% omega1_combined = [omega201_1; omega201_2; omega201_3; omega201_4; omega201_5; omega201_6; omega201_7; omega201_8; omega201_9; omega201_10;omega301_1; omega301_2; omega301_3; omega301_4; omega301_5; omega301_6; omega301_7; omega301_8; omega301_9; omega301_10;omega131_1; omega131_2; omega131_3; omega131_4; omega131_5; omega131_6; omega131_7; omega131_8; omega131_9; omega131_10];
% omega2_combined = [omega202_1; omega202_2; omega202_3; omega202_4; omega202_5; omega202_6; omega202_7; omega202_8; omega202_9; omega202_10;omega302_1; omega302_2; omega302_3; omega302_4; omega302_5; omega302_6; omega302_7; omega302_8; omega302_9; omega302_10; omega132_1; omega132_2; omega132_3; omega132_4; omega132_5; omega132_6; omega132_7; omega132_8; omega132_9; omega132_10];
% 
% acc1_combined = [acc201_1; acc201_2; acc201_3; acc201_4; acc201_5; acc201_6; acc201_7; acc201_8; acc201_9; acc201_10;acc301_1; acc301_2; acc301_3; acc301_4; acc301_5; acc301_6; acc301_7; acc301_8; acc301_9; acc301_10;acc131_1; acc131_2; acc131_3; acc131_4; acc131_5; acc131_6; acc131_7; acc131_8; acc131_9; acc131_10];
% acc2_combined = [acc202_1; acc202_2; acc202_3; acc202_4; acc202_5; acc202_6; acc202_7; acc202_8; acc202_9; acc202_10;acc302_1; acc302_2; acc302_3; acc302_4; acc302_5; acc302_6; acc302_7; acc302_8; acc302_9; acc302_10;acc132_1; acc132_2; acc132_3; acc132_4; acc132_5; acc132_6; acc132_7; acc132_8; acc132_9; acc132_10];
% Corrected concatenation with column vectors
angle1_combined = [angle201_1; angle201_2; angle201_3; angle201_4; angle201_5; angle201_6; angle201_7; angle201_8; angle201_9; angle201_10;angle301_1;angle301_2;angle301_3;angle301_4;angle301_5;angle301_6;angle301_7;angle301_8;angle301_9;angle301_10;angle131_1; angle131_2; angle131_3; angle131_4; angle131_5; angle131_6; angle131_7; angle131_8; angle131_9; angle131_10;];
angle2_combined = [angle202_1; angle202_2; angle202_3; angle202_4; angle202_5; angle202_6; angle202_7; angle202_8; angle202_9; angle202_10;angle302_1;angle302_2;angle302_3;angle302_4;angle302_5;angle302_6;angle302_7;angle302_8;angle302_9;angle302_10; angle132_1; angle132_2; angle132_3; angle132_4; angle132_5; angle132_6; angle132_7; angle132_8; angle132_9; angle132_10;]

% Create a combined array of all theta2 accelerations
omega1_combined = [omega201_1; omega201_2; omega201_3; omega201_4; omega201_5; omega201_6; omega201_7; omega201_8; omega201_9; omega201_10;omega301_1; omega301_2; omega301_3; omega301_4; omega301_5; omega301_6; omega301_7; omega301_8; omega301_9; omega301_10;omega131_1; omega131_2; omega131_3; omega131_4; omega131_5; omega131_6; omega131_7; omega131_8; omega131_9; omega131_10];
omega2_combined = [omega202_1; omega202_2; omega202_3; omega202_4; omega202_5; omega202_6; omega202_7; omega202_8; omega202_9; omega202_10;omega302_1; omega302_2; omega302_3; omega302_4; omega302_5; omega302_6; omega302_7; omega302_8; omega302_9; omega302_10; omega132_1; omega132_2; omega132_3; omega132_4; omega132_5; omega132_6; omega132_7; omega132_8; omega132_9; omega132_10];

acc1_combined = [acc201_1; acc201_2; acc201_3; acc201_4; acc201_5; acc201_6; acc201_7; acc201_8; acc201_9; acc201_10;acc301_1; acc301_2; acc301_3; acc301_4; acc301_5; acc301_6; acc301_7; acc301_8; acc301_9; acc301_10;acc131_1; acc131_2; acc131_3; acc131_4; acc131_5; acc131_6; acc131_7; acc131_8; acc131_9; acc131_10];
acc2_combined = [acc202_1; acc202_2; acc202_3; acc202_4; acc202_5; acc202_6; acc202_7; acc202_8; acc202_9; acc202_10;acc302_1; acc302_2; acc302_3; acc302_4; acc302_5; acc302_6; acc302_7; acc302_8; acc302_9; acc302_10;acc132_1; acc132_2; acc132_3; acc132_4; acc132_5; acc132_6; acc132_7; acc132_8; acc132_9; acc132_10];
figure(7)


% First row: Theta distributions
subplot(3,2,1)
histfit(angle1_combined);
angle1fit = fitdist(angle1_combined, 'Normal');
title('Distribution of $\theta_1$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\theta_1$ (degrees)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-87,690, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', angle1fit.mu, angle1fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-90 90])
ylim([0 800])

subplot(3,2,2)
histfit(angle2_combined,'');
angle2fit = fitdist(angle2_combined, 'Normal');
title('Distribution of $\theta_2$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\theta_2$ (degrees)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-87, 690, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', angle2fit.mu, angle2fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-90 90])
ylim([0 800])
% Second row: Angular velocity distributions

subplot(3,2,3)
%histfit(omega1_combined);
histfit(omega1_combined)
omega1fit = fitdist(omega1_combined, 'Normal');
title('Distribution of Angular Velocity $\dot{\theta}_1$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\dot{\theta}_1$ (degrees/s)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-480, 2160, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', omega1fit.mu, omega1fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-500 500])
ylim([0 2500])

subplot(3,2,4)
histfit(omega2_combined);
omega2fit = fitdist(omega2_combined, 'Normal');
title('Distribution of Angular Velocity $\dot{\theta}_2$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\dot{\theta}_2$ (degrees/s)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-480, 2160, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', omega2fit.mu, omega2fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-500 500])
ylim([0 2500])

% Third row: Angular acceleration distributions
subplot(3,2,5)
histfit(acc1_combined);
acc1fit = fitdist(acc1_combined, 'Normal');
title('Distribution of Angular Acceleration $\ddot{\theta}_1$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\ddot{\theta}_1$ (degrees/s$^2$)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-4900, 2580, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', acc1fit.mu, acc1fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-5000 5000])
ylim([0 3000])


subplot(3,2,6)
histfit(acc2_combined);
acc2fit = fitdist(acc2_combined, 'Normal');
title('Distribution of Angular Acceleration $\ddot{\theta}_2$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('Frequency', 'FontSize', 12)
xlabel('$\ddot{\theta}_2$ (degrees/s$^2$)', 'Interpreter', 'latex', 'FontSize', 12)
grid on
text(-4900, 2580, sprintf('$\\mu$: %.2f\n$\\sigma$: %.2f', acc2fit.mu, acc2fit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7])
xlim([-5000 5000])
ylim([0 3000])
set(gcf, 'WindowState', 'maximized')
saveas(gcf,'histogramdistribution.png')
% excelFileName = 'PendulumData.xlsx';
% 
% numTrials = 10;  % There are 10 trials for each angle
% 
% %--- Angle 13 (data1) ---
% for trial = 1:numTrials
%     % Construct the field names dynamically
%     timeField   = sprintf('Time_%d', trial);
%     theta1Field = sprintf('Theta1_%d', trial);
%     theta2Field = sprintf('Theta2_%d', trial);
% 
%     % Use an index to select rows where both theta1 and theta2 are not NaN.
%     idx = ~isnan(data1.(theta1Field)) & ~isnan(data1.(theta2Field));
% 
%     % Extract the non-NaN data for time and angles
%     t = data1.(timeField)(idx);
%     theta1 = data1.(theta1Field)(idx);
%     theta2 = data1.(theta2Field)(idx);
% 
%     % Compute angular velocities: omega = d(theta)/d(time)
% 
% 
%     % Create a table with the extracted data
%     T = table(t, theta1, theta2, omega1, omega2, ...
%         'VariableNames', {'Time', 'Theta1', 'Theta2', 'Omega1', 'Omega2'});
% 
%     % Write the table to an Excel sheet (e.g., "Angle13_Trial1")
%     sheetName = sprintf('Angle13_Trial%d', trial);
%     writetable(T, excelFileName, 'Sheet', sheetName);
% end
% 
% % --- Angle 20 (data) ---
% for trial = 1:numTrials
%     timeField   = sprintf('Time_%d', trial);
%     theta1Field = sprintf('Theta1_%d', trial);
%     theta2Field = sprintf('Theta2_%d', trial);
% 
%     idx = ~isnan(data.(theta1Field)) & ~isnan(data.(theta2Field));
% 
%     t = data.(timeField)(idx);
%     theta1 = data.(theta1Field)(idx);
%     theta2 = data.(theta2Field)(idx);
% 
% 
%     T = table(t, theta1, theta2, omega1, omega2,'VariableNames', {'Time', 'Theta1', 'Theta2', 'Omega1', 'Omega2'});
% 
%     sheetName = sprintf('Angle20_Trial%d', trial);
%     writetable(T, excelFileName, 'Sheet', sheetName);
% end
%datasaver, ignored for now
% 
% % --- Angle 30 (data2) ---
% for trial = 1:numTrials
%     timeField   = sprintf('Time_%d', trial);
%     theta1Field = sprintf('Theta1_%d', trial);
%     theta2Field = sprintf('Theta2_%d', trial);
% 
%     idx = ~isnan(data2.(theta1Field)) & ~isnan(data2.(theta2Field));
% 
%     t = data2.(timeField)(idx);
%     theta1 = data2.(theta1Field)(idx);
%     theta2 = data2.(theta2Field)(idx);
% 
% 
% 
%     T = table(t, theta1, theta2, omega1, omega2,'VariableNames', {'Time', 'Theta1', 'Theta2', 'Omega1', 'Omega2'});
% 
%     sheetName = sprintf('Angle30_Trial%d', trial);
%     writetable(T, excelFileName, 'Sheet', sheetName);
% end

