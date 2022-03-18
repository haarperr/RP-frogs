RegisterServerEvent("drp-base:sv:player_settings_set")
AddEventHandler("drp-base:sv:player_settings_set", function(settingsTable)
    local src = source
    DRP.DB:UpdateSettings(src, settingsTable, function(UpdateSettings, err)
            if UpdateSettings then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("drp-base:sv:player_settings")
AddEventHandler("drp-base:sv:player_settings", function()
    local src = source
    DRP.DB:GetSettings(src, function(loadedSettings, err)
        if loadedSettings ~= nil then 
            TriggerClientEvent("drp-base:cl:player_settings", src, loadedSettings) 
        else 
            TriggerClientEvent("drp-base:cl:player_settings",src, nil) 
        end
    end)
end)
