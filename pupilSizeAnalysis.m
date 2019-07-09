
%%
close all
clearvars
ageYrs = 32;

fieldDiameterDeg = 150;
eyeNumber = 2;
whichModel = 'Unified';

% Iterate over luminances
luminanceCdM2 = 10.^(-4:0.1:4);
NLuminances = size(luminanceCdM2, 2);
for ii = 1:NLuminances
    pupilDiameterMmPlot(ii) = wy_getPupilSize(ageYrs, luminanceCdM2(ii), fieldDiameterDeg, eyeNumber, whichModel)
end

subplot(2, 1, 1);
plot(log10(luminanceCdM2), pupilDiameterMmPlot, '-k', 'LineWidth', 2)
set(gca, 'XTick', [-4:4], 'XTickLabel', 10.^[-4:4]);
xlabel('Luminance [cd/m2]');
ylabel('Expected pupil diameter [mm]');
ylim([1.5 8.5]);
xlim([-4.5 4.5]);
pbaspect([1 1 1]);
box off; set(gca, 'TickDir', 'out');

%
subplot(2, 1, 2);
%
luminanceCdM2 = 10.^(-4:4);
NLuminances = size(luminanceCdM2, 2);
for ii = 1:NLuminances
    pupilDiameterMm(ii) = wy_getPupilSize(ageYrs, luminanceCdM2(ii), fieldDiameterDeg, eyeNumber, whichModel)
end


fixLuminances = 10.^(-4:0.1:4);
theNDStop = 10.^[-3:1:0];

for ii = 1:length(fixLuminances)
    for ij = 1:length(theNDStop)
        pupilDiameterMmFix = wy_getPupilSize(ageYrs, theNDStop(ij)*fixLuminances(ii), fieldDiameterDeg, eyeNumber, whichModel);
        retinalIlluminance(ii, ij) = (pupilDiameterMmFix/2)^2*pi*theNDStop(ij)*fixLuminances(ii);
    end
end

h0 = plot(log10(luminanceCdM2), log10((pupilDiameterMm/2).^2*pi.*luminanceCdM2), '-k', 'LineWidth', 2); hold on;

% Plot the individual curves
theColours = [127,201,127 ; ...
    190,174,212 ; ...
    253,192,134]/255;
for ii = 1:3
    h(ii) = plot(log10(fixLuminances), log10(retinalIlluminance(:, ii))', 'Color', theColours(ii, :), 'LineWidth', 2)
end

xlabel('Luminance [cd/m2]');
ylabel('Retinal illuminance (Td)');

plot(log10([10^-5 luminanceCdM2 10^5]), log10((1.5/2)^2*pi.*[10^-5 luminanceCdM2 10^5]), ':k'); hold on;
plot(log10([10^-5 luminanceCdM2 10^5]), log10((8/2)^2*pi*[10^-5 luminanceCdM2 10^5]), ':k'); hold on;
legend([h0 h(end:-1:1)], {'Natural', '10% (ND1.0)' '1% (ND2.0)' '0.1% (ND3.0)'}, 'Location', 'NorthWest');

set(gca, 'XTick', [-5:1:5], 'XTickLabel', 10.^[-5:1:5]);
set(gca, 'YTick', [-5:1:5], 'YTickLabel', 10.^[-5:1:5]);

xlim([-4.5 4.5]);
ylim([-4.5 4.5]+1);

pbaspect([1 1 1]);
box off; set(gca, 'TickDir', 'out');

set(gcf, 'PaperPosition', [0 0 12 20]);
set(gcf, 'PaperSize', [12 20]);
saveas(gcf, 'xProducts/Fig4.pdf', 'pdf');