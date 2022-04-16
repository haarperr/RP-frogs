local healing = false
local healing2 = false
lasthealth = GetEntityHealth(PlayerPedId())
lastarmor = GetPedArmour(PlayerPedId())
lasthealth2 = lasthealth

RegisterNetEvent("healed:minors")
AddEventHandler("healed:minors", function()

    ClearPedBloodDamage(PlayerPedId())
	TriggerEvent('drp-hospital:client:RemoveBleed')

    HealSlow()

    lasthealth = GetEntityHealth(PlayerPedId())
    lasthealth2 = lasthealth
end)

RegisterNetEvent("healed:useOxy")
AddEventHandler("healed:useOxy", function()
    ClearPedBloodDamage(PlayerPedId())
	TriggerEvent('drp-hospital:client:ResetLimbs')
	TriggerEvent('drp-hospital:client:RemoveBleed')

    HealSlow()
    lasthealth = GetEntityHealth(PlayerPedId())
    lasthealth2 = lasthealth
end)

RegisterNetEvent("healed:useFries")
AddEventHandler("healed:useFries", function()
    ClearPedBloodDamage(PlayerPedId())

    HealSuperSlow()
    lasthealth = GetEntityHealth(PlayerPedId())
    lasthealth2 = lasthealth
end)

function HealSlow()
    if not healing then
        healing = true
    else
        return
    end
    
    local count = 30
    
    while count > 0 do
        Citizen.Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1) 
    end
	healing = false
end

function HealSuperSlow()
    if not healing2 then
        healing2 = true
    else
        return
    end
    
    local count = 30
    
    while count > 0 do
        Citizen.Wait(2000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1) 
    end
	healing2 = false
end