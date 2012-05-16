function dydt = lotka_volterra(t, y, p)
% LOTKA-VOLTERRA - "Predator-Prey" equations
%   Requires parameters: alpha, beta, gamma, delta
%   y(1) is the "prey" populatoin, y(2) is the "predator" population
dydt = [  y(1)*(p.alpha - p.beta*y(2))   ;
         -y(2)*(p.gamma - p.delta*y(1)) ];