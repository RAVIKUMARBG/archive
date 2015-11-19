cookie.LH_install = function()
    local installFailed = false

    if(LH) then
        cookie.LH_uninstall()
    end

    local requirements = {
        "LH_framework",
        "LH_responder",
        "LH_users",
        "LH_startup",
        "tstr"
    }

    if(type(cookie) ~= 'table') then
        print("[LHi] Error: Where are my cookies?")
        return
    end

    for k,v in ipairs(requirements) do
        if(type(cookie[v]) ~= "string") then
            installFailed = true
            print("[LHi] Error: Missing requirement: LHc."..v)
        end
    end

    if(installFailed) then
        print("[LHi] Halted install.")
        return
    end


    for k,v in ipairs(requirements) do
        cookie[v]()
        print("[LHi] Loaded LHc."..v.."")
    end

    print("[LHi] "..LH.Version.." successfully installed.")
end

cookie.LH_uninstall = function()
    if(LH) then
        LH.RemoveAllHooks()

        LH = nil

        print("[LHi] LibHash uninstalled.")
    else
        print("[LHi] LibHash is not installed!")
    end
end

print("[LHii] LH installer installed.")
