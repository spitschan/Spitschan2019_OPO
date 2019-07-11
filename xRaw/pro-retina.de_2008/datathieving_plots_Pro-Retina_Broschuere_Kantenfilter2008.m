%{

editor: Rafael Lazar
data origin:  pro-retina.de "Kantenfilter und seitlicher Blendschutz – ein praktischer Ratgeber«
gemeinsame Empfehlungen der Pro Retina und der WVAO
erstellt von Klaus Plum (WVAO) und Dr. Konrad Gerull (Pro Retina)
2. Auflage, März 2008"

tool used: webplotdigitizer https://apps.automeris.io/wpd/
date of last modification: 01.03.2019
data specification:  spectral transmission curves for different medical cut-off
filter glasses
%}
%% CORNING 511-550

%Data import Kantenfilter 
Corning511 = dlmread('Corning511.csv'); %loading data 
Corning527 = dlmread('Corning527.csv'); %loading data 
Corning550 = dlmread('Corning550.csv'); %loading data


figure %Open new figure
plot(Corning511(:,1),Corning511(:,2),'--r'); %Plot data
title('transmission curves for medical cut-off filters: Corning511-550') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Corning527(:,1),Corning527(:,2),'-b'); %Plot data 
plot(Corning550(:,1),Corning550(:,2),':k'); %Plot data
hold on
legend({'Corning511','Corning527','Corning550'},'Location','northwest')
hold off
%% Eschenbach450 + 450POL

%Data import Kantenfilter 
Eschenbach450 = dlmread('Eschenbach450.csv'); %loading data 
Eschenbach450POL = dlmread('Eschenbach450POL.csv'); %loading data 



figure %Open new figure
plot(Eschenbach450(:,1),Eschenbach450(:,2),'--r'); %Plot  data 
title('transmission curves for medical cut-off filters: Eschenbach450 + 450POL') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Eschenbach450POL(:,1),Eschenbach450POL(:,2),'-b'); %Plot  data 
hold on
legend({'Eschenbach450','Eschenbach450POL'},'Location','northwest')
hold off

%% Eschenbach 511 - 550

%Data import Kantenfilter 
Eschenbach511 = dlmread('Eschenbach511.csv'); %loading data 
Eschenbach527 = dlmread('Eschenbach527.csv'); %loading data 
Eschenbach550 = dlmread('Eschenbach550.csv'); %loading data 



figure %Open new figure
plot(Eschenbach511(:,1),Eschenbach511(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Eschenbach511-550') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Eschenbach527(:,1),Eschenbach527(:,2),'-b'); %Plot data
plot(Eschenbach550(:,1),Eschenbach550(:,2),':k'); %Plot data
hold on
legend({'Eschenbach511','Eschenbach527','Eschenbach550'},'Location','northwest')
hold off
%% Eschenbach511POL - 550POL

%Data import Kantenfilter 
Eschenbach511POL = dlmread('Eschenbach511POL.csv'); %loading data 
Eschenbach527POL = dlmread('Eschenbach527POL.csv'); %loading data 
Eschenbach550POL = dlmread('Eschenbach550POL.csv'); %loading data



figure %Open new figure
plot(Eschenbach511POL(:,1),Eschenbach511POL(:,2),'--r'); %Plot data
title('transmission curves for medical cut-off filters: Eschenbach511POL-550POL') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Eschenbach527POL(:,1),Eschenbach527POL(:,2),'-b'); %Plot data 
plot(Eschenbach550POL(:,1),Eschenbach550POL(:,2),':k'); %Plot data
hold on
legend({'Eschenbach511POL','Eschenbach527POL','Eschenbach550POL'},'Location','northwest')
hold off
%% Essilor Orma RT50% + Orma RT80%

%Data import Kantenfilter 
EssilorOrmaRT50 = dlmread('EssilorOrmaRT50.csv'); %loading data 
EssilorOrmaRT85 = dlmread('EssilorOrmaRT85.csv'); %loading data 


figure %Open new figure
plot(EssilorOrmaRT50(:,1),EssilorOrmaRT50(:,2),'--r'); %Plot data
title('transmission curves for medical cut-off filters: Essilor Orma RT50 + RT85') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(EssilorOrmaRT85(:,1),EssilorOrmaRT85(:,2),'-b'); %Plot  data 
hold on
legend({'Essilor Orma RT50','Essilor Orma RT85'},'Location','northwest')
hold off



%% Multilens 450 Transitions belichtet & unbelichtet


%Data import Kantenfilter 
MultilensTransitions450_belichtet = dlmread('Multilens450Transitions_belichtet.csv'); %loading data 
MultilensTransitions450_unbelichtet = dlmread('MultilensTransitions450_unbelichtet.csv'); %loading data


figure %Open new figure
plot(MultilensTransitions450_belichtet(:,1),MultilensTransitions450_belichtet(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Multilens 450 Transitions belichtet und unbelichtet') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(MultilensTransitions450_unbelichtet(:,1),MultilensTransitions450_unbelichtet(:,2),'-b'); %Plot  data 
hold on
legend({'MultilensTransitions450 belichtet','MultilensTransitions450 unbelichtet',},'Location','northwest')
hold off

%% Multilens 511 - 550

%Data import Kantenfilter 
Multilens511 = dlmread('Multilens511.csv'); %loading data 
Multilens527 = dlmread('Multilens527.csv'); %loading data
Multilens550 = dlmread('Multilens550.csv'); %loading data

figure %Open new figure
plot(Multilens511(:,1),Multilens511(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Multilens 511 - 550') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Multilens527(:,1),Multilens527(:,2),'-b'); %Plot  data 
plot(Multilens550(:,1),Multilens550(:,2),':k'); %Plot data
hold on
legend({'Multilens 511 ','Multilens 527 ','Multilens 550'},'Location','northwest')
hold off


%% Multilens 511 Transitions - 550 Transitions belichtet und unbelichtet


%Data import Kantenfilter 
Multilens511Transitions_belichtet = dlmread('Multilens511Transitions_belichtet.csv'); %loading data 
Multilens511Transitions_unbelichtet = dlmread('Multilens511Transitions_unbelichtet.csv'); %loading data
Multilens527Transitions_belichtet = dlmread('Multilens527Transitions_belichtet.csv'); %loading data
Multilens527Transitions_unbelichtet = dlmread('Multilens527Transitions_unbelichtet.csv'); %loading data
Multilens550Transitions_belichtet = dlmread('Multilens550Transitions_belichtet.csv'); %loading data
Multilens550Transitions_unbelichtet = dlmread('Multilens550Transitions_unbelichtet.csv'); %loading data


figure %Open new figure
plot(Multilens511Transitions_belichtet(:,1),Multilens511Transitions_belichtet(:,2),'-r'); %Plot  data
title('transmission curves for medical cut-off filters: Multilens Transitions 511 - 550 belichtet & unbelichtet') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Multilens511Transitions_unbelichtet(:,1),Multilens511Transitions_unbelichtet(:,2),'--r'); %Plot  data 
plot(Multilens527Transitions_belichtet(:,1),Multilens527Transitions_belichtet(:,2),'-k'); %Plot data
plot(Multilens527Transitions_unbelichtet(:,1),Multilens527Transitions_unbelichtet(:,2),'--k'); %Plot data
plot(Multilens550Transitions_belichtet(:,1),Multilens550Transitions_belichtet(:,2),'-b'); %Plot data
plot(Multilens550Transitions_unbelichtet(:,1),Multilens550Transitions_unbelichtet(:,2),'--b'); %Plot data

hold on
legend({'Multilens 511 Transitions belichtet','Multilens 511 Transitions unbelichtet','Multilens 527 Transitions belichtet', 'Multilens 527 Transitions unbelichtet', 'Multilens 550 Transitions belichtet', 'Multilens 550 Transitions unbelichtet'},'Location','northwest')
hold off
%% Multilens 511POL - 550POL

%Data import Kantenfilter 
Multilens511POL = dlmread('Multilens511POL.csv'); %loading data 
Multilens527POL = dlmread('Multilens527POL.csv'); %loading data
Multilens550POL = dlmread('Multilens550POL.csv'); %loading data

figure %Open new figure
plot(Multilens511POL(:,1),Multilens511POL(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Multilens 511POL - 550POL') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(Multilens527POL(:,1),Multilens527POL(:,2),'-b'); %Plot  data 
plot(Multilens550POL(:,1),Multilens550POL(:,2),':k'); %Plot data
hold on
legend({'Multilens 511 POL','Multilens 527 POL','Multilens 550 POL'},'Location','northwest')
hold off
%% Rodenstock L660 80% & 90%

%Data import Kantenfilter 
RodenstockL660_80 = dlmread('RodenstockL660_80.csv'); %loading data 
RodenstockL660_90 = dlmread('RodenstockL660_90.csv'); %loading data


figure %Open new figure
plot(RodenstockL660_80(:,1),RodenstockL660_80(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Rodenstock L660 80% & 90%') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(RodenstockL660_90(:,1),RodenstockL660_90(:,2),'-b'); %Plot  data 
hold on
legend({'RodenstockL660 80','RodenstockL660 90'},'Location','northwest')
hold off

%% Zeiss Skylet Fun, Road & Sport

%Data import Kantenfilter 
ZeissSkyletFun = dlmread('ZeissSkyletFun.csv'); %loading data 
ZeissSkyletRoad = dlmread('ZeissSkyletRoad.csv'); %loading data
ZeissSkyletSport = dlmread('ZeissSkyletSport.csv'); %loading data

figure %Open new figure
plot(ZeissSkyletFun(:,1),ZeissSkyletFun(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Zeiss Skylet Fun, Road & sport') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(ZeissSkyletRoad(:,1),ZeissSkyletRoad(:,2),'-b'); %Plot  data 
plot(ZeissSkyletSport(:,1),ZeissSkyletSport(:,2),':k'); %Plot data
hold on
legend({'Zeiss Skylet Fun','Zeiss Skylet Road','Zeiss Skylet Sport'},'Location','northwest')
hold off
%% Zeiss F60 - F90

%Data import Kantenfilter 
ZeissF60 = dlmread('ZeissF60.csv'); %loading data 
ZeissF80 = dlmread('ZeissF80.csv'); %loading data
ZeissF90 = dlmread('ZeissF90.csv'); %loading data

figure %Open new figure
plot(ZeissF60(:,1),ZeissF60(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Zeiss F60 - F90') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(ZeissF80(:,1),ZeissF80(:,2),'-b'); %Plot  data 
plot(ZeissF90(:,1),ZeissF90(:,2),':k'); %Plot data
hold on
legend({'Zeiss F60','Zeiss F80','Zeiss F90'},'Location','northwest')
hold off

%% Zeiss F540 - F580
%Data import Kantenfilter 
ZeissF540 = dlmread('ZeissF540.csv'); %loading data 
ZeissF560 = dlmread('ZeissF560.csv'); %loading data
ZeissF580 = dlmread('ZeissF580.csv'); %loading data

figure %Open new figure
plot(ZeissF540(:,1),ZeissF540(:,2),'--r'); %Plot  data
title('transmission curves for medical cut-off filters: Zeiss F540 - F580') %Add a title
set(gca,'xlim',[350, 800], 'ylim',[0,100]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission (%)'); %Label for the y-axis
hold on;
plot(ZeissF560(:,1),ZeissF560(:,2),'-b'); %Plot  data 
plot(ZeissF580(:,1),ZeissF580(:,2),':k'); %Plot data
hold on
legend({'Zeiss F540','Zeiss F560','Zeiss F580'},'Location','northwest')
hold off

%%