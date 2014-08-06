% Slope Finder
clear all
close all
clc

displacements = importdata('Displacements.txt');
d_slope = zeros(200,1000);

for j = 1:1000;
for i = 1:200;
    d_slope(i,j) = -displacements(i+1,j)+displacements(i,j);
end
end

hold on
for i=1:20
    plot(1:1000,d_slope(10*i,:))
end
hold off

n = 250;
m = 0;

x = zeros(1,n-m+1);
y = 1:n-m+1;

for i = 1:n-m+1
    x(i) = find(d_slope(:,m+i)==max(d_slope(:,m+i)));
end

p = polyfit(y,x,1);  
r = p(1) .* y + p(2); 

plot(y,x,y,r)
title('Best Fit Line')
xlabel('Time (t)')
ylabel('Position (x)')
legend('Characteristic curve','Best fit line')

xlswrite('slope.xlsx',x)

p