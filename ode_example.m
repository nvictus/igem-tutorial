function ode_example()

% EXPONENTIAL GROWTH/DECAY
time_span = [0 200]; 
x0 = 1;
[t, x] = ode45(@expo, time_span, x0);

% LOGISTIC GROWTH
[t2, x2] = ode45(@logistic, time_span, x0);

figure(1);
plot(t, x, 'r');
title('exponential growth');
ylabel('x(t)');
xlabel('t');

figure(2);
plot(t2, x2, 'b-o');
title('logistic growth');
ylabel('x(t)');
xlabel('t');

end

function dxdt = expo(t, x)
dxdt = log(2)/10*x;
end

function dxdt = logistic(t, x)
dxdt = log(2)/10*x*(1 - x/50);
end

