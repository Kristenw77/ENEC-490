%Lecture 6

temps=csvread('tempdata.csv');
temps=temps(:,2);
%Read electricity demand data
data_2014 = csvread('hourly-day-ahead-bid-data-2014.csv',5,1);
%Started reading data in the 6th row, 2nd column in excel 
vector = mat2vec(data_2014);
peak = zeros(365,1);
%peak 
for i=1:365
    peak(i) = max(data_2014(i,:));
end

peak=peak/1000;

% forms 2-column matrix
combined = [temps peak];

% clusters for each row
%IDX is now a list of 1s, 2s, and 3s. That's how you can classify colors,
%but he just used the sort function 
%for the clusters 
IDX = kmeans(combined,3);

% forms 3-column matrix
clustered_data = [combined IDX];

% sorts 
sorted_data = sortrows(clustered_data,3);

% find indices of cluster 1
ONE = clustered_data(clustered_data(:,3)==1,1:2);

% find indices of cluster 2
TWO = clustered_data(clustered_data(:,3)==2,1:2);

% find indices of cluster 3
THREE = clustered_data(clustered_data(:,3)==3,1:2);

figure; 
hold on;
scatter(ONE(:,1),ONE(:,2),'r'); 
scatter(TWO(:,1),TWO(:,2) ,'b');
scatter(THREE(:,1),THREE(:,2) ,'g');
xlabel('Average Temperature (degrees F)','FontSize',14);
ylabel('Peak Electricity Demand (MWh)','FontSize',14);
legend('Cluster 1', 'Cluster 2', 'Cluster 3');
hold off;

%Time series data 

%Number 1

jan = data_2014(1:31, :);
july = data_2014(182:212, : );
profile = mean(jan);
profile2 = mean(july); 
figure;
hold on;
plot(profile)
plot(profile2)
xlabel('Days of the Month')
ylabel('Average Demand in Megawatt Hours')

%Number 2

colVector = mat2vec(data_2014);
weekday = zeros(length(colVector)/24,2)
   % Wednesday = days2(1:24) 
   % Thursday = days2(25:49) 
   % Friday = days2(50:74)
    %Saturday = days2(75:99)
    %Sunday = days2(100:124)
   % Monday = days2(125:149)
   % Tuesday = days2(150:174) 
for i = 1:colVector
    for j = 1:2
    weekday(i,1) = colVector(i:i + 24)
    i = i + 24
        for k = 1:7
            weekday(i, 2) = k
        end 
    end 
end 

