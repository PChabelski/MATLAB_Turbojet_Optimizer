% ==========================================================================
% Patick Chabelski - 998242012
% AER510 Project 1 - Bypass Engine Optimization
% ENGINE: 2-spool turbofan engine, high-pressure turbine operating the core 
% compressor, low-pressure turbine operating the fan.
% GOAL: Minimize Cost Function via optimization of Core Compression Ratio,
% Fan Compression Ratio, and Bypass Ratio 
% RUNTIME: Approximately 30-40 seconds 
% Script developed February 2016
% ==========================================================================

% Target cruise conditions

Y = 1.4;       % Gamma
Mach = 0.85;
Pa = 23000;    % Atmospheric Flight Condition [Pa]
Ta = 230;
R = 287;       % Universal Gas Constant [J/kgK]
u = Mach*sqrt(Y*R*Ta);       % Aircraft flight speed (pre-engine intake)

% Component Efficiencies, Losses, and Parameters (hardcoded)

Nd = 0.98;      % Inlet Efficiency
Nb = 0.99;      % Fuel Combustion Efficiency
Nn = 0.95;      % Nozzle Efficiency (fan and core)
Nm = 1;         % Mechanical Efficiency (power transmission)

ec = 0.92;      % Compressor Polytropic Efficiency
ef = 0.93;      % Fan Polytropic Efficiency
et = 0.94;      % Turbine Polytropic Efficiency (High and Low Pressure Turbines)

Qr = 43000000;  % Fuel Heating Value [J/kg]
pi_b = 0.95;    % Combustor pressure loss
Pe = Pa;        % Exit Pressure (atmospheric, therefore flight condition)
T04 = 1380;     % Turbine Inlet Temperature (Maximum Allowable Temp)
cp = 1000;      % Heat capacity [J/kg]

beta_0 = 15;    % Bypass Parameter
pi_c_0 = 100;   % Core Compression Ratio Parameter
TSFC_0 = 0.5*10^-5;      % Thrust Specific Fuel Consumption Parameter

% Pre-Optimizer Solvable Parameters

T02 = Ta*(1 + ((Y-1)/2)*(Mach^2));            % Pre-fan Stagnation Temp
P02 = Pa*(1 + Nd*((T02/Ta - 1)))^(Y/(Y-1));   % Pre-fan Stagnation Pressure
P0a = Pa*(1+ ((Y-1)/2)*Mach^2)^(Y/(Y-1));
Pe = Pa;

% Miscellaneous Code Structure (setting up solve-space)

beta_matrix = zeros();
TSFC_matrix = zeros();
W_matrix = zeros();
F_matrix = zeros();
Cost_matrix = zeros();
fuelair_matrix = zeros();
T02_matrix = zeros();
P02_matrix = zeros();
T03f_matrix = zeros();
P03f_matrix = zeros();
T03_matrix = zeros();
P03_matrix = zeros();
P04_matrix = zeros();
T05i_matrix = zeros();
P05i_matrix = zeros();
P05_matrix = zeros();
T05_matrix = zeros();
ue_matrix = zeros();
uef_matrix = zeros();

counti = 1;
countj = 1;

% MAIN SOLVER CODE - LOOP THROUGH DESIGN SPACE, GET RELEVANT PARAMETERS

for compRatio = 10:1:60  % CYCLE THROUGH PRESSURE VALUES
    pi_c = compRatio;

    for bypassRatio = 1.1:0.025:2  % CYCLE THROUGH BYPASS RATIO VALUES
        pi_f = bypassRatio;

    	T03f = T02*pi_f^((Y-1)/(Y*ef));
    	P03f = P02*pi_f;
    	uef = sqrt(2*cp*Nn*T03f*(1-(Pe/P03f)^((Y-1)/Y)));
    	P03 = P03f*pi_c;
    	T03 = T03f*pi_c^((Y-1)/(Y*ec));
    	P04 = P03*pi_b;
    	f = ((T04/T03)-1)/(((Nb*Qr)/(cp*T03))-(T04/T03));
    	T05i = T04 + (1/(1+f))*(T03f-T03);
    	P05i = P04*(T05i/T04)^(Y/(et*(Y-1)));
     
        % Pass initial values to optimizer; selected values for Beta, P05, and T05      
    	guess = [5, 50000, 500];

    	%INITIALIZE MATLAB-OPTIMIZER - PASS VALUES, GET RESULTS

    	fun = @AER510_Project1_fsolver;
    	G = fsolve(fun,guess,optimset('MaxFunEvals',3000,'MaxIter',2000),T05i,P05i,f,T02,uef,T03f);
    	beta = G(1);
    	P05 = G(2);
    	T05 = G(3);
    	T0e = T05;
    
    	ue = sqrt(2*cp*Nn*T05*(1-(Pe/P05)^((Y-1)/Y)));
    	Spec_Thrust = 125;

    	TSFC = (1/(1+beta))*(f/(Spec_Thrust));
    
    
    	W = (beta/beta_0) + (pi_c/pi_c_0);
    	F = (TSFC/TSFC_0);
    	Cost = W + F;
    	beta_matrix(counti,countj) = beta;
    	TSFC_matrix(counti,countj) = TSFC;
    	W_matrix(counti,countj) = W;
    	F_matrix(counti,countj) = F;
    	Cost_matrix(counti,countj) = Cost;
    	fuelair_matrix(counti,countj) = f;
    	T02_matrix(counti,countj) = T02;
    	P02_matrix(counti,countj) = P02;
    	T03f_matrix(counti,countj) = T03f;
    	P03f_matrix(counti,countj) = P03f;
    	T03_matrix(counti,countj) = T03;
    	P03_matrix(counti,countj) = P03;
    	P04_matrix(counti,countj) = P04;
    	T05i_matrix(counti,countj) = T05i;
    	P05i_matrix(counti,countj) = P05i;
    	P05_matrix(counti,countj) = P05;
    	T05_matrix(counti,countj) = T05;
    	ue_matrix(counti,countj) = ue;
    	uef_matrix(counti,countj) = uef;
    	countj = countj+1;
	end
    counti = counti+1;
    countj = 1;
    end

    
    % All parameter matrices are generated. Can now create contour plots to visualize data as needed.
    % Or, access specific points via the matrices themselves...
    AER510_Project1_Plots
