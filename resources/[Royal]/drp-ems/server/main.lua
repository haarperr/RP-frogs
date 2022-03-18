RegisterServerEvent('admin:revivePlayer')
AddEventHandler('admin:revivePlayer', function(target)
	if target ~= nil then
		TriggerClientEvent('admin:revivePlayerClient', target)
		TriggerClientEvent('drp-hospital:client:RemoveBleed', target) 
        TriggerClientEvent('drp-hospital:client:ResetLimbs', target)
	end
end)

RegisterServerEvent('drp-ems:heal')
AddEventHandler('drp-ems:heal', function(target)
	TriggerClientEvent('drp-ems:heal', target) 	
end)

RegisterServerEvent('drp-ems:heal2')
AddEventHandler('drp-ems:heal2', function(target)
	TriggerClientEvent('drp-ems:big', target)
end)