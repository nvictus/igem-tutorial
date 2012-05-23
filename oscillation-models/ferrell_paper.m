% CELL CYCLE MODELS 
% From: J.E. Ferrell Jr., T.Y. Tsai and Q. Yang. "Modeling the cell cycle: 
% why do certain cells oscillate?". Cell, 144. 2011.

%% parameters
import dynsys.*
p.alpha1 = 0.1;
p.alpha2 = 3.0;
p.alpha3 = 3.0;
p.beta1 = 3.0;
p.beta2 = 1.0;
p.beta3 = 1.0;
p.K1 = 0.5;
p.K2 = 0.5;
p.K3 = 0.5;
p.n1 = 8;
p.n2 = 8;
p.n3 = 8;
tau1 = 0.5;
tau2 = 0.5;

%% 1D system
% solve
x0 = 0;
tspan = [0 50];
[t,x] = ode45(@cellcycle1d, tspan, x0, [], p);

% plot
figure(1);
subplot(4,1,1);
plot(t,x);

subplot(4,1,2:4);
vectorfield1d(@cellcycle1d, 0:0.1:2, [], [], p);

%% 2D system
% solve
x0 = [0; 0];
tspan = [0 50];
[t,x] = ode45(@cellcycle2d, tspan, x0, [], p);

% plot
figure(2);
subplot(4,1,1);
plot(t,x);

subplot(4,1,2:4);
cla; hold on;
vectorfield2d(@cellcycle2d, 0:0.1:2, 0:0.1:2, [], p);
nullclines2d(@cellcycle2d, 0:0.1:2, 0:0.1:2, [], p);
plot(x(:,1), x(:,2), 'k');
set(gca, 'XLim', [0 2], 'YLim', [0 2]);
xlabel('CDK1'); ylabel('APC');
hold off;

%% Delay system
% solve
lags = [tau1; tau2];
history = [0; 0];
tspan = [0 50];
sol = dde23(@cellcycle2d_dde, lags, history, tspan, [], p);

% plot
figure(3);
subplot(4,1,1);
plot(sol.x, sol.y);

subplot(4,1,2:4);
cla; hold on;
vectorfield2d(@cellcycle2d, 0:0.1:2, 0:0.1:2, [], p);
nullclines2d(@cellcycle2d, 0:0.1:2, 0:0.1:2, [], p);
plot(sol.y(1,:), sol.y(2,:), 'k');
set(gca, 'XLim', [0 2], 'YLim', [0 2]); 
xlabel('CDK1'); ylabel('APC');
hold off;

%% 2D system with extra positive feedback loop (bistable trigger)
% solve
x0 = [0; 0];
tspan = [0 50];
[t,x] = ode45(@cellcycle2d_bistable, tspan, x0, [], p);

% plot
figure(3);
subplot(4,1,1);
plot(t,x);

subplot(4,1,2:4);
cla; hold on;
vectorfield2d(@cellcycle2d_bistable, 0:0.1:2, 0:0.1:2, [], p);
nullclines2d(@cellcycle2d_bistable, 0:0.1:2, 0:0.1:2, [], p);
plot(x(:,1), x(:,2), 'k');
set(gca, 'XLim', [0 2], 'YLim', [0 2]);
xlabel('CDK1'); ylabel('APC');
hold off;

%% 3D system
% solve
x0 = [0; 0; 0];
tspan = [0 50];
[t,x] = ode45(@cellcycle3d, tspan, x0, [], p);

% plot
figure(4);
subplot(4,1,1);
plot(t,x);

subplot(4,1,2:4);
cla; hold on;
vectorfield3d(@cellcycle3d, 0:0.5:2, 0:0.5:2, 0:0.5:2, [], p);
plot3(x(:,1), x(:,2), x(:,3), 'k');
set(gca, 'XLim', [0 2], 'YLim', [0 2], 'ZLim', [0 2]);
view([-30 30]);
xlabel('CDK1'); ylabel('Plk1'); zlabel('APC');
hold off;



