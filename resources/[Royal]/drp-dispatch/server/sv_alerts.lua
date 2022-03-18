RegisterServerEvent("drp-dispatch:teenA")
AddEventHandler("drp-dispatch:teenA",function(targetCoords)
    TriggerClientEvent('drp-dispatch:policealertA', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:teenB")
AddEventHandler("drp-dispatch:teenB",function(targetCoords)
    TriggerClientEvent('drp-dispatch:policealertB', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:teenpanic")
AddEventHandler("drp-dispatch:teenpanic",function(targetCoords)
    TriggerClientEvent('drp-dispatch:panic', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:empanic")
AddEventHandler("drp-dispatch:empanic",function(targetCoords)
    TriggerClientEvent('drp-dispatch:epanic', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:gaexplosion")
AddEventHandler("drp-dispatch:gaexplosion",function(targetCoords)
    TriggerClientEvent('drp-dispatch:gexplosion', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:fourA")
AddEventHandler("drp-dispatch:fourA",function(targetCoords)
    TriggerClientEvent('drp-dispatch:tenForteenA', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:fourB")
AddEventHandler("drp-dispatch:fourB",function(targetCoords)
    TriggerClientEvent('drp-dispatch:tenForteenB', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:downperson")
AddEventHandler("drp-dispatch:downperson",function(targetCoords)
    TriggerClientEvent('drp-dispatch:downalert', -1, targetCoords)
	return
end)

-- RegisterServerEvent("drp-dispatch:assistancen")
-- AddEventHandler("drp-dispatch:assistancen",function(targetCoords)
--     TriggerClientEvent('drp-dispatch:assistance', -1, targetCoords)
-- 	return
-- end)


RegisterServerEvent("drp-dispatch:sveh")
AddEventHandler("drp-dispatch:sveh",function(targetCoords)
    TriggerClientEvent('drp-dispatch:vehiclesteal', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:svCarBoost")
AddEventHandler("drp-dispatch:svCarBoost", function(targetCoords)
    TriggerClientEvent("drp-dispatch:carBoostBlip", -1, targetCoords)
end)

RegisterServerEvent("drp-dispatch:svCarBoostTracker")
AddEventHandler("drp-dispatch:svCarBoostTracker", function(targetCoords)
    TriggerClientEvent("drp-dispatch:carBoostBlipTracker", -1, targetCoords)
end)

RegisterServerEvent("drp-dispatch:shoot")
AddEventHandler("drp-dispatch:shoot",function(targetCoords)
    TriggerClientEvent('drp-dispatch:gunShot', -1, targetCoords)
	return
end)

-- RegisterServerEvent("drp-dispatch:figher")
-- AddEventHandler("drp-dispatch:figher",function(targetCoords)
--     TriggerClientEvent('vrp-outlawalert:combatInProgress', -1, targetCoords)
-- 	return
-- end)

RegisterServerEvent("drp-dispatch:storerob")
AddEventHandler("drp-dispatch:storerob",function(targetCoords)
    TriggerClientEvent('drp-dispatch:storerobbery', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:houserob")
AddEventHandler("drp-dispatch:houserob",function(targetCoords)
    TriggerClientEvent('drp-dispatch:houserobbery2', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:tbank")
AddEventHandler("drp-dispatch:tbank",function(targetCoords)
    TriggerClientEvent('drp-dispatch:banktruck', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:robjew")
AddEventHandler("drp-dispatch:robjew",function()
    TriggerClientEvent('drp-dispatch:jewelrobbey', -1)
	return
end)

-- RegisterServerEvent("drp-dispatch:bjail")
-- AddEventHandler("drp-dispatch:bjail",function()
--     TriggerClientEvent('drp-dispatch:jewelrobbey', -1)
-- 	return
-- end)


RegisterServerEvent("drp-dispatch:bankrobberyfuck")
AddEventHandler("drp-dispatch:bankrobberyfuck",function(targetCoords)
    TriggerClientEvent('drp-dispatch:bankrob', -1, targetCoords)
	return
end)

RegisterServerEvent("drp-dispatch:drugg23")
AddEventHandler("drp-dispatch:drugg23",function(targetCoords)
    TriggerClientEvent('drp-dispatch:drugdealreport', -1, targetCoords)
	return
end)


RegisterServerEvent("drp-dispatch:bobbycat")
AddEventHandler("drp-dispatch:bobbycat",function(targetCoords)
    TriggerClientEvent('drp-dispatch:bobcatreport', -1, targetCoords)
	return
end)



RegisterServerEvent("drp-dispatch:vaulttt")
AddEventHandler("drp-dispatch:vaulttt",function(targetCoords)
    TriggerClientEvent('drp-dispatch:vaultreport', -1, targetCoords)
	return
end)