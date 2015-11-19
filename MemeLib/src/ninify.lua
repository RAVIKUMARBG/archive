cookie.maymays.ninify = function(str)
                                                            --Thanks Wiox and Meep!
    return (string.gsub(string.gsub(" "..str, "%W%l", string.upper):sub(2),"([%.!%?,'])",string.rep("%1",math.random(1,40))))
end
