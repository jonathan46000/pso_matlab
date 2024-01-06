% clean workspace
% clear
close all
clc

pso_config;

% Convergence plot matrix
conv_plot_matrix = [];

% initialize the swarm
[M,V,Gb,Pb,F_Gb,F_Pb] = init_swarm(NO_OF_PARTICLES, ...
    lbound,ubound,v_init_limit,length(Ftargets));

% use particle distribution to prevent overshoot
InitDev = abs_mean_dev_of_particles(M);

% Avtive Particles
active = ones(1,NO_OF_PARTICLES);

% Last Particle Location
MLast = lbound;

% Iterations
iter = 0;

% Do plot
do_plot = 1;

% Particle Figure
figure();

% Evaluate each particle and fill Gb
while ((norm(F_Gb) > E_TOL) && (iter < I_MAX) && max(active))
    delta_t = abs_mean_dev_of_particles(M)/(T_MOD*InitDev);
    for i = 1:NO_OF_PARTICLES
        if active(i)
        
            [Flist, ~] = f_eval(M(:,i),Ftargets,objFunc);
            iter = iter + 1;
        
            if norm(Flist) < norm(F_Gb)
                F_Gb = Flist;
                Gb = M(:,i);
            end
        
            if norm(Flist) < norm(F_Pb(:,i))
                F_Pb(:,i) = Flist;
                Pb(:,i) = M(:,i);
            end
            
            conv_plot_temp = [iter; norm(F_Gb)];
            conv_plot_matrix = [conv_plot_matrix conv_plot_temp];
        
            V(:,i) = update_velocity(V(:,i),w_tensor,Pb(:,i),Gb,M(:,i));
            MLast = M(:,i);
            M(:,i) = M(:,i) + delta_t*V(:,i);
            [M(:,i), V(:,i), active] = handle_boundary(lbound,ubound,   ...
                                                       M(:,i),V(:,i),   ...
                                                       active,boundary, ...
                                                       MLast,i);
        end
    end
    if ~max(active)
        disp("ANTS HAVE LEFT THE FARM");
    end
    switch(length(M(:,1))) 
        case 3
            scatter3(M(1,:),M(2,:),M(3,:));
            xlim([0 1]);
            ylim([0 1]);
            zlim([0 1]);
            drawnow
        case 2
            scatter(M(1,:),M(2,:));
            xlim([0 1]);
            ylim([0 1]);
            drawnow
        otherwise
            if do_plot
                disp("Dimension can not be graphically represented");
                do_plot = 0;
            end
    end
end

[~,solution] = f_eval(Gb,Ftargets,objFunc);
disp("Iterations:");
disp(iter);
disp("X-Points:");
disp(Gb);
disp("Associated Output");
disp(solution);

conv_plot_matrix = conv_plot_matrix';
figure();
loglog(conv_plot_matrix(:,1),conv_plot_matrix(:,2)/max(conv_plot_matrix(:,2)),'k-','Linewidth',2);
grid on
xlabel("Iteration");
ylabel("Best Function Value");
