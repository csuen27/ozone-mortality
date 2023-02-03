%% Read-in the coordination-locations

main = csvread('/Users/csuen/Desktop/Sun-LRH-22/manus-nat.sus./suburban site.csv',1,1);
[sample var] = size(main); 

%% Extract population dataset 

urban = ncread('/Volumes/Database/Backups/202009bkp/Academics/sspPop/SSP2_NetCDF/urban/NetCDF/ssp2urb2020.nc','ssp2urb2020'); 
rural = ncread('/Volumes/Database/Backups/202009bkp/Academics/sspPop/SSP2_NetCDF/rural/NetCDF/ssp2rur2020.nc','ssp2rur2020'); 

urban_list = zeros(1,1);
rural_list = zeros(1,1);
total_list = zeros(1,1);

tic
for list = 1:1:sample
    lon = main(list,1);
    lat = main(list,2);
    x = ceil((180 + lon) / 0.125);
    y = ceil((83.75 - lat) / 0.125);
    a = 2*asin(sqrt(sin(0.125*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0*pi/180/2)^2))*6378.137;
    b = 2*asin(sqrt(sin(0*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0.125*pi/180/2)^2))*6378.137;
    urban_list(list,1) = min(min(urban(x-1:x+1,y-1:y+1)))*0.75/a/b;
    rural_list(list,1) = min(min(rural(x-1:x+1,y-1:y+1)))/a/b;
    total_list(list,1) = urban_list(list,1) + rural_list(list,1);
end
toc


lon = 121.90;
lat = 29.875;
x = ceil((180 + lon) / 0.125);
y = ceil((83.75 - lat) / 0.125);
a = 2*asin(sqrt(sin(0.125*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0*pi/180/2)^2))*6378.137;
b = 2*asin(sqrt(sin(0*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0.125*pi/180/2)^2))*6378.137;
urban_list(list,1) = min(min(urban(x-1:x+1,y-1:y+1)))*0.75/a/b;
rural_list(list,1) = min(min(rural(x-1:x+1,y-1:y+1)))/a/b;
total_list(list,1) = urban_list(list,1) + rural_list(list,1);


%% Read-in the coordination-locations

main = csvread('/Users/csuen/Desktop/Sun-LRH-22/nat.sus.R1/analysis/site-rural-2019.csv',1,1);
[sample var] = size(main); 

%% Extract population dataset 

urban = ncread('/Volumes/Database/Backups/202009bkp/Academics/sspPop/SSP2_NetCDF/urban/NetCDF/ssp2urb2020.nc','ssp2urb2020'); 
rural = ncread('/Volumes/Database/Backups/202009bkp/Academics/sspPop/SSP2_NetCDF/rural/NetCDF/ssp2rur2020.nc','ssp2rur2020'); 

urban_list = zeros(1,1);
rural_list = zeros(1,1);
total_list = zeros(1,1);

tic
for list = 1:1:sample
    lon = main(list,1);
    lat = main(list,2);
    x = ceil((180 + lon) / 0.125);
    y = ceil((83.75 - lat) / 0.125);
    a = 2*asin(sqrt(sin(0.125*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0*pi/180/2)^2))*6378.137;
    b = 2*asin(sqrt(sin(0*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0.125*pi/180/2)^2))*6378.137;
    urban_list(list,1) = min(min(urban(x-1:x+1,y-1:y+1)))*0.75/a/b;
    rural_list(list,1) = min(min(rural(x-1:x+1,y-1:y+1)))/a/b;
    total_list(list,1) = urban_list(list,1) + rural_list(list,1);
end
toc


tic
for list = 1:1:sample
    lon = main(list,1);
    lat = main(list,2);
    x = ceil((180 + lon) / 0.125);
    y = ceil((83.75 - lat) / 0.125);
    a = 2*asin(sqrt(sin(0.125*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0*pi/180/2)^2))*6378.137;
    b = 2*asin(sqrt(sin(0*pi/180/2)^2+cos(lat*pi/180)*cos((lat+0.125)*pi/180)*sin(0.125*pi/180/2)^2))*6378.137;
    urban_list(list,1) = mean(mean(urban(x-1:x+1,y-1:y+1)))*0.75/a/b;
    rural_list(list,1) = mean(mean(rural(x-1:x+1,y-1:y+1)))/a/b;
    total_list(list,1) = urban_list(list,1) + rural_list(list,1);
end
toc