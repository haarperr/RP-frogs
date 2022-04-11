RegisterNetEvent("drp-cluckinbell:openwarmer")
AddEventHandler("drp-cluckinbell:openwarmer", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "1", "storage-cluckin_warmer")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openstash")
AddEventHandler("drp-cluckinbell:openstash", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 3 then
        TriggerEvent("server-inventory-open", "1", "storage-cluckin-stash")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You dont have the required Rank for that!', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openfrier")
AddEventHandler("drp-cluckinbell:openfrier", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "44000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)




    