
%{
editor: Rafael Lazar
tool used for data: webplotdigitizer https://apps.automeris.io/wpd/
functions of luminance and melanopsin via Manuel Spitschan on gitHub
https://github.com/spitschan

date created: 04.03.2019
date of last modification: 14.03.2019
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
    'Swisslens_SLF550.csv';'vanderLely2015_Chron-optic_Inc_orange.csv';'Zeitzer1979_X-Chrom_contact_lenses_final.csv';'Zeitzer1979_X-Chrom_contact_lenses_modified.csv';'Zerbini2018_AugenLichtSchutz_Koenigswinter_red.csv';
    'AugenLichtschutz _Solsecur_yellow_sx.csv';'AugenLichtschutz _Typ31_solsecur-P90.csv'; 'AugenLichtschutz_Solsecur_red_xd.csv'};

%numerical coding of the filter taxonomy based on commerce
%corredsponding labels found inthe filter_taxonomy1_label cell array

type_bbFilters= ...
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
    1;6;1;1;6;
    4;1;2];

%numerical coding of the filter taxonomy based on filter traits
% corredsponding labels found in the filter_taxonomy2_label cell array

filter_taxonomy2=[];


type_label={'medical lenses'; 'safety lenses'; 'recreational lenses - sports';'recreational lenses - driving';'recreational lenses - VDM use'; 'recreational lenses - other'};
filter_taxonomy2_label={'longpass filter', 'notch filter', 'neutral density filter'};

%Manufacturers of the filter
Manufacturer = {'Zeiss'; 'Woehlk' ;'Rodenstock';'Corning';'Zeiss';
    'Zeiss';'Zeiss';'Zeiss';'Zeiss'; 'Zeiss';
    'Zeiss'; 'Zeiss'; 'Zeiss';'Rodenstock'; 'Rodenstock';
    'Multilens'; 'Multilens'; 'Multilens';'Multilens'; 'Multilens';
    'Multilens';'Multilens'; 'Multilens'; 'Multilens';'Multilens';
    'Multilens'; 'Multilens';'Multilens';'Multilens';'Multilens';
    'Multilens'; 'Essilor'; 'Essilor';'Eschenbach';'Eschenbach';
    'Eschenbach'; 'Eschenbach'; 'Eschenbachv'; 'Eschenbach'; 'Eschenbach';
    'Eschenbach'; 'Corning'; 'Corning'; 'Corning';'3M';
    'Brain Power Inc.,';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';
    'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';
    'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'NoIR';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'LowBlueLights';
    'Yamamoto Kogaku Co. Ltd';'SAF-T-CURE';'Ultravision International';'Brain Power Inc.';'Hoggan et al 2015';
    'Hoggan et al 2015';'Offenhäuser + Berger GmbH';'Eschenbach';'JINS CO., LTD';'JINS CO., LTD';
    'Multilens';'NoIR';'NoIR';'NoIR';'NoIR';
    'NoIR';'NoIR';'NoIR';'NoIR';'NoIR';
    'NoIR';'NoIR';'NoIR';'Offenhäuser + Berger GmbH';'Offenhäuser + Berger GmbH';
    'Offenhäuser + Berger GmbH';'Offenhäuser + Berger GmbH';'Honeywell Uvex';'Rosenblum et al 2000';'Rosenblum et al 2000';
    'Rosenblum et al 2000';'Eschenbach';'Chron-Optic inc.';'Honeywell Uvex';'Chron-Optic inc.';
    'SomniLight';'SomniLight';'SwissLens';'SwissLens';'SwissLens';
    'SwissLens';'Chron-Optic inc';'ZELTZER X-CHROM';'ZELTZER X-CHROM';'solsecur / AugenLichtSchutz';
    'solsecur / AugenLichtSchutz';'solsecur / AugenLichtSchutz';'solsecur / AugenLichtSchutz' };

%Product Names of the filters

ProductName={'F580'; 'HydroFlexRP' ;'L660';'CPF550S';'F580';
    'F560';'F540';'F90';'F80'; 'F60';
    'Skylet Sport'; 'Skylet Road'; 'Skylet Fun';'L660 90%'; 'L660 80%';
    '550 POL'; '527 POL'; '511 POL';'550 Transitions unbelichtet'; '550 Transitions belichtet';
    '527 Transitions unbelichtet';'527 Transitions belichtet'; '511 Transitions unbelichtet'; '511 Transitions belichtet';'550';
    '527'; '511';'450POL';'450';'Transitions450 unbelichtet';
    '450 Transitions belichtet'; 'Orma RT 85%'; 'Orma RT 50%';'550POL';'527POL';
    '511 POL'; '550'; '527'; '511'; '450 POL';
    '450'; 'Corning 550'; 'Corning 527'; 'Corning 511';' 2846 red-orange';
    ' DiamondDye 5 40nm';' DiamondDye 550nm';' Driver Tint';' Euro-Brown';' Golf Tint';
    ' Golfer Advantage';' Golfer Blu';' Monochrome 600nm';' Skeet Tint';' Ski Tint';
    ' Sport Tint';' Tennis Tint';' Winter Sun';'N/A - amber lens';' 0C1';
    ' L41-A';' L41-B';' L41-C';' L400';' L450';
    ' L480-50';' L480-75';' L480-90';' L500-H';' L500';
    ' L511-H';' L511';' L527-H';' L527';' L540-50';
    ' L540-70';' L550';' L585';' LC1-H';'Blue Light Blocking Glasses-Sleep Glasses';
    'NO 360S UV Orange';'ORANGE UV FILTER GLASSES';'Soft contact lenses - orange';'FL-41 Tint';'N/A - 480nm notch filter';
    'N/A - 620nm notch filter';'Laserschutzbrille 2054110000002 yellow';'Wellness PROTECT wp15';'Screen Clear';'Screen Night';
    ' LLR Night Cover';' 47';' 50';' 60';' 68';
    ' 72';' 90';' 93';' 465';' 505';
    ' 533';' 553';' 570';'Laserschutzbrille 0000001012726 red';'Laserschutzbrille 0000001012731 orange';
    'Laserschutzbrille 0000003013447 red-orange';'Laserschutzbrille 2054110000002 yellow';'SCT Orange (Ultraspec 2000)';'N/A - filter albino patients';'N/A - filter aphakic patients';
    'N/A - filter initial cataract patients';'Solar Shield Ultra';'N/A - orange lens';'SCT Orange';'N/A - orange lens';
    ' Amber Sleep Glasses';'Migraine Relief Lenses';'SLF450';'SLF511';'SLF527';
    'SLF550';'N/A - orange lens';'N/A - final modified red contact lens';'N/A - modified red contact lens';'red';
    'yellow sx';'Typ31: P90'; 'red_xd'};

%Sources of the filter transmission curves
% Links to the web based sources via https://archive.org/web/ are in the
% 'filter_sources_InternetArchive .txt' file in github
% melanopsinSpectralSensitivity repository

SourceOfTransmission= {'Schwerdtfeger & Gräf 1994'; 'Schwerdtfeger & Gräf 1994' ;'Schwerdtfeger & Gräf 1994';'Schwerdtfeger & Gräf 1994';' Plum & Gerull 2008 - Kantenfilter und seitlicher Blendschutz – ein praktischer Ratgeber';
    'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';' Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008';'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'3M 2846 red-orange Technical Fact Sheet';
    'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';
    'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';
    'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'Burkhart & Phelps 2009';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'Esaki et al. 2016';
    'Esaki et al. 2017';'Figuero & Rea 2010';'Gimenez et al. 2014';'Herz & Yen 2005';'Hoggan et al. 2015';
    'Hoggan et al. 2015';'Kayumov et al. 2005';'Krueger, Bullmann, & Drechsler 2017';'Lin et al. 2016';'Lin et al. 2016';
    'Technical fact sheet Multilens Night Cover';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';
    'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';
    'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';
    'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'Ostrin, Abbott & Queener 2017 - supplementary material';'Rosenblum et al. 2000';'Rosenblum et al. 2000';
    'Rosenblum et al. 2000';'Sasseville, Paquet & Hébert 2006';'Sasseville et al. 2009';'Sasseville et al. 2009';'Sasseville & Hébert 2010';
    'https://www.somnilight.com/bipolar-glasses-and-bipolar-insomnia.html';'https://www.somnilight.com/photophobia-glasses-and-migraine-glasses.html';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';
    'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'Van der Lely et al. 2015 - supplementary material';'Zeltzer 1979';'Zeltzer 1979';'Zerbini, Kantermann, & Merrow 2018';
    'https://www.augenlichtschutz.de/produkte/sport-freizeit/eye-shield-soft-yellow-sx-gelbfilter-brille';'https://www.augenlichtschutz.de/produkte/sport-freizeit/over-shield-n-sp90-blau';'https://www.augenlichtschutz.de/produkte/augenerkrankungen/over-shield-l-red-xd-breitsicht-schutzbrille'};


% to do: add filter_taxonomy2 to the table and save as csv

%table1= table(Manufacturer,ProductName,SourceOfTransmission, filter_taxonomy1_label(filter_taxonomy1));

%writetable('Filter Table 1.csv');
%type 'Filter Table 1.csv'

%%%% 
%% NOTES
%% For Esaki (2017), removed wls >700





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
    
    T= interp1(rawdat_ii(:,1),rawdat_ii(:,2),nm,'pchip',NaN);
    
    %change unit from percent to decimal
    T= (T ./ 100)';
    
    %trans_alleKurven --> Matrix mit allen Filtern: 401*N
    %label der Filter -->  trans_alleKurven Spalte 1 = theFiles{1} = ZeissClarletF580.csv
    %Spalte 2 --> theFiles{2} = WoehlkHydroFlexRP.csv...
    
    trans_bbFilters(:, ii) = T;
    
end

wls_bbFilters = nm';
src_bbFilters = theFiles;

save('trans_bbFilters.mat','trans_bbFilters', 'wls_bbFilters', 'src_bbFilters',...
    'type_bbFilters', 'type_label');
