LH.Players = {}
cookie.LH_History = {}

LH.AddHook("Connected","AddPly",function(plyNick,plySteamID)
    LH.Players[plySteamID] = plyNick
    cookie.LH_History[plySteamID] = plyNick
end)

LH.AddHook("Disconnected","DelPly",function(plyNick,plySteamID)
    LH.Players[plySteamID] = nil
end)

LH.PrintConnected = function()
    local i=1
    print("Connected: ")
    for k,v in pairs(LH.Players) do
        print(i..". "..v.." ["..k.."]")
        i = i + 1
    end
end

LH.SteamIDToNick = function(steamid)
    return cookie.LH_History[steamid] or false
end

LH.NickToSteamID = function(nick)
    for k,v in pairs(cookie.LH_History) do
        if(string.find(string.lower(v),string.lower(nick))) then
            return k
        end
    end

    return false
end

LH.SteamID64ToSteamID = function(id64_str)
    if not id64_str then return end

    local id64 = tonumber(id64_str)
    local authserver = id64%2

    local authid = ((id64 - 76561197960265728 - authserver)/2)
    local steamID = "STEAM_0:"..(authserver)..":"..string.sub(authid,1,-3)

    return steamID
end

LH.SteamIDToSteamID64 = function(id)
    if not id then return end

    local gmatch = string.match(id,"STEAM_0:(%d):(%d+)")

    if not (gmatch) then return end
    if not (gmatch[1]) then return end
    if not (gmatch[2]) then return end

    local a = tonumber(gmatch[1])
    print(a)
    local b = tonumber(gmatch[2])
    print(b)
    return tostring(76561197960265728 + a + b*2)
end
