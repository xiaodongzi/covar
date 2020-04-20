clc;
clear all;
data=xlsread('test.xlsx');


rx= data(:,2); %B
mx=data(:,1); % A

r0_x = rx - mean(rx);
r0_m =  mx -mean(mx);
[p,h]=dcc_gjrgarch(data);


s_m = sqrt(h(:,1));  %% system market data  conditional variances
s_x = sqrt(h(:,2)); %%  institution data  conditional variances
rho = squeeze(p(1,2,:)); %%  can reduce dimensions  ?only extract row1 and column2 data .  use squeeze to get a vector)
a=0.05;


[beta,var,es] = calculate_idiosyncratic(a,s_m,r0_x,s_x,rho);%% data.A is  1-k  0.05 alpha
[covar,dcovar] = calculate_covar(a,r0_m,r0_x,var);
