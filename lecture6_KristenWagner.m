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
