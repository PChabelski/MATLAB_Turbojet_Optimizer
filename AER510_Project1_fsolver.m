% ==========================================================================
% Patick Chabelski - 998242012
% AER510 Project 1 - Bypass Engine Optimization
% fsolver code for solving T05, P05, and Bypass Ratio for given Thrust 
% ==========================================================================

function X = AER510_Project1_fsolver(g,T05i,P05i,f,T02,uef,T03f)
% take initial guess in form x0 = [Beta, P05, T05]
% solve for the homogeneous solutions 
% given data in form y0 = [T05i, P05i, f, T02, et, uef, u, cp, Nn, Pe, T03f]

% T05i = 827;
% P05i = 233080;
% f = 0.0127;
% T02 = 263.235;
et = 0.94;
% uef = 352.9188;
u = 258.3972;
cp = 1000;
Nn = 0.95;
Pe = 23000;
% T03f = 298;
gam = 1.4;
gamexp = (gam/(0.4*et));

% Solve the system of equations for updated values of Beta, P05, and T05
X(1) = (g(1)/(g(1)+1))*(uef-u) + ((1+f)/(1+g(1)))*sqrt(2*cp*Nn*g(3)*(1-(Pe/g(2))^(0.4/1.4))) - (u/(1+g(1))) -125;
X(2) = P05i*((g(3)/T05i)^(gamexp))- g(2);
X(3) = T05i - ((1+g(1))/(1+f))*(T03f-T02) - g(3);
 
end
