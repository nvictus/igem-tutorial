function dxdt = lorenz(t,x)
%LORENZ: Computes the derivatives involved in solving the
%Lorenz equations.

sig  = 10;
beta = 8/3;
rho  = 28;

dxdt(1,:)  = -sig*x(1) + sig*x(2);
dxdt(2,:)  = rho*x(1) - x(2) - x(1)*x(3); 
dxdt(3,:)  =  -beta*x(3) + x(1)*x(2);