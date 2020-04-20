function [beta,var,es] = calculate_idiosyncratic(a,s_m,r0_x,s_x,rho)

	beta = rho .* (s_x ./ s_m);  %% ./    in matrix  every element operate as own 
    
    c = quantile((r0_x ./ s_x),a);
	var = s_x * c;
	es = s_x * -(normpdf(c) / a);

end