is_corner_selling = false
currently_selling = nil
local timeout = false
drugs_wanted = {
    "weedq",
    "oxy",
    "methlabproduct"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
        if currently_selected_drug_location ~= nil and is_corner_selling then
            if ped ~= 0 and not IsPedDeadOrDying(ped) and not IsPedInAnyVehicle(ped) then 
                local pedType = GetPedType(ped)
                if ped ~= recent_ped and (IsPedAPlayer(ped) == false and pedType ~= 28) then
                    if ReworkedHasItems() then
                        exports['drp-textui']:showInteraction("[E] Attempt Sale")
                    end

                    if IsControlJustPressed(1, 86) and ReworkedHasItems() and timeout == false then
                        sell_items()
                        exports['drp-textui']:hideInteraction()
                        timeout = true
                        Citizen.Wait(25000)
                        timeout = false
                    elseif not ReworkedHasItems() then
                        exports['drp-textui']:showInteraction("No Drugs")
                        Citizen.Wait(2000)
                        exports['drp-textui']:hideInteraction()
                    end
                else
                    Citizen.Wait(500)
                end
            end
        end
	end
end)


Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
        if currently_selected_drug_location ~= nil and is_corner_selling then
            if not IsPedInAnyVehicle(playerPed) or not IsPedDeadOrDying(playerPed) then
                ped = GetPedInFront()

                if ped == 0 then
                    exports['drp-textui']:hideInteraction()
                end
            else
                Citizen.Wait(1000)
            end
        end

        Citizen.Wait(1000)
    end
end)


function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

function ReworkedHasItems()
    for i = 1, #drugs_wanted do
        local amount = exports["drp-inventory"]:getAmountOfItem(drugs_wanted[i])
        if amount ~= 0 then
            return true, amount
        end
    end
    return false, 0
end

function HasItems(amount)
    for i = 1, #drugs_wanted do
        if exports['drp-inventory']:hasEnoughOfItem(drugs_wanted[i], amount, false, true) then
            currently_selling = drugs_wanted[i]
            return true, amount
        else
            if exports['drp-inventory']:hasEnoughOfItem(drugs_wanted[i], 1, false, true) then
                currently_selling = drugs_wanted[i]
                return true, 1
            end
        end
    return false, 0
    end    
end

function sell_items()

    local plycoords = GetEntityCoords(PlayerPedId())
    TaskTurnPedToFaceCoord(ped, plycoords.x, plycoords.y, plycoords.z, 1250)
    Citizen.Wait(1250)
    SetEntityAsMissionEntity(ped)
    TaskStandStill(ped, 9.0)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), -1)

    if math.random(1, 100) >= 15 then
        local plyPos = GetEntityCoords(PlayerPedId(),  true)
        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        local player = PlayerPedId()

        if not IsPedDeadOrDying(recent_ped) then
            TriggerEvent('civilian:alertPolice', 8.0, 'drugsale', 0)
        end
    end

    local finished = exports['drp-taskbar']:taskBar(7500, "Offering Products")
    local plycoords = GetEntityCoords(PlayerPedId())
    recent_ped = ped
    if (finished == 100) then
        if math.random(1, 100) >= 55 then 
            local sellableItems = {
                [1] = {name = 'oxy', amount = math.random(1,4), price=math.random(100,140)},
                [2] = {name = 'methlabproduct', amount = math.random(1,3), price=math.random(315, 575)},
                [3] = {name = 'weedq', amount = math.random(1,2), price=math.random(350, 575)}, 
            }
            local pog = false
            -- randomize the sellable items
            for i = 1, #sellableItems do
                local randomIndex = math.random(#sellableItems)
                sellableItems[i] = sellableItems[randomIndex]
                
                if exports["drp-inventory"]:hasEnoughOfItem(sellableItems[i].name,sellableItems[i].amount,false) then
                    giveAnim(ped)
                    giveAnim(PlayerPedId())
                    local finished2 = exports['drp-taskbar']:taskBar(2500, "Selling Products")
                    if (finished == 100) then
                        TriggerEvent("inventory:removeItem",sellableItems[i].name,sellableItems[i].amount)
                        TriggerServerEvent('mission:completed', sellableItems[i].price * sellableItems[i].amount)
                        pog = true
                        break
                    end
                    pog = false
                    break
                else
                    TriggerEvent("DoLongHudText", "You dont got what I want!", 2)
                end
                SetPedAsNoLongerNeeded(recent_ped)
                TaskWanderStandard(recent_ped, 10.0, 10)
            end
        else
            SetPedAsNoLongerNeeded(recent_ped)
            TaskWanderStandard(recent_ped, 10.0, 10)
            TriggerEvent("DoLongHudText", "I am not interested!", 2)
        end
        local plyPos = GetEntityCoords(PlayerPedId(),  true)
        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
		local player = PlayerPedId()

        if not IsPedDeadOrDying(recent_ped) then
		    TriggerEvent('civilian:alertPolice', 8.0, 'drugsale', 0)
		end
    end
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 



function giveAnim(NPC)
    if ( DoesEntityExist( NPC ) and not IsEntityDead( NPC ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( NPC, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        Wait(1000)
        loadAnimDict( "mp_safehouselost@" )
        TaskPlayAnim( NPC, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

RegisterNetEvent("drp-selling:status", function()
    if currently_selected_drug_location ~= nil then
        is_corner_selling = not is_corner_selling
        TriggerEvent("DoLongHudText", ('Corner selling has been %s!'):format(is_corner_selling and 'Enabled' or 'Disabled'), 1) 

        if not is_corner_selling then
            exports['drp-textui']:hideInteraction()
        end
    end
end)

exports("NearCorner", function(pType)
    if pType == "Distance" then
        if currently_selected_drug_location ~= nil then
            return true
        else
            return false
        end
    end
end)

RegisterCommand('cornertest', function()

		TriggerEvent('drp-selling:status')

end)
