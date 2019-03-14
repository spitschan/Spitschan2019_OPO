%{
editor: Rafael Lazar
tool used for data: webplotdigitizer https://apps.automeris.io/wpd/

functions of luminance and melanopsin via Manuel Spitschan on gitHub
https://github.com/spitschan

date created: 06.03.2019
date of last modification: 14.03.2019
specification: compute impact of different filter spectacles on melanopsin
and luminance
%}


%Transmissionskurve =T (401*1) Lichtfaktor =Spd Melanopsinsensitivität=M(401*1)
% kein Filter=(kF
%(M*(Spd .* T))/ (M*(Spd*kF)) = Skalar zwischen 0 & 1



%Import & create necessary data
CIES026=GetCIES026;
melanopsinfun=CIES026(5,:);
load('T_alleKurven.mat');
EEW=ones(401,1);
nm=380:1:780;
luminancefile=dlmread('lin2012xyz10e_1_7sf.csv');
% prune & pad luminance data so it fits the nm dimensions 380:1:780
lumifun=[zeros(1,10),(luminancefile(1:391,3)')];




NKurven = size(T_alleKurven,2);

for i = 1:NKurven
   
   %keinFilter Faktor 1, Transmission=100%
   keinFilter= ones(401,1);
   
   %create array for the current Filter, transpose it for Matrix multipl.
   Filter_i=T_alleKurven(:,i);
   
   % Ersetzen der Stellen in keinFilter mit 0, an denen im definierten Filter
   % (i-te Zeile aus T_alleKurven) NaN ist.
    keinFilter(isnan(Filter_i)) = 0;
 
 % Ersetzen der NaN durch 0 im aktuellen Filter (Filter_i)
 Filter_i(isnan(Filter_i)) = 0;
 
  
 %Compute activation of EEW and the current Filter on Melanopsin
 
  melanacti_Filter_i = melanopsinfun * (EEW .* Filter_i);
  
 %Compute impact of light and no Filter on Melanopsin
  melanacti_keinFilter = melanopsinfun *(EEW .* keinFilter);
  
  %compute the relative impact of light trough current Filter compared to no Filter
  melanopsin_impact= melanacti_Filter_i ./ melanacti_keinFilter;
  
  alle_melanopsin_impact(i,:)=melanopsin_impact;
  
  
  
  %compute luminance with Filter
  
  luminance_Filter_i = lumifun * (EEW .* Filter_i);
  
 %Compute luminance with no Filter 
  luminance_keinFilter = lumifun *(EEW .* keinFilter);
  
  %compute the relative luminace through current Filter compared to no Filter
  luminance_impact= luminance_Filter_i ./ luminance_keinFilter;
  
  alle_luminance_throughfilter(i,:)=luminance_impact;
    
end


 %plotten aller Filter luminance impact vs. melanopsin impact
plot (alle_melanopsin_impact(filter_taxonomy1==1) ,alle_luminance_throughfilter(filter_taxonomy1==1) ,'or');
title('filter luminance and melanopsin impact') %Add a title
axis('equal');
set(gca,'xlim',[0,1],'XScale', 'log', 'ylim',[0,1], 'YScale', 'log');% set the x-axis values
xlabel('relative impact of EEW through filter on melanopsin vs no filter'); %Label for the x-axis
ylabel('luminance of EEW through filter in relation to no filter'); %Label for the y-axis
hold on; 
plot (alle_melanopsin_impact((filter_taxonomy1==2)) ,alle_luminance_throughfilter(filter_taxonomy1==2) ,'xk');
plot (alle_melanopsin_impact((filter_taxonomy1==3)) ,alle_luminance_throughfilter(filter_taxonomy1==3) ,'+b');
plot (alle_melanopsin_impact((filter_taxonomy1==4)) ,alle_luminance_throughfilter(filter_taxonomy1==4) ,'^m');
plot (alle_melanopsin_impact((filter_taxonomy1==5)) ,alle_luminance_throughfilter(filter_taxonomy1==5) ,'dk');
plot (alle_melanopsin_impact((filter_taxonomy1==6)) ,alle_luminance_throughfilter(filter_taxonomy1==6) ,'pg');
