function m_new = cull_and_spawn(lbound,ubound,m)
    m_new = m;
    update = 0;
    for i = 1:length(m)
        if (lbound(i) > m(i)) || (ubound(i) < m(i))
            update = 1;
        end
    end
    if update
        variation = ubound-lbound;
        m_new = rand(length(m),1).*variation + lbound;
    end
end