LH.AddResponder("deez nuts","Got him!")

LH.AddResponder("i am gold","Nobody cares.")

LH.AddResponder("lua","LAU*")

LH.AddResponder("debug.getregistry()","No.")

LH.AddResponder("no hash",function()
    timer.Simple(1,function()
        print("Please forgive me")
    end)

    return "I'm sorry Master"
end)

local function url_encode(str)
    if (str) then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w %-%_%.%~])",function (c)
            return string.format ("%%%02X", string.byte(c))
        end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

LH.AddResponder("how do i",function(nick,steamID,msg)
    return ("Actually use google: http://lmgtfy.com/?q="..url_encode(msg))
end)
