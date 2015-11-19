cookie.maymays.xd = function(n_x,n_d,simplecase)
    if(simplecase) then
        return string.rep("x",n_x or 1)..string.rep("d",n_d or 1)
    else
        return string.rep("X",n_x or 1)..string.rep("D",n_d or 1)
    end
end
