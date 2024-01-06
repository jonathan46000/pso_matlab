function active_new = invisible(lbound,ubound,m,active,particle)
    
    active_new = active;
    [update, ~] = check_bounds(lbound,ubound,m);
    
    if update
        active_new(particle) = 0;
    end
    
end