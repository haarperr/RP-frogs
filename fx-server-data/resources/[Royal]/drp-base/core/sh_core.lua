DRP.Core = DRP.Core or {}

function DRP.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[ot LOG - %s] %s", mod, msg)
    if not pMsg then return end

end

RegisterNetEvent("drp-base:consoleLog")
AddEventHandler("drp-base:consoleLog", function(msg, mod)
    DRP.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not DRP[module] then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return DRP[module]
end

function addModule(module, tbl)
    if DRP[module] then print("Warning: '" .. tostring(module) .. "' module is being overridden") end
    DRP[module] = tbl
end

DRP.Core.ExportsReady = false

function DRP.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["drp-base"] then
                TriggerEvent("drp-base:exportsReady")
                DRP.Core.ExportsReady = true
                return
            end
        end
    end)
end

exports("getModule", getModule)
exports("addModule", addModule)
DRP.Core:WaitForExports()

 local webhook = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Your Discord webhook for logs
 local webhook2 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Your Discord webhook for logs
 local webhook3 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Your Discord webhook for logs
 local webhook4 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Your Discord webhook for logs
 local webhook5 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Your Discord webhook for logs

 local webhook6 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- MDT - Reports Deleted
 local webhook7 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- MDT - Warrant Deleted

 local webhook8 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Teleporters - Meth Enter / Leave
 local webhook9 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Teleporters - Coke Enter / Leave
 local webhook10 = 'https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn' -- Teleporters - Recycle Enter / Leave

 
 RegisterNetEvent('bankrobbery:log')
 AddEventHandler('bankrobbery:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "started a bank robbery!", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('convienceregister:log')
 AddEventHandler('convienceregister:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "started to a empty a Convience Store Register!", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('conviencesafe:log')
 AddEventHandler('conviencesafe:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
    local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "started to a empty a Convience Store Safe!", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                ['name'] = "Steam Name: "..pName
             },
         }
     }

      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	

 end)

 RegisterNetEvent('stealcommand:log')
 AddEventHandler('stealcommand:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "/steal command used", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook2, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('jewelrobbery:log')
 AddEventHandler('jewelrobbery:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Jewelry Store Robbery", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook3, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('banktruckrobbery:log')
 AddEventHandler('banktruckrobbery:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
    local pDiscord = GetPlayerIdentifiers(src)[3]
    local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Bank Truck Robbery", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

   	PerformHttpRequest(webhook4, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)


RegisterNetEvent('dmg:log')
 AddEventHandler('dmg:log', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Damage Exceeded", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }
     PerformHttpRequest(webhook5, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('drp-mdt:delreport')
 AddEventHandler('drp-mdt:delreport', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local char = user:getCurrentCharacter()
     local hexId = user:getVar("hexid")
     local pCharName = char.first_name .. " " ..char.last_name
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "MDT - Report Deleted", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['fields'] = {
                 {
                     ['name'] = '`Character Name`',
                     ['value'] = pCharName,
                     ['inline'] = true
                 },
                 {
                     ['name'] = '`Reason For Log`',
                     ['value'] = "Deleted a MDT Report",
                    ['inline'] = true
                 }
             },
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

   	PerformHttpRequest(webhook6, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('drp-mdt:delwarrant')
 AddEventHandler('drp-mdt:delwarrant', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local char = user:getCurrentCharacter()
     local hexId = user:getVar("hexid")
     local pCharName = char.first_name .. " " ..char.last_name
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "MDT - Warrent Deleted", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['fields'] = {
                 {
                     ['name'] = '`Character Name`',
                     ['value'] = pCharName,
                     ['inline'] = true
                 },
                 {
                     ['name'] = '`Reason For Log`',
                     ['value'] = "Deleted a MDT Warrent",
                     ['inline'] = true
                 }
             },
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

   	PerformHttpRequest(webhook7, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('meth:enter')
 AddEventHandler('meth:enter', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Entered the Meth Lab!", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                ['name'] = "Steam Name: "..pName
             },
         }
    }

     PerformHttpRequest(webhook8, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

 RegisterNetEvent('meth:leave')
 AddEventHandler('meth:leave', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
        {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Left the Meth Lab!", src, hexId, pDiscord),
             ['color'] = 2317994,
            ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

    PerformHttpRequest(webhook8, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

RegisterNetEvent('coke:enter')
 AddEventHandler('coke:enter', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Entered the Coke Lab!", src, hexId, pDiscord),
             ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook9, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)

RegisterNetEvent('coke:leave')
 AddEventHandler('coke:leave', function()
     local src = source
     local user = exports["drp-base"]:getModule("Player"):GetUser(src)
     local hexId = user:getVar("hexid")
     local pName = GetPlayerName(source)
     local pDiscord = GetPlayerIdentifiers(src)[3]
     local LogData = {
         {
             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Left the Coke Lab!", src, hexId, pDiscord),
            ['color'] = 2317994,
             ['author'] = {
                 ['name'] = "Steam Name: "..pName
             },
         }
     }

     PerformHttpRequest(webhook9, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
 end)