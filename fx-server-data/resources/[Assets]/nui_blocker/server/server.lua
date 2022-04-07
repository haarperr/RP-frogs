function ExtractIdentifiers(src)
    
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

local logs = "https://discordapp.com/api/webhooks/961639588470857779/9ZV7V3-h1Vbvv5jSgxVM-nhh9oCLrnsmin5pzuHn3Sn4MLdQzipYHs0TD1dEvzPfJBw4"

local kick_msg = "AntiCheat Kick - Logged To Staff Discord"
local discord_msg = '`Server Player Tried Opening Dev Tools and got kicked!`\n`NUI Blocker`'
local color_msg = 16767235

function sendToDiscord (source,message,color,identifier)
    
    local name = GetPlayerName(source)
    if not color then
        color = color_msg
    end
    local sendD = {
        {
            ["color"] = color,
            ["title"] = message,
            ["description"] = "`Player`: **"..name.."**\nSteam: **"..identifier.steam.."** \nIP: **"..identifier.ip.."**\nDiscord: **"..identifier.discord.."**\nFivem: **"..identifier.license.."**",
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "RPFrogs - NUI Blocker", embeds = sendD}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent(GetCurrentResourceName())
AddEventHandler(GetCurrentResourceName(), function()
    local _source = source
    local identifier = ExtractIdentifiers(_source)
    local identifierDb
    if extendedVersionV1Final then
        identifierDb = identifier.license
    else
        identifierDb = identifier.steam
    end
    if checkmethod == 'steam' then
	if json.encode(allowlist) == "[]" then
	   sendToDiscord (_source, discord_msg, color_msg,identifier)
           DropPlayer(_source, kick_msg)		
	end
	for _, v in pairs(allowlist) do
           if v ~= identifierDb then
	      sendToDiscord (_source, discord_msg, color_msg,identifier)
              DropPlayer(_source, kick_msg)
           end
        end
     elseif checkmethod == 'SQL' then
        MySQL.Async.fetchAll("SELECT group FROM users WHERE identifier = @identifier",{['@identifier'] = identifierDb }, function(results) 
            if results[1].group ~= 'admin' or 'dev' then
               sendToDiscord (source, discord_msg, color_msg,identifier)
               DropPlayer(source, kick_msg)
            end
        end)
     end
end)
