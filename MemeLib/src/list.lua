cookie.maymays.list = function()
    local out = {"Welcome to the grand Meme Forge™","We currently have the following memes in stock: "}
    local n = 1
    for k,v in pairs(cookie.maymays) do
        if k ~= "list" then
            table.insert(out,n..". "..k.."    ["..math.random(1,100).." memeCredits]")
            n = n+1
        end
    end

    return table.concat(out,"\n")
end
