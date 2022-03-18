local nearBuy = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("police_buy", vector3(464.53, -1012.86, 28.43), 1.6, 1.45, {
		name="police_buy",
		heading=0,
    }) 
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "police_buy" then
		local job = exports["isPed"]:isPed("myJob")
		if job == 'police' or job == 'state' or job == 'sheriff' then
            nearBuy = true
            AtPoliceBuy()
			exports['drp-textui']:showInteraction(("[E] %s"):format("Purchase Vehicle"))
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "police_buy" then
        nearBuy = false
    end
    exports['drp-textui']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearBuy do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
            local job = exports["isPed"]:isPed("myJob")
            if job == 'police' or job == 'state' or job == 'sheriff' then
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('drp-garages:openBuyMenu')
                end
            end
        end
    end)
end

RegisterNetEvent('drp-garages:openBuyMenu')
AddEventHandler('drp-garages:openBuyMenu', function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "Police Crown Vic",
			txt = "Purchase for $80000",
			params = {
				event = "drp-garages:PurchasedVic"
			}
		},
	})
end)

RegisterNetEvent('drp-garages:openBuyMenu2')
AddEventHandler('drp-garages:openBuyMenu2', function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "EMS Ambulance",
			txt = "Purchase for $80000",
			params = {
				event = "drp-garages:PurchasedAmbo"
			}
		},
	})
end)

RegisterNetEvent('drp-garages:PurchasedAmbo')
AddEventHandler('drp-garages:PurchasedAmbo', function()
    if exports["isPed"]:isPed("mycash") >= 80000 then
        TriggerServerEvent('drp-banking:removeMoney', 80000)
        TriggerEvent('drp-garages:PurchasedVeh', 'Ambulance', 'emsnspeedo', '80000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('drp-garages:PurchasedVic')
AddEventHandler('drp-garages:PurchasedVic', function()
    if exports["isPed"]:isPed("mycash") >= 80000 then
        TriggerServerEvent('drp-banking:removeMoney', 80000)
        TriggerEvent('drp-garages:PurchasedVeh', 'Police Vic', 'npolvic', '80000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
    

RegisterNetEvent('drp-garages:PurchasedVeh')
AddEventHandler('drp-garages:PurchasedVeh', function(name, veh, price)
    local ped = PlayerPedId()
    local name = name	
    local vehicle = veh
    local price = price		
    local model = veh
    local colors = table.pack(GetVehicleColours(veh))
    local extra_colors = table.pack(GetVehicleExtraColours(veh))

    local mods = {}

    for i = 0,24 do
        mods[i] = GetVehicleMod(veh,i)
    end

    FreezeEntityPosition(ped,false)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end

    local job = exports["isPed"]:isPed("myJob")
    if job == 'police' or job == 'state' or job == 'sheriff' then
        personalvehicle = CreateVehicle(model,462.81759643555,-1019.5252685547,28.100341796875,87.874015808105,true,false)
        SetEntityHeading(personalvehicle, 87.874015808105)
    elseif job == 'ems' then
        personalvehicle = CreateVehicle(model,333.1516418457,-575.947265625,28.791259765625,340.15747070312,true,false)
        SetEntityHeading(personalvehicle, 340.15747070312)
    end
        
    SetModelAsNoLongerNeeded(model)

    for i,mod in pairs(mods) do
        SetVehicleModKit(personalvehicle,0)
        SetVehicleMod(personalvehicle,i,mod)
    end

    SetVehicleOnGroundProperly(personalvehicle)

    local plate = GetVehicleNumberPlateText(personalvehicle)
    SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
    SetNetworkIdCanMigrate(id, true)
    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
    SetVehicleColours(personalvehicle,colors[1],colors[2])
    SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
    SetEntityVisible(ped,true)			
    local primarycolor = colors[1]
    local secondarycolor = colors[2]	
    local pearlescentcolor = extra_colors[1]
    local wheelcolor = extra_colors[2]
    local VehicleProps = exports['drp-base']:FetchVehProps(personalvehicle)
    local model = GetEntityModel(personalvehicle)
    local vehname = GetDisplayNameFromVehicleModel(model)
    TriggerEvent("keys:addNew",personalvehicle, plate)
    TriggerServerEvent('drp-garages:FinalizedPur', plate, name, vehicle, price, VehicleProps)
    Citizen.Wait(100)
    exports['drp-textui']:hideInteraction()
end)