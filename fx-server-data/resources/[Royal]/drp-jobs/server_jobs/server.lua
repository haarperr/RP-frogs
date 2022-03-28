
--// Post OP Server Side
RegisterServerEvent('drp-civjobs:post-op-payment')
AddEventHandler('drp-civjobs:post-op-payment', function()
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(275, 400)
    user:addBank(payment)
    TriggerEvent('drp-base:postopLog', src, payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

--// Water & Power Server Side
RegisterServerEvent('drp-civjobs:water-power-payme')
AddEventHandler('drp-civjobs:water-power-payme', function()
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(150, 275)
    user:addBank(payment)
    TriggerEvent('drp-base:waterpowerLog', src, payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

--// Chicken Server Side

-- local DISCORD_WEBHOOK5 = "https://discord.com/api/webhooks/903025721243496518/GUUwv2Lg_W8xN8a_NIh3c7VOvdWfKHDMCX6Hv3nsWnmp8Ffuo9shSbG8ZGiJW07kTxbS"
local DISCORD_NAME5 = "Chicken Selling Logs"

-- local STEAM_KEY = "0C007CC382AB06D1D99D9B45EC3924B1"
-- local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png"
7
-- PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

local cachedData = {}

RegisterServerEvent('chickenpayment:pay')
AddEventHandler('chickenpayment:pay', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
	end
end)

RegisterServerEvent('burgershot:receipt:payment')
AddEventHandler('burgershot:receipt:payment', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(200 ,500))
end)



-- function sendToDiscord5(name, message, color)
--     local connect = {
--       {
--         ["color"] = color,
--         ["title"] = "**".. name .."**",
--         ["description"] = message,
--       }
--     }
--     PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
-- end

--// Fishing Server Side

RegisterServerEvent('drp-fishing:PayPlayer')
AddEventHandler('drp-fishing:PayPlayer', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    user:addMoney(money)
    TriggerEvent('drp-base:fishingLog', src, money)
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
AddEventHandler('drp-civjobs:sell-gem-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(20, 150) * toSell

    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-stone-cash')
AddEventHandler('drp-civjobs:sell-stone-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(20, 150) * toSell
    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-coal-cash')
AddEventHandler('drp-civjobs:sell-coal-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(15, 25) * toSell
    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-diamond-cash')
AddEventHandler('drp-civjobs:sell-diamond-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(5, 25) * toSell
    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-sapphire-cash')
AddEventHandler('drp-civjobs:sell-sapphire-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(25, 30) * toSell
    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
    TriggerClientEvent('DoLongHudText', src, 'You were paid $'..cash, 1)
end)

RegisterServerEvent('drp-civjobs:sell-ruby-cash')
AddEventHandler('drp-civjobs:sell-ruby-cash', function(toSell)
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(250, 800) * toSell
    user:addMoney(cash)
    TriggerEvent('drp-base:miningLog', src, cash)
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
        TriggerClientEvent('player:receiveItem', source, "starrynight", math.random(1,2))
    end
    if roll == 6 then
        TriggerClientEvent('player:receiveItem', source, "shitlockpick", math.random(1,5))
    end
    if roll == 7 then
        TriggerClientEvent('player:receiveItem', source, "russian", math.random(1,1))
    end
    if roll == 8 then
        TriggerClientEvent('player:receiveItem', source, "ruby", math.random(1,1))
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