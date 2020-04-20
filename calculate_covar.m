function [covar,dcovar] = calculate_covar(a,r0_m,r0_x,var)


        beta = quantile_regression(r0_m,r0_x,a);
        covar = beta(1) + (beta(2) .* var);

	dcovar = beta(2) .* (var - repmat(median(r0_x),length(r0_m),1));

end