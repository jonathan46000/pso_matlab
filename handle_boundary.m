function [m_new, v_new, active_new] = handle_boundary(lbound,ubound,m,v, ...
                                                      active,boundary,   ...
                                                      mlast,particle)
    m_new = m;
    v_new = v;
    active_new = active;
    switch(boundary)
        case 1
            m_new = random_bounds(lbound,ubound,m);
        case 2
            [m_new, v_new] = reflect(lbound,ubound,m,v,mlast);
        case 3
            [m_new, v_new] = absorb(lbound,ubound,m,v,mlast);
        case 4
            active_new = invisible(lbound,ubound,m,active,particle);
        otherwise
            disp("Error: No boundary set!");
    end
end