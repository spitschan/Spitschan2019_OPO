%Data import BAILES 2013
HM = dlmread('human Opn4 Bailes 2013.csv'); %loading data for human melatonin sensitivity
EBup = dlmread('error bars upper Bailes 2013.csv'); %loading data for upper error bars human melatonin sensitivity
EBlow = dlmread('error bars lower Bailes 2013.csv'); %loading data for upper error bars human melatonin sensitivity

% Save the loop
EBdif(:, 1) = HM(:, 2)-EBup(:, 2);
EBdif(:, 2) = HM(:, 2)-EBlow(:, 2);

figure %Open new figure
scatter(HM(:,1),HM(:,2),'or', 'filled'); %Plot the data as a scatter plot
set(gca,'xlim',[400,650],'YScale', 'log', 'ylim',[0.001,2]);% set the x-axis limits and scale y to log
xlabel('wavelength in nm'); %Label for the x-axis
ylabel('relative sensitivity'); %Label for the y-axis
title('human melanopsin sensitivity'); %Add a title
hold on;
errorbar(HM(:,1), HM(:,2), EBdif(:,1), EBdif(:,2));