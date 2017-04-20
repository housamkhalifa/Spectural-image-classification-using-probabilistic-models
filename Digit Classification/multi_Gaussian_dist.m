function prob = multi_Gaussian_dist(x_cov,x_test,m_train,glas)
[n,d] = size(x_cov); 

detCov = sqrt(det(x_cov));
part1 = 1/(((2*pi)^(d/2))*sqrt(detCov));
exp_part1 = -0.5*(x_test-m_train)';
exp_part2 = glas*(x_test-m_train);
prob = part1*(exp(exp_part1*exp_part2));
end
