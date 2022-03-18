RegisterUICallback("drp-ui:casino:updateEvent", function(data, cb)
  data.type = "edit-event"
  local success, result = RPC.execute("drp-casino:sportsbook:updateData", data)
  cb({ data = result, meta = { ok = success, message = result }})
end)

RegisterUICallback("drp-ui:casino:sportsBookPlaceBet", function(data, cb)
  data.type = "place-bet"
  local success, result = RPC.execute("drp-casino:sportsbook:updateData", data)
  cb({ data = result, meta = { ok = success, message = result }})
end)

RegisterUICallback("drp-ui:casinoGetSportsBookData", function(data, cb)
  local success, result = RPC.execute("drp-casino:sportsbook:getData")
  cb({ data = result, meta = { ok = success, message = result }})
end)

RegisterUICallback("drp-ui:casino:finishEvent", function(data, cb)
  local success, result = RPC.execute("drp-casino:sportsbook:finishEvent", data)
  cb({ data = result, meta = { ok = success, message = result }})
end)
