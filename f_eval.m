function [Flist, Fvals] = f_eval(Plist,Ftargets,func_to_eval)

    Fvals = feval(func_to_eval,Plist);
    Flist = abs(Ftargets - Fvals);
    
end