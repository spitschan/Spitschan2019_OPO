%Data import BAILES 2013
HM = dlmread('human Opn4 Bailes 2013.csv'); %loading data for human melatonin sensitivity 
EBup = dlmread('error bars upper Bailes 2013.csv'); %loading data for upper error bars human melatonin sensitivity 
EBlow = dlmread('error bars lower Bailes 2013.csv'); %loading data for upper error bars human melatonin sensitivity 

 EBdif=[]; %New variable for Difference. Initializing it as empty.
for i = 1:length(HM); %Start i loop
 EBdif(i,1)= HM(i,2)- EBup(i,2);
 EBdif(i,2)= HM(i,2)- EBlow(i,2);
end

HMtot=horzcat(HM,EBdif);

figure %Open new figure
scatter(HMtot(:,1),HMtot(:,2),'or', 'filled'); %Plot the data as a scatter plot
set(gca,'xlim',[400,650],'YScale', 'log', 'ylim',[0.001,2]);% set the x-axis limits and scale y to log
xlabel('wavelength in nm'); %Label for the x-axis
ylabel('relative sensitivity'); %Label for the y-axis
title('human melanopsin sensitivity'); %Add a title
hold on;
errorbar(HMtot(:,1), HMtot(:,2),HMtot(:,3),HMtot(:,4));










