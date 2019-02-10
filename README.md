# MATLAB_Turbojet_Optimizer
Sample Code: Optimization of Turbojet Engine based on Cost-Functions and Cruise Conditions

This code was developed by Patrick Chabelski in February 2016 for AER510, at UTIAS.
The purpose of this code was to optimize an aircraft engine based on customer (theoretical) performance and const-function constraints.
The controllable parameters for this analysis include core compression ratio (pi_c), fan compression ratio (pi_f) and bypass ratio (beta).

AER510_Project1_Main.m initializes the analysis variables, and contains all relevant jet engine performance equations to be solved.
The problem was set up such that three parameters could be modified through a MATLAB optimizer (fsolve) in order to solve the equations.
A spectrum of results is derived for various bypass ratio and compressor ratio configurations, with the subsequent cost functions being used to determine a solution.

AER510_Project1_fsolver.m takes parameters from the Main file and finds the solution to a system of equations to derive performance parameters for the given configuration.

AER510_Project1_Plots.m takes the resulting parameter matrices and plots the contours for visualization purposes.

Details on the project, underyling equations and code methodology can be found in the AER510 - Project 1.pdf report file.
