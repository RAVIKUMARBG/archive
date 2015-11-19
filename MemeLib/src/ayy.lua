cookie.maymays.ayy = function(lmao,length,shouldPrint)
    length = length or 2 lmao = lmao or "lmao"
    local toPrint = 'a'
    for i=1,length,1 do
        toPrint = toPrint..'y'
    end

    if(shouldPrint) then
        print(toPrint..' '..lmao)
    else
        return (toPrint..' '..lmao)
    end
end
