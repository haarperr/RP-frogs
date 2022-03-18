RegisterServerEvent("drp-base:sv:player_control_set")
AddEventHandler("drp-base:sv:player_control_set", function(controlsTable)
    local src = source
    DRP.DB:UpdateControls(src, controlsTable, function(UpdateControls, err)
            if UpdateControls then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("drp-base:sv:player_controls")
AddEventHandler("drp-base:sv:player_controls", function()
    local src = source
    DRP.DB:GetControls(src, function(loadedControls, err)
        if loadedControls ~= nil then 
            TriggerClientEvent("drp-base:cl:player_control", src, loadedControls) 
        else 
            TriggerClientEvent("drp-base:cl:player_control",src, nil)
        end
    end)
end)
