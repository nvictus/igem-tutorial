function dxdt = brusselator(t, x, p)
% BRUSSELATOR - requires parameters A and B
%   See http://en.wikipedia.org/wiki/Brusselator
dxdt = [ p.A + x(1)^2*x(2) - (p.B + 1)*x(1)
         p.B*x(1) - x(1)^2*x(2) ];
