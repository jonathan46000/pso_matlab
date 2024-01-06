% bounds types
RANDOM = 1;
REFLEC = 2;
ABSORB = 3;
INVISB = 4;

boundary = RANDOM;

% number of particles in algorithm
NO_OF_PARTICLES = 50;

% upper and lower bounds for m
lbound = [0;0;0];
ubound = [1;1;1];

% velocity limit for initialization
v_init_limit = 0.8;

% These are the weights for the equation: 
% V_n+1 = w_1*V_n + w_2*rand()*(Pb-m)+w_3*rand()*(Gb-m)
w_tensor = [0.7;1.5;0.5]; 

% detla_t divisor
T_MOD = 0.28;

% name of objective function used
objFunc = 'func_F';

% Target Outputs
Ftargets = [0;0];

% Error Tolerance
E_TOL = 1e-6;

% Max Iterations
I_MAX = 2e3;