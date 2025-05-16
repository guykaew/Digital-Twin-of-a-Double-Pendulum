close all
data4 = Angle4withFilter2404;
data8 = Angle8Filter2404;
data13 = angle13withfilter2404;
data20 = angle20withfilter2404;
data30 = angle27withfilter2404;
data40 = Angle40withfilter2404;
data50 = Angle502404;
data60 = Angle602404
data70 = Angle702404
data100 = Angle1002404
%dataloop = {data4, data8, data13, data20,data30,data40,data50};
dataloop = {data4, data8, data13, data20,data30,data40,data50,data60,data70,data100}
I1 = ~isnan(data13.theta1_1);
plot((data13.time_1(I1)-data13.time_1(1)), data13.theta1_1(I1),Color='r') 
hold on 
I2 = ~isnan(data13.theta1_2);
plot((data13.time_2(I2)-data13.time_2(1)), data13.theta1_2(I2),Color="#D95319") 

I3 = ~isnan(data13.theta1_3);
plot((data13.time_3(I3)-data13.time_3(1)), data13.theta1_3(I3),Color='yellow') 

I4 = ~isnan(data13.theta1_4);
plot((data13.time_4(I4)-data13.time_4(1)), data13.theta1_4(I4),Color='green') 

I5 = ~isnan(data13.theta1_5);
plot((data13.time_5(I5)-data13.time_5(1)), data13.theta1_5(I5),Color='blue')
hold off
initialanglelist = []
totalrmslist = []
diff1list = {}
diff2list = {}
timelist = {}
%3 data sets
figure(1)
for i=1:10
    %5 trials in each dataset
    current_data = dataloop{i};
    for j = 1:5 
        theta = ['theta1_', num2str(j)];
        diff1 = ['diff1_', num2str(j)];
        diff2 = ['diff2_', num2str(j)];
        time = ['time_', num2str(j)];
        I = ~isnan(current_data.(theta));
     
        diff1 = current_data.(diff1)(I);
        rms_diff1 = sqrt(sum(diff1.^2) / size(diff1,1));
        diff2 = current_data.(diff2)(I);
        rms_diff2 = sqrt(sum(diff2.^2) / size(diff2,1));
        totalrms = rms_diff1+rms_diff2
        initialanglelist(end+1,1) = -1*current_data.(theta)(1);
        totalrmslist(end+1,1) = totalrms;
        diff1list{end+1,1} = diff1;
        diff2list{end+1,1} = diff2;
        timelist{end+1,1} = current_data.(time)(I)

    end
end

scatter(initialanglelist,totalrmslist,'filled','r')
ylabel('Total RMS Error (Degrees)')
xlabel('Initial \theta_1 Angle (Degrees)')
hold on
grid on
title('Initial \theta_1 Angle vs. Total RMS Error at \theta_2 = 0')
noOutlierIndex = initialanglelist<= 50;
p = polyfit(initialanglelist(noOutlierIndex), totalrmslist(noOutlierIndex), 1);       
ErrorFit = polyval(p, initialanglelist);
plot(initialanglelist, ErrorFit, '-k', 'LineWidth', 1.5)
set(1,"WindowState","maximized")
saveas(gcf,'errorvsinitialangle.png')
angleNames = [  4,  8, 13, 20, 30, 40, 50, 60, 70, 100 ];  


figure(2);
for i = 1:10
    subplot(2,5,i);
    hold on;

    datasetglobalindex = (i-1)*5;  
    for j = 1:5
        currentlocalindex = datasetglobalindex + j;
        t = timelist{currentlocalindex};
        t = t - t(1);              
        plot(t, diff1list{currentlocalindex}); 
        if i <= 5
            ylim([-40 40])
        else
            ylim([-400 400])
        end
        xlim([0 60])
    end

    hold off;
    title(sprintf('Angle %d°', angleNames(i)));
    xlabel('Time (s)');
    ylabel('Error \theta_1 (degrees)');
    grid on;
end
sgtitle('Error of \theta_1 Prediction vs. Time for all initial \theta_1 angles') 
set(2,'WindowState','maximized');
saveas(gcf,'error1plot.png')
figure(3);
for i = 1:numel(dataloop)
    current_data = dataloop{i};
    subplot(2,5,i);
    hold on;

    for j = 1:5
        t_string = sprintf('time_%d',    j);
        omega1_string = sprintf('omega1_%d',  j);  
        t = current_data.(t_string);
        omega = current_data.(omega1_string);
        %finding the index that is not NaN
        I = ~isnan(omega);
        plot( t(I) - t(1), omega(I), 'LineWidth', 1 );
        if i <= 5
            ylim([-600 600])
        else
            ylim([-3000 3000])
        end
        xlim([0 60])

    end

    hold off;
    title( sprintf('Angle %d°', angleNames(i)) );
    xlabel('Time (s)');
    ylabel('\omega1 (deg/s)');
    grid on;
end
sgtitle('\omega_1 vs. Time for all Angles') 
set(3,'WindowState','maximized');
saveas(gcf,'omega1plot.png')
figure(4);
indexstore = {};
for i = 1:10
    subplot(2,5,i);
    hold on;
    %iteration for datasets as there are 50
    datasetglobalindex = (i-1)*5;
    for j = 1:5
        %determining the location of ith dataset, 5 trials per dataset
        currentlocalindex = datasetglobalindex + j;
        t = timelist{currentlocalindex};
        t = t - t(1);                    
        error2 = diff2list{currentlocalindex};        
        plot(t, error2);
        finderror2 = find(error2>=200);
        indexstore{end+1,1} = finderror2;
        
        if i <= 5
            ylim([-40 40])
        else
            ylim([-400 400])
        end
        xlim([0 60])
    end
    
    hold off;
    title(sprintf('Angle %d°', angleNames(i)));
    xlabel('Time (s)');
    ylabel('Error \theta_2 (degrees)');
    grid on;
end
sgtitle('Error of \theta_2 Prediction vs. Time for all initial \theta_1 angles') 
set(4,'WindowState','maximized');
saveas(gcf,'error2plot.png')
figure(5);
for i = 1:10
    current_data = dataloop{i};
    subplot(2,5,i);
    hold on;
    
    for j = 1:5
        t_string = sprintf('time_%d',j);
        omega2_string = sprintf('omega2_%d',j);
        t = current_data.(t_string);
        omega2 = current_data.(omega2_string);
        I = ~isnan(omega2);
        plot( t(I) - t(1), omega2(I));
        if i <= 5
            ylim([-1500 1500])
        else
            ylim([-4000 4000])
        end
        xlim([0 60])
    end
    
    hold off;
    title(sprintf('Angle %d°', angleNames(i)));
    xlabel('Time (s)');
    ylabel('\omega_2 (deg/s)');
    grid on;
end
sgtitle('\omega_2 vs. Time for all initial \theta_1 angles') 
set(5,'WindowState','maximized');
saveas(gcf,'omega2plot.png')
figure50 = 0;
figure60 = 0;
figure70 = 0;
figure100 = 0;
for i=1:50
    if ~isempty(indexstore{i,1})
    chaosindex = indexstore{i,1};
    plotindex = mod(i,5);
    disp(i)
    datasetlocation = ceil(i/5);
    if plotindex == 0
        plotindex = 5;
    end
    theta2_string = sprintf('theta2_%d',plotindex);
    time_string = sprintf('time_%d',plotindex);
    diff2_string = sprintf('diff2_%d',plotindex);
    theta1_string = sprintf('theta1_%d', plotindex);
    initial_angle = -1 * current_data.(theta1_string)(1);
    data = dataloop{datasetlocation};

    if (i <= 50) && (i>45) && figure100==0
        figure(100)
        figure100 = 1000;
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')

        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        grid on     
        end
    elseif (i <= 50) && (i>45) 
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')
        title('Locations of \theta_2 Prediction Errors >= 200 degrees at Initial \theta_1 = 100 ')
        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        xlim([0 35])
        grid on

        end
    end
    if (i <= 45) && (i>40) && figure70==0
        figure(70)
        figure70 = 1000;
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')

        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        grid on     
        end
    elseif (i <= 45) && (i>40)
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')
        title('Locations of \theta_2 Prediction Errors >= 200 degrees at Initial \theta_1 = 70 ');
        xlim([0 35])
        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        grid on     

        end
    end
    if (i <= 40) && (i>35) && figure60==0
        figure(60)
        figure60 = 1000;
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')

        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        grid on     
        end
    elseif (i <= 40) && (i>35)
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')
        title('Locations of \theta_2 Prediction Errors >= 200 degrees at Initial \theta_1 = 60 ');
        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        xlim([0 35])
        grid on 

        end
    end
    if (i <= 35) && (i>30) && figure50==0
        figure(50)
        figure50 = 1000;
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')

        xlabel('time (s)')
        ylabel('\theta_2 (degrees)')
        grid on     
        end
    elseif (i <= 35) && (i>30)
        for j=1:numel(chaosindex)
        plotchaosindex = chaosindex(j);
        time = data.(time_string);
        theta2 = data.(theta2_string);
        diff2 = data.(diff2_string);
        plot(time((plotchaosindex-5):(plotchaosindex+5)),(theta2(plotchaosindex-5:plotchaosindex+5)))
        hold on
        scatter(time(plotchaosindex),theta2(plotchaosindex),'filled','r')
        title('Locations of \theta_2 Prediction Errors >= 200 degrees at Initial \theta_1 = 50 ');

        xlabel('time (s)')
        xlim([0 35])
        ylabel('\theta_2 (degrees)')
        grid on 


        end

    end
    

    end
end

export_fig(1,'test.png')
export_fig(2,'test2.png')
export_fig(3,'test3.png')
export_fig(4,'test4.png')
export_fig(5,'test5.png')
saveas(figure(50),'location50error.png')
saveas(figure(60),'location60error.png')
saveas(figure(70),'location70error.png')
saveas(figure(100),'location100error.png')


allDelays = [];

% Loop through all datasets in dataloop
for i = 1:10
    current_data = dataloop{i};
    
    % Loop through each trial (1-5) in the current dataset
    for j = 1:5
        % Define the column names based on trial number
        time_col = ['time_', num2str(j)];
        sensortime_col = ['sensortime_', num2str(j)];
        

            valid_idx = ~isnan(current_data.(time_col));
            delay = current_data.(time_col)(valid_idx) - current_data.(sensortime_col)(valid_idx);
            allDelays = [allDelays; delay];
        
    end
end

positiveDelays = allDelays(allDelays > 0);

% Calculate and display the mean delay across all datasets
meanDelay = mean(positiveDelays);
disp(['Mean positive time delay across all datasets: ', num2str(meanDelay), ' seconds']);

% Create figure for delay analysis
figure(101);

% Create subplot for delay distribution with fitted normal curve

histfit(positiveDelays);
delayFit = fitdist(positiveDelays, 'Normal');
title('Distribution of Time Delay');
ylabel('Frequency', 'FontSize', 12);
xlabel('Delay (seconds)');
xlim([-0.1 0.2])
grid on;

text(-0.095, 1410, sprintf('$\\mu$: %.4f\n$\\sigma$: %.4f', delayFit.mu, delayFit.sigma), ...
    'Interpreter', 'latex', 'FontSize', 12, 'BackgroundColor', [1 1 1 0.7]);


saveas(101, 'delay_distribution_analysis.png');