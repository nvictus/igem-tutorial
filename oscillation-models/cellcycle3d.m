function dxdt = cellcycle3d(t, x, p)
CDK = x(1);
PLK = x(2);
APC = x(3);

dxdt = [ p.alpha1 - p.beta1*CDK*APC^p.n1/(p.K1^p.n1 + APC^p.n1)
         p.alpha2*(1 - PLK)*CDK^p.n2/(p.K2^p.n2 + CDK^p.n2) - p.beta2*PLK
         p.alpha3*(1 - APC)*PLK^p.n3/(p.K3^p.n3 + PLK^p.n3) - p.beta3*APC ];
     
end

