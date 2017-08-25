% Plotting learning curves with randomly selected examples

m = size(X_poly, 1);

error_train = zeros(m, 1);
error_val = zeros(m, 1);

lambda = 0.01;
for i = 1:m
    temp_error_train = 0;
    temp_error_val = 0;
    for n = 1:50
        rows = randperm(m, i);
        X_sample = X_poly(rows, :);
        y_sample = y(rows, :);
        theta = trainLinearReg(X_sample, y_sample, lambda);
        temp_error_train = temp_error_train + linearRegCostFunction(X_sample, y_sample, theta, 0);
        temp_error_val = temp_error_val + linearRegCostFunction(X_poly_val, yval, theta, 0);
    end
    error_train(i) = temp_error_train/50;
    error_val(i) = temp_error_val/50;
end
plot(1:m, error_train, 1:m, error_val);