
function beta = quantile_regression(y,x,k)

    [n,m] = size(x);
    m = m + 1;

    x = [ones(n,1) x];
    x_star = x;

    beta = ones(m,1);

    diff = 1;
    iter = 0;

    while ((diff > 1e-6) && (iter < 1000))
        x_star_t = x_star.';
        beta_0 = beta;

        beta = ((x_star_t * x) \ x_star_t) * y;

        residuals = y - (x * beta);
        residuals(abs(residuals) < 0.000001) = 0.000001;
        residuals(residuals < 0) = k * residuals(residuals < 0);
        residuals(residuals > 0) = (1 - k) * residuals(residuals > 0);
        residuals = abs(residuals);

        z = zeros(n,m);

        for i = 1:m 
            z(:,i) = x(:,i) ./ residuals;
        end

        x_star = z;
        beta_1 = beta;
        
        diff = max(abs(beta_1 - beta_0));
        iter = iter + 1;
    end

end