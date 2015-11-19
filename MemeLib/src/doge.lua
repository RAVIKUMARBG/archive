cookie.maymays.doge = function(...)
    local dogeWords = {
        "very",
        "so",
        "much",
        "many",
        "such",
        "quite"
    }

    local ending = {
        "wow",
        "amaze",
        "excite"
    }

    local args = {...}
    local out = {}

    local lastRandom = 0

    for i,v in ipairs(args) do
        local rand = math.random(1,#dogeWords)

        while(rand == lastRandom) do
            rand = math.random(1,#dogeWords)
        end

        table.insert(out,dogeWords[rand].." "..v)

        lastRandom = rand
    end

    table.insert(out,ending[math.random(1,#ending)])

    local nice = "Maymay incoming:\n"

    for i,v in ipairs(out) do
        nice = nice..'.'..string.rep(" 	  ",math.random(2,6))..v.."\n"
    end

    return nice
end
