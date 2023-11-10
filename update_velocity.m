function v_n_plus_one = update_velocity(v_n,w,Pb,Gb,m)

    v_n_plus_one = w(1)*rand()*v_n + w(2)*rand()*(Pb-m)+w(3)*rand()*(Gb-m);
    
end