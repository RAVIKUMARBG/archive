LH = LH or {}
cookie.LH = cookie.LH or {}

LH.Version = "LibHash 3.5"

LH.Status = "Installed at "..os.date("%c")

LH.Hooks = {}

LH.AddHook = function(hookname,hookid,hookfunc)

    if(type(hookname) ~= "string") then
        print("[LH] Error: Hook Name [1] must be a string")

        return
    end

    if(type(hookid) ~= "string") then
        print("[LH] Error: Hook ID [2] must be a string")

        return
    end

    if(type(hookfunc) ~= "function") then
        print("[LH] Error: Hook Function [3] must be a function")

        return
    end

    table.insert(LH.Hooks,{hookname=hookname,hookid="LH_"..hookid,hookfunc=hookfunc})
    hook.Add(hookname,"LH_"..hookid,hookfunc)
end

LH.RemoveAllHooks = function()
    for k,v in ipairs(LH.Hooks) do
        hook.Remove(v.hookname,v.hookid)
    end
end
