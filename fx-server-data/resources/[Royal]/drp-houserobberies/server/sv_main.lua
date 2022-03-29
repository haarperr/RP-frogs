RPC.register('drp-houserobbery:enter_property', function(police)
    TriggerClientEvent('client:enterhouse', police)
end)