%{

editor: Rafael Lazar
data origin:  Herz & Yen 2005, Modulation of Sensory Photophobia
in Essential Blepharospasm
with Chromatic Lenses, https://doi.org/10.1016/j.ophtha.2005.06.030
tool used: webplotdigitizer https://apps.automeris.io/wpd/
date of last modification: 03.03.2019
data specification:  Spectral transmission characteristics of Lens FL-41
tint
%}

%Data import Kantenfilter 
FL41 = dlmread('FL41.csv'); %loading data 


figure %Open new figure
plot(FL41(:,1),FL41(:,2),'-r'); %Plot  data
title('transmission curves for medical cut-off filter lens FL-41') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on
legend({'FL-41'},'Location','northwest')
hold off
