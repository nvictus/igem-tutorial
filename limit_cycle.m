function limit_cycle()

% For B<1+A the system is stable and approaches a fixed point.
% For B>1+A the system approaches a limit cycle
% Hopf bifurcation at B==1+A

% Parameters for the system (we will be varying B through the values in b_val)
p.A = 1;
b_val = 1.5:0.01:2.5;

figure(1);
pause;
xmax = 6;
ymax = 6;
xcoords = linspace(0,xmax,50); %grid for vectorfield
ycoords = linspace(0,ymax,50);

for i = 1:length(b_val)
    % Choose ith value for B
    p.B = b_val(i);
    
    % Pick a random initial point and compute a trajectory 
    x0 = [rand*xmax, rand*ymax];
    tspan = [0, 100];
    [t, x] = ode45(@brusselator, tspan, x0, [], p);
    
    % Plot the time course on the top subplot
    subplot(3,1,1);
    plot(t,x);
    set(gca, 'YLim', [0 ymax]);
    xlabel('time');
    
    % Plot the phase portrait on the bottom subplot
    subplot(3,1,2:3);
    plot(x(:,1),x(:,2), 'k', 'linewidth', 1.5); 
    hold on;
    vectorfield(@brusselator, xcoords, ycoords, p);
    set(gca, 'XLim', [0 xmax], 'YLim', [0 ymax]);
    xlabel('X'); ylabel('Y');
    axis square
    hold off;
    
    if p.B == 2
        h = msgbox('A Hopf bifurcation occurred!');
        uiwait(h);
    end
    
    % Pause to visualize
    pause(0.01);
end

