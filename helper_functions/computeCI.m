function [lower_ci, upper_ci] = computeCI(frcst,longTermMdl,seasonalMdl,idx,Z)

% Time = frcst.Time;
LongTerm = predint(longTermMdl,idx);
Seas = predint(seasonalMdl,idx);
SARIMA(:,1) = frcst.frcst - Z * sqrt(frcst.residuals);
SARIMA(:,2) = frcst.frcst + Z * sqrt(frcst.residuals);

VarianceLongTerm = ((LongTerm(:,2) - LongTerm(:,1)) / (2 * Z)) .^ 2;
VarianceSeas = ((Seas(:,2) - Seas(:,1))/ (2 * Z)) .^ 2;
VarianceSARIMA = ((SARIMA(:,2) - SARIMA(:,1)) / (2 * Z)) .^ 2;

% Sum the variances
VarianceTotal = VarianceLongTerm + VarianceSeas + VarianceSARIMA;

% Calculate the combined confidence intervals
LowerCICombined = frcst.sum - Z * sqrt(VarianceTotal);
UpperCICombined = frcst.sum + Z * sqrt(VarianceTotal);

% Reverse the logarithmic transformation
lower_ci = exp(LowerCICombined);
upper_ci = exp(UpperCICombined);

end