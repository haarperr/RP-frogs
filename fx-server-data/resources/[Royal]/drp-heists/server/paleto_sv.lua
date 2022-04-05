cooldownglobalPaleto = 0

RegisterServerEvent("drp-paleto:startcheck")
AddEventHandler("drp-paleto:startcheck", function(bank)
    local _source = source
    globalonactionPaleto = true
    TriggerClientEvent('drp-inv:removeItem', _source, 'bluetablet', 1)
    TriggerClientEvent("drp-paleto:outcome", _source, true, bank)
end)

RegisterServerEvent("drp-paleto:TimePoggers")
AddEventHandler("drp-paleto:TimePoggers", function()
    local _source = source
    TriggerClientEvent("drp-paleto:outcome", _source, false, "This bank recently robbed. You need to wait "..math.floor((paleto.cooldown - (os.time() - cooldownglobalPaleto)) / 60)..":"..math.fmod((paleto.cooldown - (os.time() - cooldownglobalPaleto)), 60))
end)

RegisterServerEvent("drp-paleto:DoorAccessPoggers")
AddEventHandler("drp-paleto:DoorAccessPoggers", function()
    local _source = source
    TriggerClientEvent("drp-paleto:outcome", _source, false, "There is a bank currently being robbed.")
end)

RegisterServerEvent("drp-paleto:lootup")
AddEventHandler("drp-paleto:lootup", function(var, var2)
    TriggerClientEvent("drp-paleto:lootup_c", -1, var, var2)
end)

RegisterServerEvent("drp-paleto:openDoor")
AddEventHandler("drp-paleto:openDoor", function(coords, method)
    TriggerClientEvent("drp-paleto:OpenPaletoDoor", -1)
end)

RegisterServerEvent("drp-paleto:closeDoor")
AddEventHandler("drp-paleto:closeDoor", function(coords, method)
    TriggerClientEvent("drp-paleto:ClosePaletoDoor", -1)
end)

RegisterServerEvent("drp-paleto:startLoot")
AddEventHandler("drp-paleto:startLoot", function(data, name)
    TriggerClientEvent("drp-paleto:startLoot_c", -1, data, name)
end)

RegisterServerEvent("drp-paleto:stopHeist")
AddEventHandler("drp-paleto:stopHeist", function(name)
    TriggerClientEvent("drp-paleto:stopHeist_c", -1, name)
end)

RegisterServerEvent("drp-paleto:rewardCash")
AddEventHandler("drp-paleto:rewardCash", function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(8000, 15000) -- 8-15K Cash Reward
    TriggerClientEvent('player:receiveItem',src, "markedbills", math.random(30,55))
    user:addMoney(cash)
    if math.random(100) < 20 then -- Red Dongle Chance 20%
        TriggerClientEvent('player:receiveItem',src, "heistusb2", 1)
        end
    if math.random(100) < 25 then -- Big Bag Chance 25%
        TriggerClientEvent('player:receiveItem',src, "inkedmoneybag", math.random(1,2))  
    end
    
    if math.random(100) < 5 then -- Big Bag Chance 25%
        TriggerClientEvent('player:receiveItem',src, "inkedmoneybag", 1)  
    end
end)


RegisterServerEvent("drp-paleto:setCooldown")
AddEventHandler("drp-paleto:setCooldown", function(name)
    cooldownglobalPaleto = os.time()
    globalonactionPaleto = false
    TriggerClientEvent("drp-paleto:resetDoorState", -1, name)
end)


RegisterServerEvent("drp-paleto:getBanksSV")
AddEventHandler("drp-paleto:getBanksSV", function()
    TriggerClientEvent('drp-paleto:getBanks', -1, paleto.Banks)
end)

local cooldownAttemptsPaleto = 3

RegisterServerEvent("drp-paleto:getHitSV")
AddEventHandler("drp-paleto:getHitSV", function()
    TriggerClientEvent('drp-paleto:getHit', -1, cooldownAttemptsPaleto)
end)

RegisterServerEvent("drp-paleto:getHitSVSV")
AddEventHandler("drp-paleto:getHitSVSV", function(paletoBanksTimes)
    cooldownAttemptsPaleto = paletoBanksTimes
end)

local doorCheckPaleto = false

RegisterServerEvent("drp-paleto:getGetDoorStateSV")
AddEventHandler("drp-paleto:getGetDoorStateSV", function()
    TriggerClientEvent('drp-paleto:getDoorCheckCL', -1, doorCheckPaleto)
end)

RegisterServerEvent("drp-paleto:getGetDoorStateSVSV")
AddEventHandler("drp-paleto:getGetDoorStateSVSV", function(paletoBanksDoors)
    doorCheckPaleto = paletoBanksDoors
end)


RegisterServerEvent("drp-paleto:getTimeSV")
AddEventHandler("drp-paleto:getTimeSV", function()
    TriggerClientEvent('drp-paleto:GetTimeCL', -1, cooldownglobalPaleto)
end)

RegisterServerEvent("drp-paleto:getTime2SV")
AddEventHandler("drp-paleto:getTime2SV", function()
    TriggerClientEvent('drp-paleto:GetTime2CL', -1, (os.time() - paleto.cooldown))
end)

RegisterServerEvent("drp-paleto:getDoorAccessSV")
AddEventHandler("drp-paleto:getDoorAccessSV", function()
    TriggerClientEvent('drp-paleto:GetDoorAccessCL', -1, globalonactionPaleto)
end)