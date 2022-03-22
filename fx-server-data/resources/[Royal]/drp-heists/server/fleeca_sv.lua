cooldownglobal = 0

RegisterServerEvent("drp-fleeca:startcheck")
AddEventHandler("drp-fleeca:startcheck", function(bank)
    local _source = source
    globalonaction = true
    TriggerClientEvent("inventory:removeItem","heistlaptop2", 1)   
    TriggerClientEvent("drp-fleeca:outcome", _source, true, bank)
end)

RegisterServerEvent("drp-fleeca:TimePoggers")
AddEventHandler("drp-fleeca:TimePoggers", function()
    local _source = source
    TriggerClientEvent("drp-fleeca:outcome", _source, false, "A bank as been recently robbed. You need to wait "..math.floor((fleeca.cooldown - (os.time() - cooldownglobal)) / 60)..":"..math.fmod((fleeca.cooldown - (os.time() - cooldownglobal)), 60))
end)

RegisterServerEvent("drp-fleeca:DoorAccessPoggers")
AddEventHandler("drp-fleeca:DoorAccessPoggers", function()
    local _source = source
    TriggerClientEvent("drp-fleeca:outcome", _source, false, "There is a bank currently being robbed.")
end)

RegisterServerEvent("drp-fleeca:lootup")
AddEventHandler("drp-fleeca:lootup", function(var, var2)
    TriggerClientEvent("drp-fleeca:lootup_c", -1, var, var2)
end)

RegisterServerEvent("drp-fleeca:openDoor")
AddEventHandler("drp-fleeca:openDoor", function(coords, method)
    TriggerClientEvent("drp-fleeca:openDoor_c", -1, coords, method)
end)

RegisterServerEvent("drp-fleeca:startLoot")
AddEventHandler("drp-fleeca:startLoot", function(data, name)
    TriggerClientEvent("drp-fleeca:startLoot_c", -1, data, name)
end)

RegisterServerEvent("drp-fleeca:stopHeist")
AddEventHandler("drp-fleeca:stopHeist", function(name)
    TriggerClientEvent("drp-fleeca:stopHeist_c", -1, name)
end)

RegisterServerEvent("drp-fleeca:rewardCash")
AddEventHandler("drp-fleeca:rewardCash", function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(5000, 15000) -- 5-15K Cash Reward
    TriggerClientEvent('player:receiveItem',src, "markedbills", math.random(10,25))
    user:addMoney(cash)
    if math.random(100) < 20 then -- Blue Dongle Chance 20%
        TriggerClientEvent('player:receiveItem',src, "heistusb1", 1)
        end
    if math.random(100) < 25 then -- Big Bag Chance 25%
        TriggerClientEvent('player:receiveItem',src, "inkedmoneybag", math.random(1,2))  
    end
end)

RegisterServerEvent("drp-fleeca:setCooldown")
AddEventHandler("drp-fleeca:setCooldown", function(name)
    cooldownglobal = os.time()
    globalonaction = false
    TriggerClientEvent("drp-fleeca:resetDoorState", -1, name)
end)

RegisterServerEvent("drp-fleeca:getBanksSV")
AddEventHandler("drp-fleeca:getBanksSV", function()
    local banks = fleeca.Banks
    TriggerClientEvent('drp-fleeca:getBanks', -1, fleeca.Banks)
end)

local cooldownAttempts = 5

RegisterServerEvent("drp-fleeca:getHitSV")
AddEventHandler("drp-fleeca:getHitSV", function()
    TriggerClientEvent('drp-fleeca:getHit', -1, cooldownAttempts)
end)

RegisterServerEvent("drp-fleeca:getHitSVSV")
AddEventHandler("drp-fleeca:getHitSVSV", function(fleecaBanksTimes)
    cooldownAttempts = fleecaBanksTimes
end)

local doorCheckFleeca = false

RegisterServerEvent("drp-fleeca:getGetDoorStateSV")
AddEventHandler("drp-fleeca:getGetDoorStateSV", function()
    TriggerClientEvent('drp-fleeca:getDoorCheckCL', -1, doorCheckFleeca)
end)

RegisterServerEvent("drp-fleeca:getGetDoorStateSVSV")
AddEventHandler("drp-fleeca:getGetDoorStateSVSV", function(fleecaBanksDoors)
    doorCheckFleeca = fleecaBanksDoors
end)


RegisterServerEvent("drp-fleeca:getTimeSV")
AddEventHandler("drp-fleeca:getTimeSV", function()
    TriggerClientEvent('drp-fleeca:GetTimeCL', -1, cooldownglobal)
end)

RegisterServerEvent("drp-fleeca:getTime2SV")
AddEventHandler("drp-fleeca:getTime2SV", function()
    TriggerClientEvent('drp-fleeca:GetTime2CL', -1, (os.time() - fleeca.cooldown))
end)

RegisterServerEvent("drp-fleeca:getDoorAccessSV")
AddEventHandler("drp-fleeca:getDoorAccessSV", function()
    TriggerClientEvent('drp-fleeca:GetDoorAccessCL', -1, globalonaction)
end)