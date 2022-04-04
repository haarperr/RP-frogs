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
			header = "Normal Police Cars",
			txt = "",
			params = {
				event = "drp-garages:open:normal",
			}
		},
        {
			id = 2,
			header = "Interceptor Cars",
			txt = "",
			params = {
				event = "drp-garages:open:interceptor"
			}
		},
        {
			id = 3,
			header = "Undercover Cars",
			txt = "",
			params = {
				event = "drp-garages:open:undercover"
			}
		},
	})
end)

RegisterEvent("drp-garages:open:normal")
AddEventHandler("drp-garages:open:normal", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "Purchase Crown Victoria",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:PurchasedVic",
			}
		},
    }
end)

RegisterEvent("drp-garages:open:interceptor")
AddEventHandler("drp-garages:open:interceptor", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "Purchase Mustang",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolstang",
			}
		},
		{
			id = 2,
			header = "Purchase Challenger",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolchal",
			}
		},
		{
			id = 3,
			header = "Purchase Corvette",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolvette",
			}
		},
    }
end)

RegisterEvent("drp-garages:open:undercover")
AddEventHandler("drp-garages:open:undercover", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "Purchase Undercover Washington",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:Purchaseducwashington",
			}
		},
        {
			id = 2,
			header = "Purchase Undercover Rancher",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:Purchaseducrancher",
			}
		},
        {
			id = 3,
			header = "Purchase Undercover Primo",
			txt = "Price: $100.000",
			params = {
				event = "drp-garages:Purchaseducprimo",
			}
		},
        {
			id = 4,
			header = "Purchase Undercover Baller",
			txt = "Price: $150.000",
			params = {
				event = "drp-garages:Purchaseducballer",
			}
		},
        {
			id = 5,
			header = "Purchase Undercover Buffalo",
			txt = "Price: $220.000",
			params = {
				event = "drp-garages:Purchaseduccomet",
			}
		},
        {
			id = 6,
			header = "Purchase Undercover Coquette",
			txt = "Price: $230.000",
			params = {
				event = "drp-garages:Purchaseduccomet",
			}
		},
        {
			id = 7,
			header = "Purchase Undercover Banshee",
			txt = "Price: $240.000",
			params = {
				event = "drp-garages:Purchaseducbanshee",
			}
		},
        {
			id = 8,
			header = "Purchase Undercover Comet",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchaseduccomet",
			}
		}
    }
end)

RegisterEvent("drp-garages:open:normal")
AddEventHandler("drp-garages:open:normal", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "Purchase Crown Victoria",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:PurchasedVic",
			}
		},
    }
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
    local price = 80000
    buyCar("npolvic", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolvette')
AddEventHandler('drp-garages:Purchasednpolvette', function()
    local price = 250000
    buyCar("npolvette", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolstang')
AddEventHandler('drp-garages:Purchasednpolstang', function()
    local price = 250000
    buyCar("npolstang", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolchal')
AddEventHandler('drp-garages:Purchasednpolchal', function()
    local price = 250000
    buyCar("npolchal", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolchal')
AddEventHandler('drp-garages:Purchasednpolchal', function()
    local price = 250000
    buyCar("npolchal", price)
end)


function buyCar(model, price)
    if exports["isPed"]:isPed("mycash") >= price then
        TriggerServerEvent('drp-banking:removeMoney', price)
        TriggerEvent('drp-garages:PurchasedVeh', model, model, price)
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end
    

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