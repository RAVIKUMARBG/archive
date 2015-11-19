LH.Responders = {}

LH.AddResponder = function(key,response,patternMatch,steamID)
    if(type(key) ~= 'string') then return end
    if((type(response) ~= 'string') and (type(response) ~= 'function')) then return end

    if(LH.Responders[key]) then
        print("[LH] Error: The key \""..key.."\" already exists in the responder table. Remove it first.")

        return
    end

    LH.Responders[string.lower(key)] = {
        response = response,
        patternMatch = patternMatch,
        steamID = steamID
    }
end

LH.DeleteResponder = function(key)
    if(LH.Responders[key]) then
        LH.Responders[key] = nil
        print("[LH] Deleted \""..key.."\" from the responder table")
    else
        print("[LH] \""..key.."\" does not exist in the responder table")
    end
end

LH.AddHook("Message","Responder",function(plyName,plySteamID,msg)
    if(msg[1] == "]") then return end
    if(string.sub(msg,1,2) == "LH") then return end
    for k,v in pairs(LH.Responders) do
        if((not v.steamID) or (v.steamID == plySteamID)) then
            if(string.find(string.lower(msg),k,1,false and v.patternMatch)) then
                if(type(v.response) == "function") then print(v.response(plyName,plySteamID,msg)) else print(v.response) end
            end
        end
    end
end)
