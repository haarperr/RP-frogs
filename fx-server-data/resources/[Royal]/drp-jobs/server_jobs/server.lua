
--// Post OP Server Side
RegisterServerEvent('drp-civjobs:post-op-payment')
AddEventHandler('drp-civjobs:post-op-payment', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(325, 450)
    user:addBank(payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

--// Water & Power Server Side
RegisterServerEvent('drp-civjobs:water-power-payme')
AddEventHandler('drp-civjobs:water-power-payme', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(200, 375)
    user:addBank(payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

--// Chicken Server Side

 local DISCORD_WEBHOOK5 = "https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn"
local DISCORD_NAME5 = "Chicken Selling Logs"

 local STEAM_KEY = "D01BB33086A760AE0098638CB73C7224"
 local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png"
 PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

local cachedData = {}

RegisterNetEvent('chickensell:log')
AddEventHandler('chickensell:log', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local pName = GetPlayerName(source)
    local pDiscord = GetPlayerIdentifiers(src)[3]
    local DISCORD_NAME5 = "Chicken Selling Logs"
    local STEAM_KEY = "D01BB33086A760AE0098638CB73C7224"
    local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png"
    local LogData = {
        {
           ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "is selling chickens!", src, pDiscord),
            ['color'] = 2317994,
            ['author'] = {
                ['name'] = "Steam Name: "..pName
            },
        }
    }

    PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('chickenpayment:pay')
AddEventHandler('chickenpayment:pay', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
        TriggerEvent("chickensell:log")
	end
end)

RegisterServerEvent('burgershot:receipt:payment')
AddEventHandler('burgershot:receipt:payment', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(200, 350))
end)



 function sendToDiscord5(name, message, color)
     local connect = {
       {
         ["color"] = color,
         ["title"] = "**".. name .."**",
         ["description"] = message,
       }
     }
     PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
 end

--// Fishing Server Side

RegisterServerEvent('drp-fishing:PayPlayer')
AddEventHandler('drp-fishing:PayPlayer', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    user:addMoney(money+15)
    TriggerEvent('drp-base:fishingLog', src, money+15)
end)

--// Garbage Server Side

RegisterNetEvent('drp-garbage:pay')
AddEventHandler('drp-garbage:pay', function(jobStatus)
    local _source = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(_source)
    if jobStatus then
        if user ~= nil then
            local randomMoney = math.random(350, 550)
            user:addMoney(randomMoney)
            TriggerEvent('drp-base:garbageLog', src, randomMoney)
        end
    else
        print("^2[Royal Garbage] Cheater | Caught in 4K Ultra HD ^0",_source, user) 
    end
end)


RegisterNetEvent('drp-garbage:reward')
AddEventHandler('drp-garbage:reward', function(rewardStatus)
    local _source = source
    local matherino = math.random(0, 6)
    if rewardStatus then
        if matherino == 2 then
            TriggerClientEvent('player:receiveItem', _source, 'plastic', math.random(3,9))
            TriggerClientEvent('player:receiveItem', _source, 'rubber', math.random(3,9))
        end
    else
        print("^2[Royal Garbage] Cheater | Caught in 4K Ultra HD ^0") 
    end
end)

--// Mining Server Side



RegisterServerEvent('drp-civjobs:sell-gem-cash')
AddEventHandler('drp-civjobs:sell-gem-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(20, 150) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-stone-cash')
AddEventHandler('drp-civjobs:sell-stone-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(20, 150) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-coal-cash')
AddEventHandler('drp-civjobs:sell-coal-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(15, 25) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-diamond-cash')
AddEventHandler('drp-civjobs:sell-diamond-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(5, 25) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-sapphire-cash')
AddEventHandler('drp-civjobs:sell-sapphire-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(25, 30) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-ruby-cash')
AddEventHandler('drp-civjobs:sell-ruby-cash', function(amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(250, 800) * amount
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

--// Hunting Server Side

RegisterServerEvent('drp-hunting:skinReward')
AddEventHandler('drp-hunting:skinReward', function()
  local _source = source
  local user = exports["drp-base"]:getModule("Player"):GetUser(source)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass1', 1)
  elseif randomAmount > 15 and randomAmount < 23 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass2', 1)
  elseif randomAmount > 23 and randomAmount < 29 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass3', 1)
  else 
    TriggerClientEvent('player:receiveItem', _source, "huntingcarcass4", 1)
  end
end)

RegisterServerEvent('drp-hunting:removeBait')
AddEventHandler('drp-hunting:removeBait', function()
  local _source = source
  local user = exports["drp-base"]:getModule("Player"):GetUser(source)
  TriggerClientEvent('inventory:removeItem', _source, "huntingbait", 1)
end)

RegisterServerEvent('complete:job')
AddEventHandler('complete:job', function(totalCash)
  local _source = source
  local user = exports["drp-base"]:getModule("Player"):GetUser(source)
  user:addMoney(totalCash)
  TriggerEvent('drp-base:huntingLog', _source, totalCash)
end)

--// Rentals Server Side


RegisterServerEvent('drp-rentals:attemptPurchase')
AddEventHandler('drp-rentals:attemptPurchase', function(car)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    if car == "bison" then
        if user:getCash() >= 15000 then
            user:removeMoney(15000)
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    end
end)


RegisterServerEvent('drp-rentals:attemptPurchase')
AddEventHandler('drp-rentals:attemptPurchase', function(car)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    if car == "bison" then
        if user:getCash() >= 500 then
            user:removeMoney(500)
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "futo" then
        if user:getCash() >= 450 then
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
            user:removeMoney(450)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "buffalo" then
        if user:getCash() >= 750 then
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
            user:removeMoney(750)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "jackal" then
        if user:getCash() >= 625 then
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
            user:removeMoney(625)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "youga" then
        if user:getCash() >= 400 then
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
            user:removeMoney(400)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "faggio" then
        if user:getCash() >= 350 then
            TriggerClientEvent('drp-rentals:vehiclespawn', source, car)
            user:removeMoney(350)
        else
            TriggerClientEvent('drp-rentals:attemptvehiclespawnfail', source)
        end
    end
end)

-- Diving Job

RegisterServerEvent('drp-scuba:checkAndTakeDepo')
AddEventHandler('drp-scuba:checkAndTakeDepo', function()
local src = source
local user = exports["drp-base"]:getModule("Player"):GetUser(src)
if user:getCash() >= 400 then
    TriggerClientEvent('getDiveingjob',src)
    user:removeMoney(400)
else
    TriggerClientEvent('DoShortHudText',src, 'Not enough you need 400 $!',2)
    return end
end)

-- RegisterServerEvent('drp-scuba:returnDepo')
-- AddEventHandler('drp-scuba:returnDepo', function()
-- local src = source
-- local user = exports["drp-base"]:getModule("Player"):GetUser(src)
--     user:addMoney(200)
-- end)


RegisterServerEvent('drp-scuba:findTreasure')
AddEventHandler('drp-scuba:findTreasure', function()
local source = source
    local roll = math.random(1,8)
    print(roll)
    if roll == 1 then
        TriggerClientEvent('player:receiveItem', source, "corpsefeet", math.random(2,5))
    end
    if roll == 2 then
        TriggerClientEvent('player:receiveItem', source, 'stolen8ctchain', math.random(2,6))
    end
    if roll == 3 then
        TriggerClientEvent('player:receiveItem', source, 'stolen2ctchain', math.random(2,5))
    end
    if roll == 5 then
        TriggerClientEvent('player:receiveItem', source, "copper", math.random(1,2))
    end
    if roll == 6 then
        TriggerClientEvent('player:receiveItem', source, "lockpick", math.random(1,2))
    end
    if roll == 7 then
        TriggerClientEvent('player:receiveItem', source, "russian", math.random(1,1))
    end
    if roll == 8 then
        TriggerClientEvent('player:receiveItem', source, "ruby", math.random(1,3))
    end
    if roll == 9 then
        TriggerClientEvent('player:receiveItem', source, "jadeite", math.random(1,3))
    end
    if roll == 10 then
        TriggerClientEvent('player:receiveItem', source, "oxy", math.random(1,3))
    end
    if roll == 11 then -- 5% chance 
        if math.random(1,100) >= 95 then
            TriggerClientEvent('DoShortHudText',src, 'You see something shining in the water',2)
            TriggerClientEvent('player:receiveItem', source, "heistusb1", 1)
        else
            TriggerClientEvent('player:receiveItem', source, "femaleseed", math.random(1,2))
    end  
        end
    if roll == 12 then
        TriggerClientEvent('player:receiveItem', source, "goldbar", math.random(1,2))
    end
    
end)

RegisterServerEvent('drp-scuba:paySalvage')
AddEventHandler('drp-scuba:paySalvage', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    if money ~= nil then
        user:addMoney(tonumber(money))
    end
end)

RegisterServerEvent('drp-scuba:makeGold')
AddEventHandler('drp-scuba:makeGold', function()
 local source = source
 TriggerClientEvent('inventory:removeItem', source, 'umetal', 10)
 TriggerClientEvent("player:receiveItem", source, "goldbar", 1)
end)