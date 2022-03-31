
RegisterNetEvent('gne:openshop')
AddEventHandler('gne:openshop', function()
    if exports["drp-inventory"]:hasEnoughOfItem("vpnxj", 1) then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "GNE Shop",
                txt = ""
            },
            {
                id = 2,
                header = "Purchase Advanced Repairkit",
                    txt = "7 GNE",
                    params = {
                        event = "gne:attemptBuyadvrepairkit"
                }
            },
            {
                id = 3,
                header = "Purchase NOS",
                    txt = "15 GNE",
                    params = {
                        event = "gne:attemptBuyNOS"
                }
            },
            {
                id = 4,
                header = "Purchase Fake Plates",
                    txt = "40 GNE",
                    params = {
                        event = "gne:attemptBuyfakeplates"
                }
            },
            {
                id = 5,
                header = "Purchase Brake Upgrade",
                    txt = "75 GNE",
                    params = {
                        event = "gne:attemptBuybrakes"
                }
            },
            {
                id = 6,
                header = "Purchase Suspention Upgrade",
                    txt = "75 GNE",
                    params = {
                        event = "gne:attemptBuySuspention"
                }
            },
            {
                id = 7,
                header = "Purchase Engine Upgrade",
                    txt = "125 GNE",
                    params = {
                        event = "gne:attemptBuyEngine"
                }
            },
            {
                id = 8,
                header = "Purchase Turbo Upgrade",
                    txt = "125 GNE",
                    params = {
                        event = "gne:attemptBuyTurbo"
                }
            }
        })
    else 
        TriggerEvent("DoLongHudText","You need a VPN to access the GNE Shop.", 2)
    end
end)


RegisterNetEvent('gne:attemptBuyadvrepairkit')
AddEventHandler('gne:attemptBuyadvrepairkit', function()
    local price = 7
    TriggerEvent("gne:check", "gne_buyadvrepairkit", price, false)
end)

RegisterNetEvent("gne:gne_buyadvrepairkit")
AddEventHandler("gne:gne_buyadvrepairkit", function()
    TriggerEvent("player:receiveItem", "advrepairkit", 1)
end)


RegisterNetEvent('gne:attemptBuyNOS')
AddEventHandler('gne:attemptBuyNOS', function()
    local price = 15
    TriggerEvent("gne:check", "gne_buynos", price, false)
end)

RegisterNetEvent("gne:gne_buynos")
AddEventHandler("gne:gne_buynos", function()
    TriggerEvent("player:receiveItem", "nitrous", 1)
end)


RegisterNetEvent('gne:attemptBuyfakeplates')
AddEventHandler('gne:attemptBuyfakeplates', function()
    local price = 40
    TriggerEvent("gne:check", "gne_buyfakeplates", price, false)
end)

RegisterNetEvent("gne:gne_buyfakeplates")
AddEventHandler("gne:gne_buyfakeplates", function()
    TriggerEvent("player:receiveItem", "fakeplate", 1)
end)


RegisterNetEvent('gne:attemptBuybrakes')
AddEventHandler('gne:attemptBuybrakes', function()
    local price = 75
    TriggerEvent("gne:check", "gne_buybrakes", price, false)
end)

RegisterNetEvent("gne:gne_buybrakes")
AddEventHandler("gne:gne_buybrakes", function()
    TriggerEvent("player:receiveItem", "brakingkit", 1)
end)


RegisterNetEvent('gne:attemptBuySuspention')
AddEventHandler('gne:attemptBuySuspention', function()
    local price = 75
    TriggerEvent("gne:check", "gne_buySuspention", price, false)
end)

RegisterNetEvent("gne:gne_buySuspention")
AddEventHandler("gne:gne_buySuspention", function()
    TriggerEvent("player:receiveItem", "suspensionkit", 1)
end)


RegisterNetEvent('gne:attemptBuyEngine')
AddEventHandler('gne:attemptBuyEngine', function()
    local price = 125
    TriggerEvent("gne:check", "gne_buyEngine", price, false)
end)

RegisterNetEvent("gne:gne_buyEngine")
AddEventHandler("gne:gne_buyEngine", function()
    TriggerEvent("player:receiveItem", "enginekit", 1)
end)


RegisterNetEvent('gne:attemptBuyTurbo')
AddEventHandler('gne:attemptBuyTurbo', function()
    local price = 125
    TriggerEvent("gne:check", "gne_buyTurbo", price, false)
end)

RegisterNetEvent("gne:gne_buyTurbo")
AddEventHandler("gne:gne_buyTurbo", function()
    TriggerEvent("player:receiveItem", "turbokit", 1)
end)



