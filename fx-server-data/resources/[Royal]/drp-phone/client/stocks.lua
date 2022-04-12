local serverstockvalues = {
  [1] = { ["name"] = "Guinea", ["value"] = 0.0, ["identifier"] = "GNE", ["icon"] = "fas fa-horse-head", ["lastchange"] = 0.00, ["amountavailable"] = 10000.0 },
  [2] = { ["name"] = "Shungite", ["value"] = 1000.0, ["identifier"] = "SHU", ["icon"] = "fas fa-caret-square-up", ["lastchange"] = 0.00, ["amountavailable"] = 100.0 },
}

clientstockamount = {
  [1] = { ["value"] = 5.00 },
  [2] = { ["value"] = 0.00 },
  [3] = { ["value"] = 0.00 },
  [4] = { ["value"] = 0.00 },
  [5] = { ["value"] = 0.00 },
  [6] = { ["value"] = 0.00 },
}


RegisterNetEvent("Crypto:GiveGNE")
AddEventHandler("Crypto:GiveGNE", function(amount)
  clientstockamount[1]["value"] = clientstockamount[1]["value"] + amount
  Citizen.Trace("Retreived crypto")
  updateServerClientStocks()
  TriggerEvent("chatMessage","CryptoRecieved", 5, "GNE has been added to your wallet")
end)
RegisterNetEvent("Crypto:RemoveGNE")
AddEventHandler("Crypto:RemoveGNE", function(amount)
  clientstockamount[1]["value"] = clientstockamount[1]["value"] - amount
  updateServerClientStocks()
  Citizen.Trace("Lost crypto")
  TriggerEvent("chatMessage","CryptoRecieved", 5, "GNE has been removed from your wallet")
end)
--[[
RegisterCommand("omglol", function(source, args)
TriggerServerEvent('stocksreplace', json.encode(clientstockamount))
end)
--]]

RegisterNetEvent('stocks:payupdate');
AddEventHandler('stocks:payupdate', function()
  local payamount = 0
  for i = 2, #clientstockamount do
    local mystock = clientstockamount[i]["value"]
    if mystock > 0 then
      local currentlyPaying = serverstockvalues[i]["value"] / 200
      local totalpay = (currentlyPaying * mystock) / 100
      local mypayout = math.ceil(totalpay * 100)
      local haslost = 0.0
      payamount = payamount + mypayout
      if serverstockvalues[i]["value"] < 1000.0 then
        if mystock > 3 then
          if math.random(100) > 90 then
            local stockloss =  math.ceil(((mystock / 100) / 3) * 100) / 100
            clientstockamount[i]["value"] = mystock - stockloss
            TriggerServerEvent("stocks:bleedstocks",i,stockloss)
            haslost = haslost - stockloss
          end
        end
        if mystock > 20 then
          if math.random(100) > 90 then
            local stockloss =  math.ceil(((mystock / 100) / 3) * 100) / 100
            clientstockamount[i]["value"] = mystock - stockloss
            TriggerServerEvent("stocks:bleedstocks",i,stockloss)
            haslost = haslost - stockloss
          end
        end
      end
      if haslost < 0 then
        TriggerEvent("chatMessagess", "EMAIL ", 8, "Interest pay out of $" .. mypayout .. " for stock ID " .. serverstockvalues[i]["identifier"] .. ". The company also cut your shares by " .. haslost .. " to increase profits. ")
      else
        TriggerEvent("chatMessagess", "EMAIL ", 8, "Interest pay out of $" .. mypayout .. " for stock ID " .. serverstockvalues[i]["identifier"])
      end
    end
  end
  payamount = math.floor(payamount)
  if payamount > 0 then
    TriggerServerEvent("server:givepayJob", "Stock Payment", payamount)
  end
end)

RegisterNetEvent('stocks:servervalueupdate');
AddEventHandler('stocks:servervalueupdate', function(sentvalues)
    serverstockvalues = sentvalues
end)

RegisterNetEvent('stocks:clientvalueupdate');
AddEventHandler('stocks:clientvalueupdate', function(sentvalues)
    clientstockamount = sentvalues

end)

RegisterNetEvent('stocks:jailed');
AddEventHandler('stocks:jailed', function()
    for i=2,#clientstockamount do
      if clientstockamount[i]["value"] > 1.0 then
        local loss = math.floor((clientstockamount[i]["value"] / 20) * 100) / 100
        TriggerServerEvent("stocks:reducestock",i,loss)
      end
    end
end)

RegisterNetEvent('stocks:newstocks');
AddEventHandler('stocks:newstocks', function(amountBuying,identifier)
  clientstockamount[identifier]["value"] = clientstockamount[identifier]["value"] + amountBuying
  updateServerClientStocks()
end)

RegisterNetEvent('stocks:losestocks');
AddEventHandler('stocks:losestocks', function(amountBuying,identifier)
  clientstockamount[identifier] = clientstockamount[identifier] - amountBuying
  updateServerClientStocks()
end)

function updateServerClientStocks()
  TriggerServerEvent("stocks:clientvalueupdate",clientstockamount)
end




RegisterNetEvent('gne:check');
AddEventHandler('gne:check', function(costs,functionCall,server)

  if clientstockamount[1]["value"] >= costs then
    clientstockamount[1]["value"] = clientstockamount[1]["value"] - costs
    updateServerClientStocks()
    if server then
      TriggerServerEvent(functionCall)
    else
      TriggerEvent(functionCall)
    end    
  else
    TriggerEvent("chatMessagess", "EMAIL ", 8, "You need " .. costs .."  GNE!")
  end

end)

RegisterNetEvent('shungite:check');
AddEventHandler('shungite:check', function(costs,functionCall,server)

  if clientstockamount[2]["value"] >= costs then
    clientstockamount[2]["value"] = clientstockamount[1]["value"] - costs
    updateServerClientStocks()
    if server then
      TriggerServerEvent(functionCall)
    else
      TriggerEvent(functionCall)
    end    
  else
    TriggerEvent("chatMessagess", "EMAIL ", 8, "You need " .. costs .."  shungite!")
  end

end)






RegisterNetEvent('stocks:buyitem');
AddEventHandler('stocks:buyitem', function(typeSent)
  local costs = 15

  if typeSent == "weapon" then
    costs = 5
  end

  if typeSent == "bigweapon" then
    costs = 25
  end

  if typeSent == "crack" then
    costs = 10
  end 

  if clientstockamount[1]["value"] >= costs then
    clientstockamount[1]["value"] = clientstockamount[1]["value"] - costs
    updateServerClientStocks()
    TriggerEvent("stocks:timedEvent",typeSent)   
  else
    TriggerEvent("chatMessagess", "EMAIL ", 8, "You need 25 pixerium for big guns or 5 for small, come back when you have it, Pepega.")
  end

end)

RegisterNUICallback('stocksTradeToPlayer', function(data, cb)
  local index = 0
  local amount = 0
  local sending = math.ceil(tonumber(data.amount) * 100) / 100
  for i=1,#serverstockvalues do
    if data.identifier == serverstockvalues[i]["identifier"] then
      index = i
      amount = clientstockamount[i]["value"]
    end
  end
  if index == 0 then
    -- not enough to do the trade
    TriggerEvent("DoShortHudText","Incorrect Identifier.",2)
    TriggerEvent("stocks:refreshstocks")
    return
  end
  if amount < tonumber(data.amount) then
    -- not enough to do the trade
    TriggerEvent("DoShortHudText","Not enough crypto.",2)
    TriggerEvent("stocks:refreshstocks")
    return
  end
  clientstockamount[index]["value"] = clientstockamount[index]["value"] - sending
  Citizen.Trace("removing " .. sending .. " shares from index " .. index )
  TriggerServerEvent('phone:stockTradeAttempt', index, data.playerid, sending )
  Citizen.Wait(500)
  TriggerEvent("stocks:refreshstocks")

end)

RegisterNUICallback('stocksTradeToPlayer2', function(data, cb)
  local index = 0
  local amount = 0
  local sending = math.ceil(tonumber(data.amount) * 100) / 100
  for i=1,#serverstockvalues do
    if data.identifier == serverstockvalues[i]["identifier"] then
      index = i
      amount = clientstockamount[i]["value"]
    end
  end
  if index == 0 then
    -- not enough to do the trade
    TriggerEvent("DoShortHudText","Incorrect Identifier.",2)
    TriggerEvent("stocks:refreshstocks")
    return
  end
  if amount < tonumber(data.amount) then
    -- not enough to do the trade
    TriggerEvent("DoShortHudText","Not enough crypto.",2)
    TriggerEvent("stocks:refreshstocks")
    return
  end
  clientstockamount[index]["value"] = clientstockamount[index]["value"] - sending
  Citizen.Trace("removing " .. sending .. " shares from index " .. index )
  TriggerServerEvent('phone:stockTradeAttempt', index, data.playerid, sending )
  Citizen.Wait(500)
  TriggerEvent("stocks:refreshstocks")
end)


RegisterNetEvent('stocks:refreshstocks');
AddEventHandler('stocks:refreshstocks', function()
    for i = 1, #serverstockvalues do
      local colortype = 1
      if i == 1 or i == 3 or i == 5 then
        colortype = 2
      end
      local lastchangestock = "<div class='change stockred'>▼" .. serverstockvalues[i]["lastchange"] .. "</div>"
      if serverstockvalues[i]["lastchange"] > -0.01 then
        lastchangestock = "<div class='change stockgreen'>▲" .. serverstockvalues[i]["lastchange"] .. "</div>"
      end 

      SendNUIMessage({
        openSection = "addstock",
        namesent = serverstockvalues[i]["name"],
        identifier = serverstockvalues[i]["identifier"],
        icon = serverstockvalues[i]["icon"],
        lastchange = lastchangestock,
        valuesent = serverstockvalues[i]["value"],
        amountsold = serverstockvalues[i]["amountsold"],
        clientstock = clientstockamount[i]["value"],
        colorsent = colortype,
        available = serverstockvalues[i]["amountavailable"]
      })
    end
    sendStocksToPhone(true);
end)

function sendStocksToPhone(isRefresh)
  local stocksData = {}
  for i = 1, #serverstockvalues do
    table.insert(stocksData, {
      identifier = serverstockvalues[i]["identifier"],
      name = serverstockvalues[i]["name"],
      icon = serverstockvalues[i]["icon"],
      value = serverstockvalues[i]["value"],
      change = serverstockvalues[i]["lastchange"],
      available = serverstockvalues[i]["amountavailable"],
      clientStockValue = clientstockamount[i]["value"]
    })
  end

  SendNUIMessage({ openSection = "addStocks", stocksData = stocksData})
  if isRefresh then
    updateServerClientStocks()
  end
end

RegisterNUICallback('btnStocks', function()
  TriggerServerEvent('stocks:retrieve')
  sendStocksToPhone();
  
    for i = 1, #serverstockvalues do
      local colortype = 1
      if i == 1 or i == 3 or i == 5 then
        colortype = 2
      end
      local lastchangestock = "<div class='change stockred'>▼" .. serverstockvalues[i]["lastchange"] .. "</div>"
      if serverstockvalues[i]["lastchange"] > -0.01 then
        lastchangestock = "<div class='change stockgreen'>▲" .. serverstockvalues[i]["lastchange"] .. "</div>"
      end 

      SendNUIMessage({
        openSection = "addstock",
        namesent = serverstockvalues[i]["name"],
        identifier = serverstockvalues[i]["identifier"],
        icon = serverstockvalues[i]["icon"],
        lastchange = lastchangestock,
        valuesent = serverstockvalues[i]["value"],
        amountsold = serverstockvalues[i]["amountsold"],
        clientStockValue = clientstockamount[i]["value"],
        colorsent = colortype,
        available = serverstockvalues[i]["amountavailable"]
      })
    end
end)

function requestUpdate()
  TriggerServerEvent("stocks:retrieve")
end
