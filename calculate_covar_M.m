% state_variables 的输入应该是一个矩阵，每一列代表一个变量。
function [covar,dcovar] = calculate_covar(a,r0_m,r0_x,var,state_variables)
      beta = quantile_regression(r0_m,[r0_x state_variables],a);
      covar = beta(1) + (beta(2) .* var);
      for i = 1:size(state_variables,2)
          covar = covar + (beta(i+2) .* state_variables(:,i));
      end
  dcovar = beta(2) .* (var - repmat(median(r0_x),length(r0_m),1));
end
