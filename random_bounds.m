function m_new = random_bounds(lbound,ubound,m)

    m_new = m;
    [update,~] = check_bounds(lbound,ubound,m);
    
    if update
        variation = ubound-lbound;
        m_new = rand(length(m),1).*variation + lbound;
    end
    
end