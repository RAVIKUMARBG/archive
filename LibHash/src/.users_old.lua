player = {}

local function InitMasterList()
    player.MasterList = {}

    --[[
    setmetatable(player.MasterList,{
        __tostring = function(tbl)
            return "Player List ["..#tbl.." players]"
        end
    })
    ]]
end

InitMasterList()

local function InitPData()
    if(cookie.LH_PData) then
        LH.PData = assert(load("return "..cookie.LH_PData))()
    else
        cookie.LH_PData = {}
        LH.PData = {}
    end
end

local function PDataSync(steamid64,data)
    LH.PData[steamid64] = data
    cookie.LH_PData = tstr(LH.PData)
end

InitPData()

local function ApplyPlayerClass(ply)
    --[[
    setmetatable(ply,{
        __tostring = function(tbl)
            return "Player ["..tbl.PID.."] "..tbl.Nick
        end
    })
    ]]

    function ply:Nick()
        return self.Nick
    end

    function ply:SteamID()
        return self.SteamID
    end

    function ply:SteamID64()
        return self.SteamID64
    end

    function ply:UniqueID()
        error("Called unimplemented function Player:UniqueID.")
        return ""
    end

    function ply:SetPData(key,value)
        self.PData[key] = value

        PDataSync(self.SteamID64,self.PData)

        return true
    end

    function ply:GetPData(key,default)
        return self.PData[key] or default
    end

    function ply:RemovePData(key)
        self.PData[key] = nil

        PDataSync(self.SteamID64,self.PData)

        return true
    end

    return ply
end

local function RegisterPlayer(nick,steamid64)
    local newPly = {}
    BasePlayer.SteamID64 = steamid64
    BasePlayer.Nick = nick
    if not (LH.PData) then InitPData() end
    BasePlayer.PData = LH.PData[steamid64] or {}

    local id64 = tonumber(steamid64)
    local authserver = id64%2

    local authid = ((id64 - 76561197960265728 - authserver)/2)
    BasePlayer.SteamID = "STEAM_0:"..(authserver)..":"..string.sub(authid,1,-3)

    table.insert(player.MasterList,ApplyPlayerClass(newPly))
end

local function RemovePlayer(steamid64)
    for i,v in ipairs(player.MasterList) do
        if(v:SteamID64() == steamid64) then
            player.MasterList[i] = nil

            return true
        end
    end

    return false
end

LH.AddHook("M_Connected","AddPly",function(nick,steamid64)
    RemovePlayer(steamid64)

    RegisterPlayer(nick,steamid64)
end)

LH.AddHook("Connected","AddPly",function(nick,steamid64)
    RemovePlayer(steamid64)

    RegisterPlayer(nick,steamid64)
end)

LH.AddHook("Disconnected","DelPly",function(nick,steamid64)
    RemovePlayer(steamid64)
end)

function player.GetAll()
    return player.MasterList
end

function player.GetBySteamID(steamid)
    for i,v in ipairs(player.MasterList) do
        if(v:SteamID() == steamid) then
            return v
        end
    end
end

function player.GetBySteamID64(steamid64)
    for i,v in ipairs(player.MasterList) do
        if(v:SteamID64() == steamid64) then
            return v
        end
    end
end
