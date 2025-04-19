function metrics = computeMetrics(F, A)

metrics = table();

metrics.MSE = mse(F, A);
metrics.MAE = mae(F, A);
metrics.RMSE = rmse(F, A);
metrics.MAPE = mape(F, A);
metrics.RRSE = sqrt(sum((F - A).^2) / sum((A - mean(A)).^2));

end
