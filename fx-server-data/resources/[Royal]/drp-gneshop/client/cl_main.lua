
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
                header = "Purchase Harness",
                    txt = "30 GNE",
                    params = {
                        event = "gne:attemptBuyHarness"
                }
            },
            {
                id = 5,
                header = "Purchase Fake Plates",
                    txt = "45 GNE",
                    params = {
                        event = "gne:attemptBuyfakeplates"
                }
            },
            {
                id = 6,
                header = "Purchase Brake Upgrade",
                    txt = "75 GNE",
                    params = {
                        event = "gne:attemptBuybrakes"
                }
            },
            {
                id = 7,
                header = "Purchase Suspention Upgrade",
                    txt = "75 GNE",
                    params = {
                        event = "gne:attemptBuySuspention"
                }
            },
            {
                id = 8,
                header = "Purchase Transmission Upgrade",
                    txt = "75 GNE",
                    params = {
                        event = "gne:attemptBuyTransmission"
                }
            },
            {
                id = 9,
                header = "Purchase Engine Upgrade",
                    txt = "125 GNE",
                    params = {
                        event = "gne:attemptBuyEngine"
                }
            },
            {
                id = 10,
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
    TriggerEvent("gne:check", price, "gne:buyadvrepairkit", false)
end)

RegisterNetEvent("gne:buyadvrepairkit")
AddEventHandler("gne:buyadvrepairkit", function()
    TriggerEvent("player:receiveItem", "advrepairkit", 1)
end)


RegisterNetEvent('gne:attemptBuyNOS')
AddEventHandler('gne:attemptBuyNOS', function()
    local price = 15
    TriggerEvent("gne:check", price, "gne:buynos", false)
end)

RegisterNetEvent("gne:buynos")
AddEventHandler("gne:buynos", function()
    TriggerEvent("player:receiveItem", "nitrous", 1)
end)



RegisterNetEvent('gne:attemptBuyHarness')
AddEventHandler('gne:attemptBuyHarness', function()
    local price = 30
    TriggerEvent("gne:check", price, "gne:buyHarness", false)
end)

RegisterNetEvent("gne:buyHarness")
AddEventHandler("gne:buyHarness", function()
    TriggerEvent("player:receiveItem", "harness", 1)
end)

RegisterNetEvent('gne:attemptBuyfakeplates')
AddEventHandler('gne:attemptBuyfakeplates', function()
    local price = 45
    TriggerEvent("gne:check", price, "gne:buyfakeplates", false)
end)

RegisterNetEvent("gne:buyfakeplates")
AddEventHandler("gne:buyfakeplates", function()
    TriggerEvent("player:receiveItem", "fakeplate", 1)
end)


RegisterNetEvent('gne:attemptBuybrakes')
AddEventHandler('gne:attemptBuybrakes', function()
    local price = 75
    TriggerEvent("gne:check", price, "gne:buybrakes", false)
end)

RegisterNetEvent("gne:buybrakes")
AddEventHandler("gne:buybrakes", function()
    TriggerEvent("player:receiveItem", "brakingkit", 1)
end)


RegisterNetEvent('gne:attemptBuySuspention')
AddEventHandler('gne:attemptBuySuspention', function()
    local price = 75
    TriggerEvent("gne:check", price, "gne:buySuspention", false)
end)

RegisterNetEvent("gne:buySuspention")
AddEventHandler("gne:buySuspention", function()
    TriggerEvent("player:receiveItem", "suspensionkit", 1)
end)


RegisterNetEvent('gne:attemptBuyTransmission')
AddEventHandler('gne:attemptBuyTransmission', function()
    local price = 75
    TriggerEvent("gne:check", price, "gne:buyTransmission", false)
end)

RegisterNetEvent("gne:buyTransmission")
AddEventHandler("gne:buyTransmission", function()
    TriggerEvent("player:receiveItem", "transmissionkit", 1)
end)


RegisterNetEvent('gne:attemptBuyEngine')
AddEventHandler('gne:attemptBuyEngine', function()
    local price = 125
    TriggerEvent("gne:check", price, "gne:buyEngine", false)
end)

RegisterNetEvent("gne:buyEngine")
AddEventHandler("gne:buyEngine", function()
    TriggerEvent("player:receiveItem", "enginekit", 1)
end)


RegisterNetEvent('gne:attemptBuyTurbo')
AddEventHandler('gne:attemptBuyTurbo', function()
    local price = 125
    TriggerEvent("gne:check", price, "gne:buyTurbo", false)
end)

RegisterNetEvent("gne:buyTurbo")
AddEventHandler("gne:buyTurbo", function()
    TriggerEvent("player:receiveItem", "turbokit", 1)
end)



