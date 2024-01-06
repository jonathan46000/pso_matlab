function [update, vec] = check_bounds(lbound,ubound,m)
    update = 0;
    vec = 0;
    for i = 1:length(m)
        if (lbound(i) > m(i)) || (ubound(i) < m(i))
            update = 1;
            vec = i;
        end
    end
end