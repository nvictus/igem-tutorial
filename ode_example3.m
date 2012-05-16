function ode_example3()
% van der pol oscillator

ode_function = @vanderpol;
time_span = [0 60]; 
x0 = [4, 2]; %[0,0];

% Use stiff solver
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
hold on;

plot(x(:,1), x(:,2), 'k');
xlabel('x(t)');
ylabel('x''(t)'); hold on;

xcoords = linspace(-6,6,20);
ycoords = linspace(-8,8,20);
vectorfield(ode_function, xcoords, ycoords);
set(gca, 'XLim', [-6, 6]);
set(gca, 'YLim', [-8, 8]);

% Exercise:
% loop through values of mu to visualize a bifurcation in the phase plane
end


function dydt = vanderpol(t, y)
mu = 5;
dydt = [ y(2); 
         mu*(1-y(1)^2)*y(2)-y(1) ]; 
end

