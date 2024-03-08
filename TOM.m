% syms W L FX FY FZ MX MY MZ GX GY GZ
% x = [W,-W,-W,W];
% y = [L,L,-L,-L];
% 
% P1 = [W,L,0];
% P2 = [-W,L,0];
% P3 = [-W,-L,0];
% P4 = [W,-L,0];
% 
% E1 = [1,0,0];
% E2 = [0,1,0];
% E3 = [-1,0,0];
% E4 = [0,-1,0];
% 
% I1 = [0,L,0];
% I2 = [-W,0,0];
% I3 = [0,-L,0];
% I4 = [W,0,0];
% 
% F = [FX,FY,FZ];
% M = [MX,MY,MZ];
% G = [GX,GY,GZ];


% TOM12 = M*E1'+cross(F,I1)*E1'+cross(G,I1)*E1'
% TOM23 = M*E2'+cross(F,I2)*E2'+cross(G,I2)*E2'
% TOM34 = M*E3'+cross(F,I3)*E3'+cross(G,I3)*E3'
% TOM41 = M*E4'+cross(F,I4)*E4'+cross(G,I4)*E4'
L = 0.33;
W = 0.275;
MX = Torque_0_0(:,1)/1000;
MY = Torque_0_0(:,2)/1000;
FZ = Torque_0_0(:,6);
GZ = ones(1006,1)*9.8*120;
TOM12 = MX - FZ*L - GZ*L;
TOM23 = MY - FZ*W - GZ*W;
TOM34 = -MX - FZ*L - GZ*L;
TOM41 = -MY - FZ*W - GZ*W;
t=length(Torque_0_0(:,1));
T=[];
for i=1:t
    T=[T;i*0.01];
end
figure
plot(T,TOM12,'g','linewidth',1),hold on, grid on
plot(T,TOM23,'b-.','linewidth',1),hold on, 
plot(T,TOM34,'r','linewidth',1),hold on,
plot(T,TOM41,'y-.','linewidth',1),hold on, 
xlabel('时间t(s)'), ylabel('力矩 (N.m)')
lgd = legend('TOM12','TOM23','TOM34','TOM41','Location','southeast');
lgd.Color = 'none';
title('0KG负载大范围运动倾覆力矩TOM变化')