AddEventHandler("drp-casino:wheel:toggleEnable", function()
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino" } })
  if not jobAccess then
    TriggerEvent("DoLHudText", 2, "casino-cannot-do-that", "You cannot do that")
    return
  end
  RPC.execute("drp-casino:wheel:toggleEnabled")
end)

AddEventHandler("drp-casino:wheel:spinWheel", function()
  if not hasMembership(false) then
    TriggerEvent("DoLHudText", 2, "casino-must-membership", "You must have a membership")
    return
  end
  local info = (exports["drp-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
  RPC.execute("drp-casino:wheel:spinWheel", false, json.decode(info.information).state_id)
end)

AddEventHandler("drp-casino:wheel:spinWheelTurbo", function()
  if not hasMembership(false) then
    TriggerEvent("DoLHudText", 2, "casino-must-membership", "You must have a membership")
    return
  end
  local info = (exports["drp-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
  RPC.execute("drp-casino:wheel:spinWheel", "turbo", json.decode(info.information).state_id)
end)

AddEventHandler("drp-casino:wheel:spinWheelOmega", function()
  if not hasMembership(false) then
    TriggerEvent("DoLHudText", 2, "casino-must-membership", "You must have a membership")
    return
  end
  local info = (exports["drp-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
  RPC.execute("drp-casino:wheel:spinWheel", "omega", json.decode(info.information).state_id)
end)

AddEventHandler("drp-casino:wheel:pickupWheelCash", function()
  RPC.execute("drp-casino:wheel:pickupWheelCash")
end)
