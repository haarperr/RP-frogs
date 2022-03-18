DRP.Core.hasLoaded = false


function DRP.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("drp-base:playerSessionStarted")
                TriggerServerEvent("drp-base:playerSessionStarted")
                break
            end
        end
    end)
end
DRP.Core:Initialize()

AddEventHandler("drp-base:playerSessionStarted", function()
    while not DRP.Core.hasLoaded do
        ---- print"waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    DRP.SpawnManager:Initialize()
end)

RegisterNetEvent("drp-base:waitForExports")
AddEventHandler("drp-base:waitForExports", function()
    if not DRP.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["drp-base"] then
            TriggerEvent("drp-base:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    -- print"player has spawned ")
    if not DRP.Core.hasLoaded then
         DRP.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)


RegisterNetEvent("paycheck:client:call")
AddEventHandler("paycheck:client:call", function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("paycheck:server:send", cid)
end)

RegisterNetEvent("paycheck:collect:log:handler")
AddEventHandler("paycheck:collect:log:handler", function()
    TriggerServerEvent('paycheck:collect:log')
end)