%{

editor: Rafael Lazar
data origin:  Schwerdtfeger 1994, Kantenfllterkontaktlinsen und Kantenfilter, ISSN 0173-2595, Zeitrschrift f�r
praktische Augenheilkunde
tool used: webplotdigitizer https://apps.automeris.io/wpd/
date of last modification: 22.02.2019
data specification:  spectral transmission curves for different cut-off
filter glasses
%}


%Data import Kantenfilter
CPF550S = dlmread('CPF 550 S.csv'); %loading data 
F580 = dlmread('F580.csv'); %loading data 
HydroFlexRP = dlmread('HydroFlex RP.csv'); %loading data 
L660 = dlmread('L 660.csv'); %loading data 


figure %Open new figure
plot(CPF550S(:,1),CPF550S(:,2),'--r'); %Plot CPF550S data as a scatter plot
title('transmission curves for different medical cut-off filters') %Add a title
set(gca,'xlim',[300, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(F580(:,1),F580(:,2),'-b'); %Plot F580 data 
plot(HydroFlexRP(:,1),HydroFlexRP(:,2),':k'); %Plot HydroflexRP data 
plot(L660(:,1),L660(:,2),'-.m'); %Plot L660 data 
hold on
legend({'CPF550S','F580','HydroFlexRP','L660'},'Location','northwest')

