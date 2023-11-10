function [M,V,Gb,Pb,F_Gb,F_Pb] = init_swarm(NO_OF_PARTICLES,lbound,ubound,vlimit,output_size)

    [heightl,widthl] = size(lbound);
    [heightu,widthu] = size(ubound);
    
    if ((heightl > 1) && (widthl > 1)) ...
        || ((heightu > 1) && (widthu > 1)) ...
        || (heightu ~= heightl) ...
        || (widthl ~= widthu)
        disp("Error lbound and ubound must be 1-dimensional arrays  with the same length");
    else
        
        if heightl == 1
            lbound = lbound';
        end
        
        if heightu == 1
            ubound = ubound';
        end
        
        variation = ubound-lbound;
        
        M = [];
        V = [];
        
        for i = 1:NO_OF_PARTICLES
            M = [M, (rand(max([heightl widthl]),1).*variation + lbound)];
            V = [V, rand(max([heightl widthl]),1).*vlimit];
        end
        
        Gb = inf(max([heightl widthl]),1);
        F_Gb = inf(output_size,1);
        Pb = inf(size(M));
        F_Pb = inf(output_size,NO_OF_PARTICLES);
        
    end
end
    
    

