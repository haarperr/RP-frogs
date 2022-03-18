RegisterNetEvent("drp-npcs:set:ped")
AddEventHandler("drp-npcs:set:ped", function(pNPCs)
  if type(pNPCs) == "table" then
    for _, ped in ipairs(pNPCs) do
      RegisterNPC(ped, 'drp-npcs')
      EnableNPC(ped.id)
    end
  else
    RegisterNPC(ped, 'drp-npcs')
    EnableNPC(ped.id)
  end
end)

RegisterNetEvent("drp-npcs:ped:giveStolenItems")
AddEventHandler("drp-npcs:ped:giveStolenItems", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["drp-taskbar"]:taskBar(15000, "Preparing to receive goods, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      TriggerEvent("server-inventory-open", "1", "Stolen-Goods-1")
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 2)
    end
  end
end)

RegisterNetEvent("drp-npcs:ped:exchangeRecycleMaterial")
AddEventHandler("drp-npcs:ped:exchangeRecycleMaterial", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["drp-taskbar"]:taskBar(3000, "Preparing to exchange material, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      TriggerEvent("server-inventory-open", "141", "Craft");
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 2)
    end
  end
end)

RegisterNetEvent("drp-npcs:ped:signInJob")
AddEventHandler("drp-npcs:ped:signInJob", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if #pArgs == 0 then
    local npcId = DecorGetInt(pEntity, 'NPC_ID')
    if npcId == `news_reporter` then
      TriggerServerEvent("jobssystem:jobs", "news")
    elseif npcId == `head_stripper` then
      TriggerServerEvent("jobssystem:jobs", "entertainer")
    end
  else
    TriggerServerEvent("jobssystem:jobs", "unemployed")
  end
end)

RegisterNetEvent("drp-npcs:ped:paycheckCollect")
AddEventHandler("drp-npcs:ped:paycheckCollect", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerServerEvent("server:paySlipPickup")
end)

RegisterNetEvent("drp-npcs:ped:receiptTradeIn")
AddEventHandler("drp-npcs:ped:receiptTradeIn", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local cid = exports["isPed"]:isPed("cid")
  RPC.execute("drp-inventory:tradeInReceipts", cid, accountTarget)
end)

RegisterNetEvent("drp-npcs:ped:sellStolenItems")
AddEventHandler("drp-npcs:ped:sellStolenItems", function()
  RPC.execute("drp-inventory:sellStolenItems")
end)

RegisterNetEvent("drp-npcs:ped:keeper")
AddEventHandler("drp-npcs:ped:keeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerEvent("server-inventory-open", pArgs[1], "Shop");
end)


TriggerServerEvent("drp-npcs:location:fetch")

AddEventHandler("drp-npcs:ped:weedSales", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local result, message = RPC.execute("drp-npcs:weedShopOpen")
  if not result then
    TriggerEvent("DoLongHudText", message, 2)
    return
  end
  TriggerEvent("server-inventory-open", "44", "Shop");
end)

AddEventHandler("drp-npcs:ped:licenseKeeper", function()
  RPC.execute("drp-npcs:purchaseDriversLicense")
end)

AddEventHandler("drp-npcs:ped:openDigitalDenShop", function()
  TriggerEvent("server-inventory-open", "42073", "Shop")
end)
RegisterNetEvent("drp-npcs:ped:giveidcard")
AddEventHandler("drp-npcs:ped:giveidcard", function()
  RPC.execute("drp-npcs:idcard")
end)

RegisterNetEvent("drp-npcs:ped:garbagejob")
AddEventHandler("drp-npcs:ped:garbagejob", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  RPC.execute("drp-npcs:GarbageVals")
end)


