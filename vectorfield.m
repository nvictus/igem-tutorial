function vectorfield(deqns, xval, yval, varargin)
% VECTORFIELD Creates a quiver plot of the direction field of a 2-D system
%   - deqns calculates a pair of derivatives (x',y') at point (x,y)
%   - xval and yval are the x- and y-coordinates of the positions in the 
%     phase plane at which to draw the arrows.

m  = length(xval);
n  = length(yval);
xprime = zeros(n,m);
yprime = zeros(n,m);

for a = 1:m
    for b = 1:n
        pts = feval(deqns, 0, [xval(a); yval(b)], varargin{:});
        xprime(b,a) = pts(1);
        yprime(b,a) = pts(2);
    end
end

arrow = sqrt(xprime.^2+yprime.^2);
quiver(xval,yval, xprime./arrow, yprime./arrow, 0.5,'r');
%axis tight;