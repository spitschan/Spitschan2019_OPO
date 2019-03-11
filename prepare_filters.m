
%{
editor: Rafael Lazar
tool used for data: webplotdigitizer https://apps.automeris.io/wpd/
functions of luminance and melanopsin via Manuel Spitschan on gitHub
https://github.com/spitschan

date created: 04.03.2019
date of last modification: 08.03.2019
specification: prepare filter glass data for melanopsin effect
computations -  inter- & extra-polation.
%}



% query x Koordinaten definieren 380nm - 780nm
nm= 380:1:780;

%cell array with file names to import
theFiles = {'ZeissClarletF580.csv'; 'WoehlkHydroFlexRP.csv' ;'RodenstockL660.csv';'CorningCPF550S.csv';'ZeissF580.csv' ;'ZeissF560.csv';...
    'ZeissF540.csv';'ZeissF90.csv';'ZeissF80.csv'; 'ZeissF60.csv'; 'ZeissSkyletSport.csv'; 'ZeissSkyletRoad.csv'; 'ZeissSkyletFun.csv'; ...
    'RodenstockL660_90.csv'; 'RodenstockL660_80.csv'; 'Multilens550POL.csv'; 'Multilens527POL.csv'; 'Multilens511POL.csv';...
    'Multilens550Transitions_unbelichtet.csv'; 'Multilens550Transitions_belichtet.csv'; 'Multilens527Transitions_unbelichtet.csv';...
    'Multilens527Transitions_belichtet.csv'; 'Multilens511Transitions_unbelichtet.csv'; 'Multilens511Transitions_belichtet.csv';...
    'Multilens550.csv'; 'Multilens527.csv'; 'Multilens511.csv';'Multilens450POL.csv';'Multilens450.csv'; ...
    'MultilensTransitions450_unbelichtet.csv'; 'Multilens450Transitions_belichtet.csv'; 'EssilorOrmaRT85.csv'; 'EssilorOrmaRT50.csv';...
    'Eschenbach550POL.csv';'Eschenbach527POL.csv'; 'Eschenbach511POL.csv'; 'Eschenbach550.csv'; 'Eschenbach527.csv'; 'Eschenbach511.csv';...
    'Eschenbach450POL.csv'; 'Eschenbach450.csv'; 'Corning550.csv'; 'Corning527.csv'; 'Corning511.csv'; 'FL41.csv'};

filterTypes=[1;1;1;1;1;1; ...
    1;1;1;1;3;3;3; ...
    1;1;1;1;1; ...
    1;1;1; ...
    1;1;1; ...
    1;1;1;3;3; ...
    3;3;3;3; ...
    1;1;1;1;1;1;
    3;3;1;1;1;1];

filterTypes_label={'medical lenses'; 'safety lenses'; 'recreational lenses'};


%start loop for all files & import iith raw data with dlmread from the cell
%array theFiles
NFiles = length(theFiles)
for ii = 1:NFiles
    rawdat_ii = dlmread(theFiles{ii});
    
    % create vector of rawdata that is unique
    %if rawdata has not same length as unique array (duplicate X values)  
    % --> for each group of equal x values of rawdat_ii ("subs") 
    % y values are avareged and stored in the location in
    % "means_duplicatedata" corresponding to x of the averaged values
    % rawdat_ii matrix is substituted with pruned data
    
    x_unique= unique(rawdat_ii(:,1));
 
    repeatedValuesPresentYesNo = ~(length(rawdat_ii(:,1)) == length(x_unique));
    if repeatedValuesPresentYesNo==1
         means_duplicatedata = accumarray( rawdat_ii(:,1), rawdat_ii(:,2),[], @mean );
         rawdat_ii = [x_unique, means_duplicatedata(x_unique)];
               
    end

%Transmissionsdaten in Prozent für das jeweilige Spektrum in nm
%interpolieren --> geschätzte Y Werte an den Stellen xq mit spline Methode,
%extrapolieren --> alle missing values außerhalb des x ranges = 0 setzen

T= interp1(rawdat_ii(:,1),rawdat_ii(:,2),nm,'spline',NaN);

%change unit from percent to decimal
T= (T ./ 100)';

%T_alleKurven --> Matrix mit allen Filtern: 401*N 
%label der Filter -->  T_alleKurven Spalte 1 = theFiles{1} = ZeissClarletF580.csv
%Spalte 2 --> theFiles{2} = WoehlkHydroFlexRP.csv...

T_alleKurven(:, ii) = T;
 
end

save('T_alleKurven.mat','T_alleKurven', 'theFiles','filterTypes', 'filterTypes_label');


%plotten aller Kurven
plot (nm ,T_alleKurven ,'.k');
title('filter transmission curves') %Add a title
set(gca,'xlim',[380, 780], 'ylim',[0,1]);% set the x-axis & y-axis values
xlabel('wavelength (nm)'); %Label for the x-axis
ylabel('relative transmission'); %Label for the y-axis
hold on;


%Add Melanopsin sensitivity function & luminance function to plot
CIES026=GetCIES026;
melanopsinfun=CIES026(5,:);
luminancefile=dlmread('lin2012xyz10e_1_7sf.csv');
% prune & pad luminance data so it fits the nm dimensions 380:1:780
lumifun=[zeros(1,10),(luminancefile(1:391,3)')];
plot (nm ,melanopsinfun,'-r');
hold on
plot (nm, lumifun, '-b')

