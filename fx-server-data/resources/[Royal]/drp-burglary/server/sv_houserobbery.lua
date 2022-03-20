local robbableItems = {
    [1] = {chance = 3, id = 'rollcash', quantity = math.random(2, 5)}, -- really common
    [2] = {chance = 5, id = 'plastic', quantity = math.random(1, 8)}, -- rare
    [3] = {chance = 5, id = 'aluminium', quantity = math.random(1, 8)}, -- really common
    [4] = {chance = 5, id = 'copper', quantity = math.random(1,8)}, -- rare
    [5] = {chance = 5, id = 'electronics', quantity = math.random(1,6)}, -- rare
    [6] = {chance = 5, id = 'rubber', quantity = math.random(1,8)}, -- rare
    [7] = {chance = 5, id = 'scrapmetal', quantity = math.random(1,8)}, -- rare
    [8] = {chance = 5, id = 'steel', quantity = math.random(1,8)}, -- rare
    [9] = {chance = 5, id = 'rolexwatch', quantity = math.random(3, 5)},
    [10] = {chance = 4, id = 'stolen2ctchain', quantity = math.random(1, 2)},
    [11] = {chance = 5, id = 'stolen5ctchain', quantity = math.random(1)},
    [12] = {chance = 5, id = 'stolen8ctchain', quantity = math.random(1)},
    [13] = {chance = 5, id = 'stolengameboy', quantity = math.random(1)},
    [14] = {chance = 5, id = 'stolenoakleys', quantity = math.random(1)},
    [15] = {chance = 5, id = 'stolenpsp', quantity = math.random(1)},
    [16] = {chance = 5, id = 'stolencasiowatch', quantity = math.random(1)},
    [17] = {chance = 10, id = 'safecrackingkit', quantity = math.random(1)},
    [18] = {chance = 10, id = 'rolexwatch', quantity = math.random(1)},
    [19] = {chance = 11, id = 'steel', quantity = 1},
    [20] = {chance = 10, id = 'lockpick', quantity = math.random(1)},
}

RegisterServerEvent('houseRobberies:removeLockpick')
AddEventHandler('houseRobberies:removeLockpick', function()
    local src = tonumber(source)
    TriggerClientEvent('inventory:removeItem', src, 'advlockpick', 1)
    TriggerClientEvent('DoLongHudText', src, 'The lockpick bent out of shape!', 2)
end)

RegisterServerEvent('houseRobberies:giveMoney')
AddEventHandler('houseRobberies:giveMoney', function()
    local src = tonumber(source)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(0, 150)
    user:addMoney(cash)
    TriggerClientEvent('DoLongHudText', src, 'You found $'..cash, 1)
end)

RegisterServerEvent('houseRobberies:searchItem')
AddEventHandler('houseRobberies:searchItem', function()
 local src = tonumber(source)
 local cash = math.random(0, 150)
 local item = {}
 local gotID = {}
 local mathfunc = math.random(130)
 local user = exports["drp-base"]:getModule("Player"):GetUser(src)

 for i=1, math.random(1, 2) do
  item = robbableItems[math.random(1, #robbableItems)]
  if math.random(1, 14) >= item.chance then
    if tonumber(item.id) == 0 and not gotID[item.id] then
        gotID[item.id] = true
        user:addMoney(cash)
        TriggerClientEvent('DoLongHudText', src, 'You found $'.. cash, 1)
      elseif not gotID[item.id] then
        gotID[item.id] = true
        if mathfunc < 25 then
          TriggerEvent("player:receiveItem","registerkey",1)
        end
        if mathfunc < 40 then
          TriggerEvent("player:receiveItem","oxykeycard",1)
        end
        TriggerClientEvent('player:receiveItem', src, item.id, item.quantity)
        TriggerClientEvent('DoLongHudText', src, 'Item Added!', 1)
      end
    else
      TriggerClientEvent('DoLongHudText', src, 'You found nothing!', 2)
    end
  end
end)
