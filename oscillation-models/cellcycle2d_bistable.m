function dxdt = cellcycle2d_bistable(t, x, p)
CDK = x(1);
APC = x(2);

dxdt = [ p.alpha1 - p.beta1*CDK*APC^p.n1/(p.K1^p.n1 + APC^p.n1)...
                  + p.alpha3*(1-CDK)*CDK^p.n3/(p.K3^p.n3 + CDK^p.n3)
         p.alpha2*(1-APC)*CDK^p.n2/(p.K2^p.n2 + CDK^p.n2) - p.beta2*APC ];
 
