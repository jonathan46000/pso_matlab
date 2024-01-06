function [m_new, v_new] = absorb(lbound,ubound,m,v,mlast)
    m_new = m;
    v_new = v;
    
    [update, vec] = check_bounds(lbound,ubound,m);
    
    if update
        v_new(vec) = 0;
        m_new = mlast;
    end
end