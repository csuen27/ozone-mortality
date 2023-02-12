%% Read-in the coordination-locations

main = csvread('~/site-rural-2019.csv',1,1);
[sample var] = size(main); 

%% Extract population dataset 

urban = ncread('~/global_pop_2019.nc','urban'); 
rural = ncread('~/global_pop_2019.nc','rural'); 

urban_list = zeros(1,1);
rural_list = zeros(1,1);
total_list = zeros(1,1);

tic
for list = 1:1:sample
    lon  = main(list,1);
    lat  = main(list,2);
    x = ceil((180.0+lon)/0.125);
    y = ceil((83.75-lat)/0.125);
    a = 2*asin(sqrt(sin(0.125*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0*pi/180/2)^2))*6378.137;
    b = 2*asin(sqrt(sin(0*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0.125*pi/180/2)^2))*6378.137;
    urban_list(list,1) = mean(mean(urban(x-1:x+1,y-1:y+1)))/a/b;
    rural_list(list,1) = mean(mean(rural(x-1:x+1,y-1:y+1)))/a/b;
    total_list(list,1) = urban_list(list,1)+rural_list(list,1);
end
toc