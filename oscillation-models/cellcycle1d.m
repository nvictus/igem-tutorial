function dxdt = cellcycle1d(t, x, p)
%One-ODE model of the cell cycle (fails to oscillate)
%   CDK activates APC which inactivates CDK
%
% Assume CDK1 is activated by rapid, high-affinity binding of cyclin,
%   synthesized at constant rate, alpha1.
% Assume CDK1 is inactivated via mass-action kinetics.
% Assume APC responds rapidly and ultrasensitively to CDK1 levels (fast equilibrium).

CDK = x;
APC = CDK^p.n1/(p.K1^p.n1 + CDK^p.n1);

dxdt = p.alpha1 - p.beta1*CDK*APC;

end

