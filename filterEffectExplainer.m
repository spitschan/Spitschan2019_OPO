% Explainer
close all; clearvars
load('trans_bbFilters.mat')

wls = (380:780)';

filtIdx = 5;

% Load D_65
load spd_D65.mat
spd_D65 = SplineSpd(S_D65, spd_D65, wls);
spd_D65 = spd_D65./max(spd_D65);
spd_D65_filt = spd_D65.*trans_bbFilters(:, filtIdx);

% V(lambda) attenuation
subplot(1, 4, 1);
tmp = csvread('ciexyz64_1.csv');
T_xyz = 683*[tmp(find(tmp(:, 1) == 380):find(tmp(:, 1) == 780), 2:4)];
T_xyz = T_xyz';

T_V = T_xyz(2, :);
T_V = T_V/max(T_V);
T_a1 = T_V.*spd_D65';
plot(wls, spd_D65); hold on
area(wls, T_a1)
xlim([380 780]);

T_a2 = T_V.*spd_D65_filt';
plot(wls, spd_D65_filt); hold on
area(wls, T_a2)
xlim([380 780]);
ylim([0 1.01]);
set(gca, 'XTick', [400:50:800]);
title(num2str(nansum(T_a2)/nansum(T_a1)))

plot(wls, trans_bbFilters(:, filtIdx));

pbaspect([1 1 1]);
set(gca, 'TickDir', 'out');
xlabel('Wavelength [nm]');
box off;

% Mel attenuation
subplot(1, 4, 2);
tmp = GetCIES026;
T_mel = tmp(5, :);

T_a1 = T_mel.*spd_D65';
plot(wls, spd_D65); hold on
area(wls, T_a1)
xlim([380 780]);

T_a2 = T_mel.*spd_D65_filt';
plot(wls, spd_D65_filt); hold on
area(wls, T_a2)
xlim([380 780]);
ylim([0 1.01]);
set(gca, 'XTick', [400:50:800]);
title(num2str(nansum(T_a2)/nansum(T_a1)))

plot(wls, trans_bbFilters(:, filtIdx));

pbaspect([1 1 1]);
set(gca, 'TickDir', 'out');
xlabel('Wavelength [nm]');
box off;

% Colour shift

% Make EEW
spd = ones(size(wls_bbFilters));

% Calculate the ratio
XYZ = (T_xyz*spd_D65_filt);
uvY = XYZTouvY(XYZ);
uv = uvY(1:2, :);

XYZ0 = (T_xyz*(spd));
uvY0 = XYZTouvY(XYZ0);
uv0 = uvY0(1:2, :);

chromDiff = sqrt(sum((uv0-uv).^2));

% Generate spectral locus for uv
theWls = [700 400:700];
for ii = 1:length(theWls)
    spd = zeros(size(wls_bbFilters));
    spd(theWls(ii) == wls_bbFilters) = 1;
    
    % Get ref
    XYZref = (T_xyz*(spd));
    uvYref = XYZTouvY(XYZref);
    uvref(:, ii) = uvYref(1:2, :);
end

% Plot chromaticity diagram
subplot(1, 4, 3);
plot(uvref(1, :), uvref(2, :), ':k'); hold on;
plot(uv(1), uv(2), 'sk', 'MarkerFaceColor', 'w');
plot(uv0(1), uv0(2), '+r');
pbaspect([1 1 1]);
xlim([0 0.61]); ylim([0 0.61]);
set(gca, 'XTick', 0:0.2:0.6);
set(gca, 'YTick', 0:0.2:0.7);
box off; set(gca, 'TickDir', 'out');
xlabel('CIE u'); ylabel('CIE v');



% Colour gamut
reflectances = xlsread('99Reflectances.xlsx');
srf_cie = SplineSpd([380 5 81], reflectances, wls_bbFilters);

subplot(1, 4, 4);
XYZsrf = (T_xyz*(srf_cie .* spd_D65));
uvYsrf = XYZTouvY(XYZsrf);
uvsrf = uvYsrf(1:2, :);
[idx_cvhull, area_cvhull] = convhull(uvsrf(1, :), uvsrf(2, :));


XYZsrf_filt = (T_xyz*(srf_cie .* spd_D65_filt));
uvYsrf_filt = XYZTouvY(XYZsrf_filt);
uvsrf_filt = uvYsrf_filt(1:2, :);
[idx_cvhull_filt, area_cvhull_filt] = convhull(uvsrf_filt(1, :), uvsrf_filt(2, :));

plot(uvref(1, :), uvref(2, :), ':k'); hold on;
plot(uvsrf(1, :), uvsrf(2, :), '.r'); hold on
plot(uvsrf(1, idx_cvhull), uvsrf(2, idx_cvhull), 'r'); hold on
plot(uvsrf_filt(1, :), uvsrf_filt(2, :), '.k');
plot(uvsrf_filt(1, idx_cvhull_filt), uvsrf_filt(2, idx_cvhull_filt), '-k');

pbaspect([1 1 1]);
xlim([0 0.61]); ylim([0 0.61]);
set(gca, 'XTick', 0:0.2:0.6);
set(gca, 'YTick', 0:0.2:0.7);
box off; set(gca, 'TickDir', 'out');
xlabel('CIE u'); ylabel('CIE v');

set(gcf, 'PaperPosition', [0 0 25 15]);
set(gcf, 'PaperSize', [25 15]);
saveas(gcf, 'xProducts/Fig4.pdf', 'pdf');