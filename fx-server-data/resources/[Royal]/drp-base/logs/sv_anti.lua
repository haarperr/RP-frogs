Citizen.CreateThread(function()
    -- if GetConvarInt('logs_enabled', 0) == 1 then
        print("^5[anti-cheat]^0 | ^2Running and logging all components^0")		
    -- else
    --     print("^5[anti-cheat]^0 | ^8Disabled | Dev Server ^0")	
    -- end
end)


    AddEventHandler('entityCreating', function(entity)
       -- if GetConvarInt('logs_enabled', 0) == 1 then
            local model = GetEntityModel(entity)
            local pOwner = NetworkGetEntityOwner(entity)
            for i=1, #blockedItems do 
                if model == GetHashKey(blockedItems[i]) then
                    CancelEvent()
                    local LogInfo = "Prop Hash: " .. model
                    exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pOwner, "Cheater: Spawned Blacklisted Prop", "Spawning Props", LogInfo)
                    Citizen.Wait(100)
                    DropPlayer(pOwner, "[Anti-Cheat]: You have been permanently banned.")
                    break
                end
            end
      --  end
    end)

    -- Send message when Player disconnects from the server
    AddEventHandler('playerDropped', function(reason)
     --   if GetConvarInt('logs_enabled', 0) == 1 then
            local pSrc = source
            local pName = GetPlayerName(pSrc)
            local LogInfo =  pName.. " Disconnected | Reason: " .. reason
            exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Player Disconnected", "", LogInfo)
      --  end
    end)


    RegisterServerEvent('player:dead')
    AddEventHandler('player:dead',function(killer, DeathReason)
      --  if GetConvarInt('logs_enabled', 0) == 1 then
            local pSrc = source
            local pName = GetPlayerName(pSrc)
            local tName = GetPlayerName(killer)

            local LogInfo = pName .. " was killed by " .. tName .. "  | Type: " ..DeathReason
            exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", killer, "Combat Encounter", "", LogInfo)
       -- end
    end)


    RegisterServerEvent('player:damage:multi')
    AddEventHandler('player:damage:multi',function(attacker, weapon, dmg)
        local aName = GetPlayerName(attacker)
        local pName = GetPlayerName(source)
        local pLogData = "Attacker's Steam Name: " ..  aName .. " | ID: " .. attacker .. "\n Damage Modifier: " .. dmg .. "\n Victim's Name: " ..pName.. "\n Weapon: " .. weapon
        exports['drp-base']:toxic_log(attacker, "damage_multi", pLogData)
        DropPlayer(attacker, "Cheating | Damage Modifier | Perma Banned")
    end)


    function toxic_log(pSrc, LogType, LogInfo)
    --	if GetConvarInt('logs_enabled', 0) == 1 then
            if LogType == "Spawned:items" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Spawned Item -> with admin menu", "", LogInfo)
            elseif LogType == "Spawned:car" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Spawned Car -> with admin menu", "", LogInfo)
            elseif LogType == "Spectating" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Spectating Toggled -> with admin menu", "", LogInfo)
            elseif LogType == "Searching" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Searching Toggled -> with admin menu", "", LogInfo)
            elseif LogType == "deposit" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Banking Deposit", "", LogInfo)
            elseif LogType == "withdraw" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Banking Withdraw", "", LogInfo)
            elseif LogType == "transfer" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Bank Transfer", "", LogInfo)
            elseif LogType == "give_cash" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Give Cash", "", LogInfo)
            elseif LogType == "damage_multi" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Damage Modifier", "Cheating | Damage Modifier | Perma Banned", LogInfo)
            elseif LogType == "external-pay" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Payment sent from phone - External Pay", "", LogInfo)
            elseif LogType == "external-deposit" then
                exports['drp-base']:DiscordLog("https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn", pSrc, "Payment deposit from phone - External Deposit", "", LogInfo)
            end
    --	end
    end


    local BlacklistedModels = {
        "RHINO",
        "lazer",
        "cargobob",
        "tanker2",
        --"boxville4", removed postop truck model from blacklist
        "hydra",
        "insurgent",
        "technical",
        "technical2",
        "savage",
        "valkyrie",
        "firetruk",-- Firetruck
        "Ambulance",-- EMS
        "blazer5",
        "dune4",
        "ruiner2",
        "phantom2",
       "akula",
        "chernobog",
        "apc",
        "tamapq3",
        "halftrack",
        "barrage",
        "deluxo",
        "thruster",
        "caracara",
        "buzzard",
       "buzzard2",
        "dukes2",
        "limo2",
        "vigilante",
        "voltic2",
        "technical3",
        "ambulance",
        "vindicator",
        "thrust",
        "wastelander",
        "havok",
        "bestra",
        "supervolito",
        "swift",
        "supervolito2",
        "cargobob2",
        "cargobob3",
        "cargobob4",
        "valkyrie2",
        "annihilator",
        "skylift",
        "frogger",
        "seasparrow",
        "frogger2",
        "volatus",
        "hunt",
        "hunter",
        "khanjali",
        "barracks",
        "barracks2",
        "barracks3",
        "trailersmall2",
        "crusader",
        "blimp",
        "blimp2",
        "blimp3",
        "shamal",
        "nimbus",
        "velum2",
        "avenger",
        "velum",
        "alphaz1",
        "cuban800",
        "tula",
        "duster",
        "bombushka",
        "molotok",
        "pyro",
        "seabreeze",
        "volatol",
        "starling",
        "mogul",
        "titan",
        "nokota",
        "miljet",
        "strikeforce",
        "howard",
        "cargoplane",
        "dodo",
        "besra",
        "jet",
        "luxor2",
        "vestra",
        "rogue",
       "stunt",
        "mammatus",
        "avenger2",
        "tampa3",
        "scarab3",
       "scarab",
        "scarab2",
        "minitank",
        "zr3803",
        "raptor",
        "zr3802",
        "kuruma2",
        "zr380",
        "ruiner3",
        "ratloader",
       "slamvan4",
        "slamvan5",
        "imperator3",
        "dominator5",
        "dominator4",
        "impaler4",
        "dominator6",
        "imperator2",
        "impaler3",
        "slamvan6",
        "dune2",
        "dune3",
        "nightshark",
        "insurgent3",
        "menacer",
        "marshall",
        "monster",
        "dune5",
        "bruiser",
       "monster5",
        "monster4",
        "zhaba",
        "scramjet",
        "oppressor",
        "rrocket",
        "shotaro",
        "oppressor2",
        "shotaro",
    }

    -- Vehicle Blacklist
    AddEventHandler('entityCreating', function(entity)
        local model = GetEntityModel(entity)
        local pOwner = NetworkGetEntityOwner(entity)
        for i=1, #BlacklistedModels do 
            if model == GetHashKey(BlacklistedModels[i]) then
                CancelEvent()
                break
            end
        end
    end)