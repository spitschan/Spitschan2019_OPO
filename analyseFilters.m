%
clear all;
close all

load('trans_bbFilters.mat')

%%
% Iterate over filter types
NFilters = 3;

% Lump all "rec" filters together
type_bbFilters0 = type_bbFilters;
type_bbFilters(type_bbFilters >= 3) = 3;

% Replace all NaN with 0
trans_bbFilters0 = trans_bbFilters;
trans_bbFilters(isnan(trans_bbFilters)) = 0;
trans_bbFiltersNoFilter = trans_bbFilters;
trans_bbFiltersNoFilter(trans_bbFiltersNoFilter > 0) = 1;

% Get the filter info
[Manufacturer, ProductName, Source] = GetMetaDataFilters;


%% Iterate over the
QUALITY_CONTROL = false;
if QUALITY_CONTROL
    for ii = 1:length(trans_bbFilters0)
        plot(wls_bbFilters, trans_bbFilters(:, ii)); hold on
        xlim([380 780]);
        title(num2str(ii));
        pause
        box off;
    end
end

%% Calculate
% Get melanopsin
T_receptors = GetCIES026;
T_mel = T_receptors(5, :);

% Get XYZ
tmp = csvread('ciexyz64_1.csv');
T_xyz = 683*[tmp(find(tmp(:, 1) == 380):find(tmp(:, 1) == 780), 2:4)];
T_xyz = T_xyz';

% Make D65
spd = SplineSpd(tmp.S_D65, tmp.spd_D65, wls);

% Calculate the ratio
XYZ = (T_xyz*(spd .* trans_bbFilters));
uvY = XYZTouvY(XYZ);
uv = uvY(1:2, :);

XYZ0 = (T_xyz*(spd));
uvY0 = XYZTouvY(XYZ0);
uv0 = uvY0(1:2, :);

chromDiff = sqrt(sum((uv0-uv).^2));

xyzRatio = (T_xyz*(spd .* trans_bbFilters)) ./ (T_xyz*(spd));
melRatio = (T_mel*(spd .* trans_bbFilters)) ./ (T_mel*(spd));
plot(xyzRatio(2, :), melRatio);

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

%% Calculate colour gamut of reflectances
reflectances = xlsread('99Reflectances.xlsx');
srf_cie = SplineSpd([380 5 81], reflectances, wls_bbFilters);

XYZsrf = (T_xyz*(srf_cie));
uvYsrf = XYZTouvY(XYZsrf);
uvsrf = uvYsrf(1:2, :);
[idx_cvhull, area_cvhull] = convhull(uvsrf(1, :), uvsrf(2, :));

fid = fopen('Table1.csv', 'w');
fprintf(fid, '');
fclose(fid);

% Plot per filter type
for ii = 1:NFilters
    
    idx = find(type_bbFilters == ii);
    length(idx)
    % Spectra
    subplot(4, NFilters, ii);
    plot(wls_bbFilters, 100*trans_bbFilters0(:, idx), '-k', 'LineWidth', 0.2);
    xlim([380 780]);
    ylim([0 100]);
    xlabel('Wavelength [nm]');
    ylabel('Transmittance [%]');
    pbaspect([1 1 1]);
    set(gca, 'XTick', [400:50:800]);
    box off; set(gca, 'TickDir', 'out');
    
    
    % Lum vs. mel
    subplot(4, NFilters, 3+ii);
    plot([-4 0.1], [-4 0.1], ':k'); hold on
    
    plot(log10(xyzRatio(2, idx)), log10(melRatio(idx)), 'sk', 'LineWidth', 0.2, 'MarkerFaceColor', 'w');
    xlim([-4 0.1]); ylim([-4 0.1]);
    pbaspect([1 1 1]);
    box off; set(gca, 'TickDir', 'out');
    
    set(gca, 'XTick', [-4:0], 'XTickLabel', 100*10.^[-4:0]);
    set(gca, 'YTick', [-4:0], 'YTickLabel', 100*10.^[-4:0])
    if ii == 1
        ylabel('Melanopsin transmittance [%]');
    end
    xlabel('Luminous transmittance [%]');
    
    % Plot chromaticity diagram
    subplot(4, NFilters, 6+ii);
    plot(uvref(1, :), uvref(2, :), ':k'); hold on;
    plot(uv(1, idx), uv(2, idx), 'sk', 'MarkerFaceColor', 'w');
    plot(uv0(1), uv0(2), '+r');
    pbaspect([1 1 1]);
    xlim([0 0.61]); ylim([0 0.61]);
    set(gca, 'XTick', 0:0.2:0.6);
    set(gca, 'YTick', 0:0.2:0.7);
    box off; set(gca, 'TickDir', 'out');
    xlabel('CIE u'); ylabel('CIE v');
    
    % color diff
    clearvars area_cvhull_filt;
    for ij = 1:length(idx)
        XYZsrf_filt = (T_xyz*(srf_cie .* trans_bbFilters(:, idx(ij))));
        uvYsrf_filt = XYZTouvY(XYZsrf_filt);
        uvsrf_filt = uvYsrf_filt(1:2, :);
        [idx_cvhull_filt, area_cvhull_filt(ij)] = convhull(uvsrf_filt(1, :), uvsrf_filt(2, :));
    end
    
    subplot(4, NFilters, 9+ii);
    plot(chromDiff(idx), log10(area_cvhull_filt'./area_cvhull'), 'sk', 'LineWidth', 0.2, 'MarkerFaceColor', 'w');
    xlim([0 0.4]); ylim([-4 0.1]);
    pbaspect([1 1 1]);
    
    set(gca, 'YTick', [-4:0], 'YTickLabel', 100*10.^[-4:0]);
    set(gca, 'XTick', [0:0.1:0.4])
    if ii == 1
        ylabel('Gamut factor [%]');
    end
    xlabel('Difference \Deltauv');
    box off; set(gca, 'TickDir', 'out');
    
    
    
    M = [100*xyzRatio(2, idx)' 100*melRatio(idx)' chromDiff(idx)' 100*area_cvhull_filt'./area_cvhull']
    
    % Save out the data in a table
    fid = fopen('Table1.csv', 'a');
    for im = 1:length(idx)
        fprintf(fid, '%s,%s,%s,%.1f,%.1f,%.2f,%.1f,%g\n', Manufacturer{idx(im)}, ProductName{idx(im)}, Source{idx(im)}, M(im, 1), M(im, 2), M(im, 3), M(im, 4), type_bbFilters0(idx(im)));
    end
    fclose(fid);
    
    Mall{ii} = M;
end

set(gcf, 'PaperPosition', [0 0 23 23]);
set(gcf, 'PaperSize', [23 23]);
saveas(gcf, 'xProducts/Fig4.pdf', 'pdf');
