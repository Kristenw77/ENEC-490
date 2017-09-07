for i = window/2 + 1:num_hours-window/2
    
   
    window_size = i-250:i+250;
    window_mean = mean(window_size);
    
    window_std = std(window_size);
    
    if transformed_data(i) >= window_mean + 3*window_std | transformed_data(i) <= window_mean - 3*window_std
        outliers(i) = 1;
    else
        outliers(i) = 0;
    end
    i = i + 500; 
end
find(outliers > 0)




%%% Scatter Plot 
days = length(transformed_data)/24;
peak_demand = zeros(days,1);
for i = 1:days

    peak = max(transformed_data(i:i+23));
    peak_demand(i) = peak;
    i = i + 24;
    
end 

%no header/text in excel file, so don't need to specify start cell; (1,1) actually translates to row 2, column 2 in Excel
tempdata = csvread('tempdata.csv');
% only use data (not dates)
X= tempdata(:,2);
X = tempdata;
Y = peak_demand;
scatter(X,Y)
xlabel('Average Daily Temperatures','FontSize', 14)
ylabel('Peak Demand','FontSize', 14)
title('Average Daily Temperatures vs. Peak Demand', 'FontSize',14)

