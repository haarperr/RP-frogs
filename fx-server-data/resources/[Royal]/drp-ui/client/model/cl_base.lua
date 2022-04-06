-- RegisterNetEvent("drp-ui:client:InitUI")
-- AddEventHandler("drp-ui:client:InitUI", function()
--     print("[drp-ui] Initalize Hud")
--     local toggleData = {
--         health = GetResourceKvpString('healthshow'),
--         armor = GetResourceKvpString('armorshow'),
--         hunger = GetResourceKvpString('hungershow'),
--         thirst = GetResourceKvpString('thirstshow'),
--         stamina = GetResourceKvpString('staminashow'),
--         oxygen = GetResourceKvpString('oxyshow'),
--         stress = GetResourceKvpString('stressshow'),
--         voice = GetResourceKvpString('voiceshow'),
--     }

--     local colorData = {
--         health = GetResourceKvpString('#health'),
--         armor = GetResourceKvpString('#armor'),
--         hunger = GetResourceKvpString('#hunger'),
--         thirst = GetResourceKvpString('#thirst'),
--         stamina = GetResourceKvpString('#stamina'),
--         oxygen = GetResourceKvpString('#oxygen'),
--         stress = GetResourceKvpString('#stress'),
--         voice = GetResourceKvpString('#voice'),
--     }

--     Citizen.Wait(500)
--     SendNUIMessage({
--         action = "initialize",
--         toggledata = toggleData,
--         colordata = colorData,
--     })
    
-- end)

function SetUIFocus(hasKeyboard, hasMouse)
    SetNuiFocus(hasKeyboard, hasMouse)
end
    
exports('SetUIFocus', SetUIFocus)

RegisterNUICallback("drp-ui:closeApp", function(data, cb)
    SetNuiFocus(false, false)
    SetUIFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
end)

RegisterNUICallback("drp-ui:applicationClosed", function(data, cb)
    TriggerEvent("drp-ui:application-closed", data.name, data)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    SetNuiFocus(false, false)
end)

-- SMALL MAP
-- RegisterCommand("drp-ui:small-map", function()
--     SetRadarBigmapEnabled(false, false)
-- end, false)

-- RegisterCommand("testbugui", function()
--     SetNuiFocus(true, true)
--     SetUIFocus(true, true)
-- end)

RegisterCommand("clearui", function()
    exports["drp-textui"]:showInteraction("Clearing UI .")
    Wait(1000)
    exports["drp-textui"]:showInteraction("Clearing UI ..")
    Wait(1000)
    exports["drp-textui"]:showInteraction("Clearing UI ...")
    Wait(1000)
    SetNuiFocus(false, false)
    SetUIFocus(false, false)
    exports["drp-textui"]:showInteraction("UI Cleared !", "success")
    Wait(1000)
    exports["drp-textui"]:hideInteraction()
    exports["drp-textui"]:hideInteraction("success")
end)

RegisterCommand("clearanim", function()
    exports["drp-textui"]:showInteraction("Stopping Animation .")
    Wait(1000)
    exports["drp-textui"]:showInteraction("Stopping Animation ..")
    Wait(1000)
    exports["drp-textui"]:showInteraction("Stopping Animation ...")
    Wait(1000)
    ClearPedTasks(GetPlayerPed(-1))
    ClearPedTasks(PlayerPedId())
    ClearPedProp(PlayerPedId(), 0)
    ClearAllPedProps(GetPlayerPed(-1))
    exports["drp-textui"]:showInteraction("Animation Cleared !", "success")
    Wait(1000)
    exports["drp-textui"]:hideInteraction()
    exports["drp-textui"]:hideInteraction("success")
end)
