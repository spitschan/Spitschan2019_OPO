function [Manufacturer, ProductName, Source] = GetMetaDataFilters;

%Manufacturers of the filter
Manufacturer = {'Zeiss'; 'Woehlk';'Rodenstock';'Corning';'Zeiss';
    'Zeiss';'Zeiss';'Zeiss';'Zeiss'; 'Zeiss';
    'Zeiss'; 'Zeiss'; 'Zeiss';'Rodenstock'; 'Rodenstock';
    'Multilens'; 'Multilens'; 'Multilens';'Swiss Lens'; 'Zeiss';
    'Multilens';
    'Multilens'; 'Multilens';'Multilens';'Multilens'
    'Essilor'; 'Essilor';'Eschenbach';'Eschenbach';
    'Eschenbach'; 'Eschenbach'; 'Eschenbach'; 'Eschenbach'; 'Eschenbach';
    'Eschenbach'; 'Corning'; 'Corning'; 'Corning';'3M';
    'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';
    'Essilor';'Hoya';'Brain Power Inc.';'Swiss Lens';'Brain Power Inc.';
    'Brain Power Inc.';'Brain Power Inc.';'Brain Power Inc.';'NoIR';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';
    'DAO-AG';'DAO-AG';'DAO-AG';'DAO-AG';'LowBlueLights';
    'Yamamoto Kogaku Co. Ltd';'SAF-T-CURE';'Ultravision International';'Brain Power Inc.';'Hoggan et al 2015';
    'Offenhäuser + Berger GmbH';'Eschenbach';'JINS CO. LTD';'JINS CO. LTD';
    'Multilens';'NoIR';'NoIR';'NoIR';'NoIR';
    'NoIR';'NoIR';'NoIR';'NoIR';'NoIR';
    'NoIR';'NoIR';'NoIR';'Offenhäuser + Berger GmbH';'Offenhäuser + Berger GmbH';
    'Offenhäuser + Berger GmbH';'Offenhäuser + Berger GmbH';'Honeywell Uvex';'Rosenblum et al 2000';'Rosenblum et al 2000';
    'Rosenblum et al 2000';'Eschenbach';'Chron-Optic inc.';'Honeywell Uvex';'Chron-Optic inc.';
    'SomniLight';'SomniLight';'SwissLens';'SwissLens';'SwissLens';
    'SwissLens';'Chron-Optic inc';'ZELTZER X-CHROM';'ZELTZER X-CHROM';'solsecur / AugenLichtSchutz';
    'solsecur / AugenLichtSchutz';'solsecur / AugenLichtSchutz';'solsecur / AugenLichtSchutz'};

%Product Names of the filters

ProductName={'F580'; 'HydroFlexRP';'L660';'CPF550S';'F580';
    'F560';'F540';'F90';'F80'; 'F60';
    'Skylet Sport'; 'Skylet Road'; 'Skylet Fun';'L660 90%'; 'L660 80%';
    '550 POL'; '527 POL'; '511 POL';'StressFree'; 'BlueProtect';
    '550';
    '527'; '511';'450POL';'450';
    'Orma RT 85%'; 'Orma RT 50%';'550POL';'527POL';
    '511 POL'; '550'; '527'; '511'; '450 POL';
    '450'; 'Corning 550'; 'Corning 527'; 'Corning 511';'2846 red-orange';
    'DiamondDye 5 40nm';'DiamondDye 550nm';'Driver Tint';'Euro-Brown';'Golf Tint';
    'Crizal Prevencia';'BlueControl';'Monochrome 600nm';'Noflex';'Ski Tint';
    'Sport Tint';'Tennis Tint';'Winter Sun';'N/A - amber lens';'0C1';
    'L41-A';'L41-B';'L41-C';'L400';'L450';
    'L480-50';'L480-75';'L480-90';'L500-H';'L500';
    'L511-H';'L511';'L527-H';'L527';'L540-50';
    'L540-70';'L550';'L585';'LC1-H';'Blue Light Blocking Glasses-Sleep Glasses';
    'O 360S UV Orange';'ORANGE UV FILTER GLASSES';'Soft contact lenses - orange';'FL-41 Tint';'N/A - 480nm notch filter';
    'Laserschutzbrille 2054110000002 yellow';'Wellness PROTECT wp15';'Screen Clear';'Screen Night';
    'LLR Night Cover';'47';'50';'60';'68';
    '72';'90';'93';'465';'505';
    '533';'553';'570';'Laserschutzbrille 0000001012726 red';'Laserschutzbrille 0000001012731 orange';
    'Laserschutzbrille 0000003013447 red-orange';'Laserschutzbrille 2054110000002 yellow';'SCT Orange (Ultraspec 2000)';'N/A - filter albino patients';'N/A - filter aphakic patients';
    'N/A - filter initial cataract patients';'Solar Shield Ultra';'N/A - orange lens';'SCT Orange';'N/A - orange lens';
    'Amber Sleep Glasses';'Migraine Relief Lenses';'SLF450';'SLF511';'SLF527';
    'SLF550';'N/A - orange lens';'N/A - final modified red contact lens';'N/A - modified red contact lens';'red';
    'yellow sx';'Typ31: P90'; 'red xd'};

%Sources of the filter transmission curves
% Links to the web based sources via https://archive.org/web/ are in the
% 'filter_sources_InternetArchive .txt'file in github
% melanopsinSpectralSensitivity repository

Source= {'Schwerdtfeger & Gräf 1994'; 'Schwerdtfeger & Gräf 1994';'Schwerdtfeger & Gräf 1994';'Schwerdtfeger & Gräf 1994';'Plum & Gerull 2008 - Kantenfilter und seitlicher Blendschutz – ein praktischer Ratgeber';
    'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Leung et al 2017'; 'Leung et al 2017';
    'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008';'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';
    'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008'; 'Plum & Gerull 2008';'3M 2846 red-orange Technical Fact Sheet';
    'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';
    'Leung et al 2017';'Leung et al 2017';'BPI Therapeuthic Tint brochure 2006';'Leung et al 2017';'BPI Therapeuthic Tint brochure 2006';
    'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'BPI Therapeuthic Tint brochure 2006';'Burkhart & Phelps 2009';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';
    'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'https://www.dao-ag.de/kantenfilter.html';'Esaki et al. 2016';
    'Esaki et al. 2017';'Figuero & Rea 2010';'Gimenez et al. 2014';'Herz & Yen 2005';'Hoggan et al. 2015';
    'Kayumov et al. 2005';'Krueger Bullmann & Drechsler 2017';'Lin et al. 2016';'Lin et al. 2016';
    'Technical fact sheet Multilens Night Cover';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';
    'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';
    'http://noirmedical.com/';'http://noirmedical.com/';'http://noirmedical.com/';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';
    'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'https://www.offenhaeuser-berger.de/laserschutzbrillen.php';'Ostrin Abbott & Queener 2017 - supplementary material';'Rosenblum et al. 2000';'Rosenblum et al. 2000';
    'Rosenblum et al. 2000';'Sasseville Paquet & Hébert 2006';'Sasseville et al. 2009';'Sasseville et al. 2009';'Sasseville & Hébert 2010';
    'https://www.somnilight.com/bipolar-glasses-and-bipolar-insomnia.html';'https://www.somnilight.com/photophobia-glasses-and-migraine-glasses.html';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';
    'https://www.swisslens.ch/de/produkte/formstabile-kontaktlinsen/gp-therapy/';'Van der Lely et al. 2015 - supplementary material';'Zeltzer 1979';'Zeltzer 1979';'Zerbini Kantermann & Merrow 2018';
    'https://www.augenlichtschutz.de/produkte/sport-freizeit/eye-shield-soft-yellow-sx-gelbfilter-brille';'https://www.augenlichtschutz.de/produkte/sport-freizeit/over-shield-n-sp90-blau';'https://www.augenlichtschutz.de/produkte/augenerkrankungen/over-shield-l-red-xd-breitsicht-schutzbrille'};
