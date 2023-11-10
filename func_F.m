function [F] = func_F(x)
NO_OF_OUTS = 2;
F = zeros(NO_OF_OUTS,1);
F(1) = (x(1)-0.5)^2+(x(2)-0.1)^2;
F(2) = (x(3)-0.2)^4;