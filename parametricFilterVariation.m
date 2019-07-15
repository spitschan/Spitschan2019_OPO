%
close all
clear all;



%%
% Iterate over filter types
NFilters = 3;

% Make some filters
wls = (380:1:780)';

for filtIdx = 1:3
    clearvars trans_simFilters
    clearvars trans_simFiltersFine
    switch filtIdx
        case 1
            % Change wavelength
            wl0 = 460:20:600; % Sigmoid point
            wl0_fine = 400:650;
            L = 0.9;    % Maximum value
            k = 0.5; % Logistic growth rate
            a = 0;
            
            for ii = 1:length(wl0)
                trans_simFilters(:, ii) = L ./ (1+exp(-k*(wls-wl0(ii))));
            end
            for ii = 1:length(wl0_fine)
                trans_simFiltersFine(:, ii) = L ./ (1+exp(-k*(wls-wl0_fine(ii))));
            end
        case 2
            % Change wavelength
            wl0 = 550; % Sigmoid point
            L = 0.1:0.1:1;    % Maximum value
            L_fine = 0.1:0.001:1;    % Maximum value
            k = 1; % Logistic growth rate
            a = 0;
            
            for ii = 1:length(L)
                trans_simFilters(:, ii) = L(ii) ./ (1+exp(-k*(wls-wl0)));
            end
            for ii = 1:length(L_fine)
                trans_simFiltersFine(:, ii) = L_fine(ii) ./ (1+exp(-k*(wls-wl0)));
            end
        case 3
            % Change wavelength
            wl0 = 550; % Sigmoid point
            L = .9;    % Maximum value
            k = [0.02 0.05 0.1 0.5 1]; % Logistic growth rate
            k_fine = [0.02:0.01:1];
            a = 0;
            
            for ii = 1:length(k)
                trans_simFilters(:, ii) = L ./ (1+exp(-k(ii)*(wls-wl0)));
            end
            for ii = 1:length(k_fine)
                trans_simFiltersFine(:, ii) = L ./ (1+exp(-k_fine(ii)*(wls-wl0)));
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
    
    % Make EEW
    spd = ones(size(wls));
    
    % Calculate the ratio
    XYZ = (T_xyz*(spd .* trans_simFilters));
    uvY = XYZTouvY(XYZ);
    uv = uvY(1:2, :);
    
    XYZ = (T_xyz*(spd .* trans_simFiltersFine));
    uvY = XYZTouvY(XYZ);
    uvFine = uvY(1:2, :);
    
    XYZ0 = (T_xyz*(spd));
    uvY0 = XYZTouvY(XYZ0);
    uv0 = uvY0(1:2, :);
    
    chromDiff = sqrt(sum((uv0-uv).^2));
    chromDiffFine = sqrt(sum((uv0-uvFine).^2));
    
    xyzRatio = (T_xyz*(spd .* trans_simFilters)) ./ (T_xyz*spd);
    melRatio = (T_mel*(spd .* trans_simFilters)) ./ (T_mel*spd);
        xyzRatioFine = (T_xyz*(spd .* trans_simFiltersFine)) ./ (T_xyz*spd);
    melRatioFine = (T_mel*(spd .* trans_simFiltersFine)) ./ (T_mel*spd);
    
    
    % Generate spectral locus for uv
    theWls = [700 400:700];
    for ii = 1:length(theWls)
        spd = zeros(size(wls));
        spd(theWls(ii) == wls) = 1;
        
        % Get ref
        XYZref = (T_xyz*(spd));
        uvYref = XYZTouvY(XYZref);
        uvref(:, ii) = uvYref(1:2, :);
    end
    
    %% Calculate colour gamut of reflectances
    reflectances = xlsread('99Reflectances.xlsx');
    srf_cie = SplineSpd([380 5 81], reflectances, wls);
    
    XYZsrf = (T_xyz*(srf_cie));
    uvYsrf = XYZTouvY(XYZsrf);
    uvsrf = uvYsrf(1:2, :);
    [idx_cvhull, area_cvhull] = convhull(uvsrf(1, :), uvsrf(2, :));
    
    
    % Plot per filter type
    NFilters = 3;
    
    % Spectra
    subplot(4, NFilters, filtIdx);
    plot(wls, 100*trans_simFilters, '-k', 'LineWidth', 0.2);
    xlim([380 780]);
    ylim([0 100]);
    xlabel('Wavelength [nm]');
    ylabel('Transmittance [%]');
    pbaspect([1 1 1]);
    set(gca, 'XTick', [400:50:800]);
    box off; set(gca, 'TickDir', 'out');
    
    
    % Lum vs. mel
    subplot(4, NFilters, 3+filtIdx);
    plot([-2 0.1], [-2 0.1], ':k'); hold on
    
    plot(log10(xyzRatio(2, :)), log10(melRatio), 'sk', 'MarkerFaceColor', 'w');
    plot(log10(xyzRatioFine(2, :)), log10(melRatioFine), '-r');

    xlim([-2 0.1]); ylim([-4 0.1]);
    pbaspect([1 1 1]);
    box off; set(gca, 'TickDir', 'out');
    
    set(gca, 'XTick', [-2:0], 'XTickLabel', 100*10.^[-2:0]);
    set(gca, 'YTick', [-4:0], 'YTickLabel', 100*10.^[-4:0])
    if filtIdx == 1
        ylabel('Melanopsin transmittance [%]');
    end
    xlabel('Luminous transmittance [%]');
    
    % Plot chromaticity diagram
    subplot(4, NFilters, 6+filtIdx);
    plot(uvref(1, :), uvref(2, :), ':k'); hold on;
    plot(uv(1, :), uv(2, :), 'sk', 'MarkerFaceColor', 'w');
    plot(uvFine(1, :), uvFine(2, :), '-r');
    plot(uv0(1), uv0(2), '+r');
    pbaspect([1 1 1]);
    xlim([0 0.61]); ylim([0 0.61]);
    set(gca, 'XTick', 0:0.2:0.6);
    set(gca, 'YTick', 0:0.2:0.7);
    box off; set(gca, 'TickDir', 'out');
    xlabel('CIE u'); ylabel('CIE v');
    
    % chromaticity
    %%
    clearvars area_cvhull_filt;
    clearvars area_cvhull_filtFine;
    for ij = 1:size(trans_simFilters, 2)
        XYZsrf_filt = (T_xyz*(srf_cie .* trans_simFilters(:, ij)));
        uvYsrf_filt = XYZTouvY(XYZsrf_filt);
        uvsrf_filt = uvYsrf_filt(1:2, :);
        [idx_cvhull_filt, area_cvhull_filt(ij)] = convhull(uvsrf_filt(1, :), uvsrf_filt(2, :));
    end
    
    for ij = 1:size(trans_simFiltersFine, 2)
        XYZsrf_filt = (T_xyz*(srf_cie .* trans_simFiltersFine(:, ij)));
        uvYsrf_filt = XYZTouvY(XYZsrf_filt);
        uvsrf_filt = uvYsrf_filt(1:2, :);
        [idx_cvhull_filt, area_cvhull_filtFine(ij)] = convhull(uvsrf_filt(1, :), uvsrf_filt(2, :));
    end
    
    
    subplot(4, NFilters, 9+filtIdx);
    hold on;
    plot(chromDiff, log10(area_cvhull_filt./area_cvhull), 'sk', 'LineWidth', 0.2, 'MarkerFaceColor', 'w');
    plot(chromDiffFine, log10(area_cvhull_filtFine./area_cvhull), '-r');
    xlim([0 0.4]); ylim([-4 0.1]);
    pbaspect([1 1 1]);
    
    set(gca, 'YTick', [-4:0], 'YTickLabel', 100*10.^[-4:0]);
    set(gca, 'XTick', [0:0.1:0.4])
    if filtIdx == 1
        ylabel('Gamut reduction [%]');
    end
    xlabel('Difference \Deltauv');
    box off; set(gca, 'TickDir', 'out');
    
    
    M = [100*xyzRatio(2, :)' 100*melRatio' chromDiff' 100*area_cvhull_filt'./area_cvhull']
end

set(gcf, 'PaperPosition', [0 0 23 23]);
set(gcf, 'PaperSize', [23 23]);
saveas(gcf, 'xProducts/Fig2.pdf', 'pdf');
