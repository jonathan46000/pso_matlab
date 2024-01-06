function [m_new, v_new] = reflect(lbound,ubound,m,v,mlast)
    m_new = m;
    v_new = v;
    
    [update, vec] = check_bounds(lbound,ubound,m);
    
    if update
        v_new(vec) = -1*v(vec);
        m_new = mlast;
    end
end