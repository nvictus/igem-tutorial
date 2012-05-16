function ode_example2()
% DAMPED SPRING MODEL

ode_function = @spring;
time_span = [0 60]; 
x0 = [2, 1];

% Pass parameters to the solver as the 5th argument
[t, x] = ode15s(ode_function, time_span, x0);

% Plot time course
figure(gcf);
plot(t, x(:,1), 'r');
hold on;
plot(t, x(:,2), 'g');
title('spring');
xlabel('t');
legend({'position x(t)', 'velocity x''(t)'});

% Plot phase portrait
figure();
plot(x(:,1), x(:,2), 'k');
xlabel('position x(t)');
ylabel('velocity x''(t)');

end

function dxdt = spring(t, x)
m = 2;
k = 0.5;
b = 0.2;
X = x(1);
Y = x(2);

Xdot = Y;
Ydot = -(1/m)*(b*Y + k*X);

dxdt = [Xdot; Ydot];
end

