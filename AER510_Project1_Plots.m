
% ==========================================================================
% Patick Chabelski - 998242012
% AER510 Project 1 - Bypass Engine Optimization
% Contour Plot Generation 
% Define and comment/uncomment plots as needed, run at the end of the main script
% ==========================================================================

% Normalize Plot Settings
x_ticks = [1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0];
y_ticks = [10 15 20 25 30 35 40 45 50 55 60];


subplot(2,3,4)
contourf(beta_matrix);
title('4: Bypass Ratio Distribution Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

subplot(2,3,6)
contourf(TSFC_matrix);
title('6: TSFC Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

subplot(2,3,2)
contourf(W_matrix);
title('2: Weight Penalty (W) Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

subplot(2,3,3)
contourf(F_matrix);
title('3: Fuel Penalty (F) Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

subplot(2,3,1)
contourf(Cost_matrix);
title('1: Cost Function (C) Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

subplot(2,3,5)
contourf(fuelair_matrix);
title('5: Fuel-Air Ratio Distribution Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

figure
contourf(Cost_matrix);
title('Cost Function (C) Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

figure
contourf(beta_matrix);
title('Bypass Ratio Distribution Plot')
set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
xlabel('Pi_f')
ylabel('Pi_C')

% Display optimized engine temperature and pressure parameters 
% Located at Row 21, Column 25 according to smallest value location of Cost_Matrix

f_opt = fuelair_matrix(21,25)
T02_opt = T02_matrix(21,25)
P02_opt = P02_matrix(21,25)
T03f_opt = T03f_matrix(21,25)
P03f_opt = P03f_matrix(21,25)
T03_opt = T03_matrix(21,25)
P03_opt = P03_matrix(21,25)
P04_opt = P04_matrix(21,25)
T05i_opt = T05i_matrix(21,25)
P05i_opt = P05i_matrix(21,25)
P05_opt = P05_matrix(21,25)
T05_opt = T05_matrix(21,25)

% % Subplot Generator for Temperatures
% % Uncomment if necessary
% figure
% 
% subplot(2,2,1)
% contourf(T03f_matrix);
% title('1: Post-Fan Stagnation Temperature (T03f)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,2,2)
% contourf(T03_matrix);
% title('2: Post Compressor Stagnation Temperature (T03)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,2,3)
% contourf(T05i_matrix);
% title('3: Post 1st Spool Turbine (Compressor-Turbine) Stagnation Temperature (T05i)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,2,4)
% contourf(T05_matrix);
% title('4: Post 2nd Spool Turbine (Fan-Turbine) Stagnation Temperature (T05)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% % Subplot Generator for Pressures
% % Uncomment if necessary
% figure
% 
% subplot(2,3,1)
% contourf(P03f_matrix);
% title('1: Post-Fan Stagnation Pressure (P03f)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,3,2)
% contourf(P03_matrix);
% title('2: Post Compressor Stagnation Pressure (P03)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,3,3)
% contourf(P04_matrix);
% title('3: Post Combustion Stagnation Pressure (P04)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,3,4)
% contourf(P05i_matrix);
% title('4: Post 1st Spool Turbine (Compressor-Turbine) Stagnation Pressure (P05i)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
% 
% subplot(2,3,5)
% contourf(P05_matrix);
% title('5: Post 2nd Spool Turbine (Fan-Turbine) Stagnation Pressure (P05)' )
% set(gca,'XTick',1:4:80,'XTickLabel', x_ticks)
% set(gca,'YTick',1:5:60,'YTickLabel', y_ticks)
% xlabel('Pi_f')
% ylabel('Pi_C')
