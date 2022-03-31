AddEventHandler("explosionEvent", function(sender, ev)
    TriggerClientEvent('dark-vaultrob:lower:vaultdoor', sender)
end)