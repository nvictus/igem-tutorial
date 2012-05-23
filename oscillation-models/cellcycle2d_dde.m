function dxdt = cellcycle2d_dde(t, x, Z, p)
CDK = x(1);
APC = x(2);
CDK_lag1 = Z(1,1);
APC_lag2 = Z(2,2);

dxdt = [ p.alpha1 - p.beta1*CDK*APC_lag2^p.n1/(p.K1^p.n1 + APC_lag2^p.n1)
         p.alpha2*(1 - APC)*CDK_lag1^p.n2/(p.K2^p.n2 + CDK_lag1^p.n2) - p.beta2*APC ];

end
