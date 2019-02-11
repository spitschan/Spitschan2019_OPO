%{

editor: Rafael Lazar
data origin:  Bouma 1962 https://doi.org/10.1038/193690a0
tool used: webplotdigitizer https://apps.automeris.io/wpd/
date of last modification: 11.02.2019
data specification:  Static pupil size related to log lumlnous flux F (lumen)
incldent on the human eye for different wave-lengths. Vlsual
angle 26° centrcd on fovea. Subject HB.
%}


%Data import Bouma 1962
nm425 = dlmread('425nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5
nm445 = dlmread('445nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5
nm515 = dlmread('515nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5
nm535 = dlmread('535nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5
nm565 = dlmread('565nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5
nm670 = dlmread('670nm Bouma 1962.csv'); %loading data for human melatonin sensitivity5

figure %Open new figure
scatter(nm425(:,1),nm425(:,2),'or'); %Plot 425nm data as a scatter plot
title('static pupil size related to log flux') %Add a title
set(gca,'xlim',[10^-9,1],'XScale', 'log', 'ylim',[2,8]);% set the x-axis values to 1 to 9
xlabel('log F(lumen)'); %Label for the x-axis
ylabel('pupil diameter (mm.)'); %Label for the y-axis
hold on;
scatter(nm445(:,1),nm445(:,2),'+b'); %Plot 445nm data as a scatter plot
scatter(nm515(:,1),nm515(:,2),'^g'); %Plot 515nm data as a scatter plot
scatter(nm535(:,1),nm535(:,2),'sm'); %Plot 535nm data as a scatter plot
scatter(nm565(:,1),nm565(:,2),'xk'); %Plot 565nm data as a scatter plot
scatter(nm670(:,1),nm670(:,2),'oc', 'filled'); %Plot 670nm data as a scatter plot

