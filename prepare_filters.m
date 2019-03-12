
%{
editor: Rafael Lazar
tool used for data: webplotdigitizer https://apps.automeris.io/wpd/
functions of luminance and melanopsin via Manuel Spitschan on gitHub
https://github.com/spitschan

date created: 04.03.2019
date of last modification: 12.03.2019
specification: prepare filter glass data for melanopsin effect
computations -  inter- & extra-polation.
%}



% query x Koordinaten definieren 380nm - 780nm
nm= 380:1:780;

%cell array with file names to import
theFiles = {'Schwerdtfeger1994_ZeissClarletF580.csv'; 'Schwerdtfeger1994_WoehlkHydroFlexRP.csv' ;'Schwerdtfeger1994_RodenstockL660.csv';'Schwerdtfeger1994_CorningCPF550S.csv';'ZeissF580.csv';
    'ZeissF560.csv';'ZeissF540.csv';'ZeissF90.csv';'ZeissF80.csv'; 'ZeissF60.csv';
    'ZeissSkyletSport.csv'; 'ZeissSkyletRoad.csv'; 'ZeissSkyletFun.csv';'RodenstockL660_90.csv'; 'RodenstockL660_80.csv';
    'Multilens550POL.csv'; 'Multilens527POL.csv'; 'Multilens511POL.csv';'Multilens550Transitions_unbelichtet.csv'; 'Multilens550Transitions_belichtet.csv';
    'Multilens527Transitions_unbelichtet.csv';'Multilens527Transitions_belichtet.csv'; 'Multilens511Transitions_unbelichtet.csv'; 'Multilens511Transitions_belichtet.csv';'Multilens550.csv';
    'Multilens527.csv'; 'Multilens511.csv';'Multilens450POL.csv';'Multilens450.csv';'MultilensTransitions450_unbelichtet.csv';
    'Multilens450Transitions_belichtet.csv'; 'EssilorOrmaRT85.csv'; 'EssilorOrmaRT50.csv';'Eschenbach550POL.csv';'Eschenbach527POL.csv';
    'Eschenbach511POL.csv'; 'Eschenbach550.csv'; 'Eschenbach527.csv'; 'Eschenbach511.csv'; 'Eschenbach450POL.csv';
    'Eschenbach450.csv'; 'Corning550.csv'; 'Corning527.csv'; 'Corning511.csv';'3M_2846_red-orange.csv';
    'BPI_DiamondDye5_40nm.csv';'BPI_DiamondDye550nm.csv';'BPI_DriverTint.csv';'BPI_Euro-Brown.csv';'BPI_Golf_tint.csv';
    'BPI_Golfer_Advantage.csv';'BPI_Golfer_Blu.csv';'BPI_Monochrome_600nm.csv';'BPI_Skeet_tint.csv';'BPI_Ski_tint.csv';
    'BPI_Sport_tint.csv';'BPI_Tennis_tint.csv';'BPI_Winter_SUN.csv';'Burkhart2009_NoIR_Polycarbonate_Eyewear.csv';'DAO-AG_0C1.csv';
    'DAO-AG_L41-A.csv';'DAO-AG_L41-B.csv';'DAO-AG_L41-C.csv';'DAO-AG_L400.csv';'DAO-AG_L450.csv';
    'DAO-AG_L480-50.csv';'DAO-AG_L480-75.csv';'DAO-AG_L480-90.csv';'DAO-AG_L500-H.csv';'DAO-AG_L500.csv';
    'DAO-AG_L511-H.csv';'DAO-AG_L511.csv';'DAO-AG_L527-H.csv';'DAO-AG_L527.csv';'DAO-AG_L540-50.csv';
    'DAO-AG_L540-70.csv';'DAO-AG_L550.csv';'DAO-AG_L585.csv';'DAO-AG_LC1-H.csv';'Esaki2016_LowBlueLights.com_amber.csv';
    'Esaki2017_YamamotoKogaku_No360S_UV_Orange.csv';'Figuero2010_UVProcess_orange.csv';'Gimenez2014_Softorangecontactlenses_UltravisionInternational.csv';'Herz2005_FL41.csv';'Hoggan2015_480nm_notchfilter.csv';
    'Hoggan2015_620nm_notchfilter.csv';'Kayumov2005_Offenhaueser_BergerGmbH.csv';'Krueger2017_Eschenbach_wellnessPROTECTwp15.csv';'Lin2016_Jins_ScreenClear.csv';'Lin2016_Jins_ScreenNight.csv';
    'Multilens_LLR_NightCover.csv';'NoIR_medical_47.csv';'NoIR_medical_50.csv';'NoIR_medical_60.csv';'NoIR_medical_68.csv';
    'NoIR_medical_72.csv';'NoIR_medical_90.csv';'NoIR_medical_93.csv';'NoIR_medical_465.csv';'NoIR_medical_505.csv';
    'NoIR_medical_533.csv';'NoIR_medical_553.csv';'NoIR_medical_570.csv';'offenhaeuser-berger_de_laserschutzbrille_0000001012726_red.csv';'offenhaeuser-berger_de_laserschutzbrille_0000001012731_orange.csv';
    'offenhaeuser-berger_de_laserschutzbrille_0000003013447_red-orange.csv';'offenhaeuser-berger_de_laserschutzbrille_2054110000002_yellow.csv';'Ostrin2017_Uvex_Ultraspec2000_SCTOrange.csv';'Rosenblum2000_filter_albino_patients.csv';'Rosenblum2000_filter_aphakic_patients.csv';
    'Rosenblum2000_filter_initialcataract_patients.csv';'Sasseville2006_Eschenbach_SolarShieldUltra.csv';'Sasseville2009_Telemedoptique_custom_made.csv';'Sasseville2009_Uvex_SCT_Orange.csv';'Sasseville2010_Chron-Optic_orange_lens_glasses_Telemedoptique.csv';
    'Somnilight_AmberSleepGlasses.csv';'SomniLight_MigraineReliefLenses.csv';'Swisslens_SLF450.csv';'Swisslens_SLF511.csv';'Swisslens_SLF527.csv';
    'Swisslens_SLF550.csv';'vanderLely2015_Chron-optic_Inc_orange.csv';'Zeitzer1979_X-Chrom_contact_lenses_final.csv';'Zeitzer1979_X-Chrom_contact_lenses_modified.csv';'Zerbini2018_AugenLichtSchutz_Koenigswinter_red.csv'};

filter_Taxonomie1= ...
    [1;1;1;1;1;
    1;1;1;1;1;
    3;4;6;1;1;
    1;1;1;1;1;
    1;1;1;1;1;
    1;1;1;1;1;
    1;1;1;1;1;
    1;1;1;1;1;
    1;1;1;1;2;
    1;1;4;1;3;
    3;3;1;3;3;
    3;3;6;1;1;
    5;5;5;5;1;
    1;1;1;1;1;
    1;1;1;1;1;
    1;1;1;1;6;
    2;2;1;1;1;
    1;2;1;5;5;
    4;1;3;3;5;
    1;1;1;3;3;
    3;1;1;2;2;
    2;2;2;1;1;
    1;1;6;2;6;
    6;1;1;1;1;
    1;6;1;1;2];
    
filter_Taxonomie2=[];



filter_Taxonomie1_label={'medical lenses'; 'safety lenses'; 'recreational lenses - sports';'recreational lenses - driving';'recreational lenses - VDM use'; 'recreational lenses - other'};
filter_Taxonomie2_label={};

%start loop for all files & import iith raw data with dlmread from the cell
%array theFiles
NFiles = length(theFiles);
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

save('T_alleKurven.mat','T_alleKurven', 'theFiles',...
    'filter_Taxonomie1', 'filter_Taxonomie2', 'filter_Taxonomie1_label','filter_Taxonomie2_label' );


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

