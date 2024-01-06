function abs_mean_dev_M = abs_mean_dev_of_particles(M)
    mean_data = mean(M')';
    abs_data = abs(M-mean_data);
    abs_mean_dev_M = norm(mean(abs_data')');
    