% clean workspace
clear
close all
clc

% number of particles in algorithm
NO_OF_PARTICLES = 50;

% upper and lower bounds for m
lbound = [0;0;0];
ubound = [1;1;1];

% velocity limit for initialization
v_init_limit = 0.3;

% These are the weights for the equation: 
% V_n+1 = w_1*V_n + w_2*rand()*(Pb-m)+w_3*rand()*(Gb-m)
w_tensor = [0.7;1.5;0.5]; 

% detla_t divisor
T_MOD = 3;

% name of objective function used
objFunc = 'func_F';

% Target Outputs
Ftargets = [0;0];

% Error Tolerance
E_TOL = 1e-6;

% Max Iterations
I_MAX = 1e4;

% initialize the swarm
[M,V,Gb,Pb,F_Gb,F_Pb] = init_swarm(NO_OF_PARTICLES, ...
    lbound,ubound,v_init_limit,length(Ftargets));

% Iterations
iter = 0;

% Particle Figure
figure();

% Evaluate each particle and fill Gb
while ((norm(F_Gb) > E_TOL) && (iter < I_MAX))
    delta_t = norm(M)/T_MOD;
    for i = 1:NO_OF_PARTICLES
        
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
        
        V(:,i) = update_velocity(V(:,i),w_tensor,Pb(:,i),Gb,M(:,i));
        M(:,i) = M(:,i) + delta_t*V(:,i);
        M(:,i) = cull_and_spawn(lbound,ubound,M(:,i));
    end
    scatter3(M(1,:),M(2,:),M(3,:));
    xlim([0 1]);
    ylim([0 1]);
    zlim([0 1]);
    drawnow
end

[~,solution] = f_eval(Gb,Ftargets,objFunc);
disp("Solution:");
disp(Gb);
disp(solution);

figure();
plot(M,"Linewidth",2);
xlabel("Point (1,2 or 3)");
ylabel("Value (Exact = 0.5, 0.1 & 0.2)");
grid on
