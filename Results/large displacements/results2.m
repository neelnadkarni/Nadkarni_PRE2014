% Displacement visualization

clear all
close all
clc

numberofnodes = 200;

displacements = importdata('Displacements.txt');
x = 0:numberofnodes;
y = 0:0.01:numberofnodes;
n = 7;
Legend1=cell(1,n);
Legend2=cell(1,7);
deltat = 0.1;

m = 50;
dt =300;
time=1000;

figure(1)
for i=1:n
hold all    
plot(x,displacements(1:numberofnodes+1,m*i+dt))
Legend1{i}=strcat('Time=', num2str(m*i+dt));
end

legend(Legend1)
title('u(x,t) vs x')
xlabel('Position (x)')
ylabel('Displacement (u(x,t))')

t = 1:time;

figure(2)
hold all
for i=3:9
plot(t, displacements(2*i,1:max(t)));
Legend2{i-2}=strcat('Node=', num2str(20*i));
end

legend(Legend2)
title('u(x,t) vs t')
xlabel('Time(t)')
ylabel('Displacement (u(x,t))')

hold off

figure(3)
contourf(x,deltat*t,displacements')
hold on
p=plot(x, x/2.667);
hold off
set(p,'Color','red','LineWidth',2)
colormap gray
colorbar('location','eastoutside')
title('$\bar{u}$($\bar{x}$,$\bar{t}$)','Interpreter','latex')
xlabel('Position ($\bar{x}$)','Interpreter','latex')
zlabel('Displacement (u(x,t))')
ylabel('Time ($\bar{t}$)','Interpreter','latex')

figure(4)
contourf(x(40:numberofnodes+1),deltat*t,displacements(40:numberofnodes+1,:)')
colormap jet
colorbar('location','eastoutside')
title('u(x,t)')
xlabel('Position(x)')
zlabel('Displacement (u(x,t))')
ylabel('Time(t)')

% figure(5)
% meshc(x,deltat*t,displacements')
% colormap jet
% colorbar('location','eastoutside')
% title('u(x,t)')
% xlabel('Position(x)')
% zlabel('Displacement (u(x,t))')
% ylabel('Time(t)')
% 
% lambda = pi;
% wo = (0.264911)^0.5;
% v1 = 2.667;
% c = (10)^0.5;
% w1 = 0.843717;
% theta = (4/lambda)*atan(exp(-(((lambda^0.5)*wo)/c).*(y-100)/(1-(v1/c)^2)^0.5));
% theta2 = 1.10325 + 0.15675001139232925*cos(w1*(y-100))-0.6387055804658749*sin(w1*(y-100)); 
% 
% figure(6)
% for i=1:time/3
% plot(x, displacements(:,3*i))
% hold on 
% % plot(x, zeros(1,length(x)),'red')
% % plot(x, ones(1,length(x)),'green')
% % plot(x, theta, 'black')
% % plot(x,ones(1,length(x)),'green')
% hold off
% axis([0,numberofnodes,-0.05,0.05])
% title('u(x,t) vs x movie with time')
% xlabel('Position(x)')
% ylabel('Displacement (u(x,t))')
% pause(0.04)
% end
% 
% close
% figure(7)
% plot(x, displacements(:,70),'blue')
% hold on
% title('u(x,t) vs x')
% xlabel('Position(x)')
% ylabel('Displacement (u(x,t))')
% legend('Numerical Solution')


