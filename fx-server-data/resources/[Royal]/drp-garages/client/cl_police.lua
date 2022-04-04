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
			txt = "Open the Shop",
			params = {
				event = "drp-garages:open:normal",
			}
		},
        {
			id = 2,
			header = "Interceptor Cars",
			txt = "Open the Shop",
			params = {
				event = "drp-garages:open:interceptor"
			}
		},
        {
			id = 3,
			header = "Undercover Cars",
			txt = "Open the Shop",
			params = {
				event = "drp-garages:open:undercover"
			}
		},
        {
			id = 4,
			header = "Police Others",
			txt = "Open the Shop",
			params = {
				event = "drp-garages:open:others"
			}
		}
	})
end)

RegisterNetEvent("drp-garages:open:normal")
AddEventHandler("drp-garages:open:normal", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "<- Go back",
			txt = "",
			params = {
				event = "drp-garages:openBuyMenu"
			}
		},
		{
			id = 2,
			header = "Purchase Crown Victoria",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:PurchasedVic",
			}
		},
		{
			id = 3,
			header = "Purchase Explorer",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:Purchasednpolexp",
			}
		},
		{
			id = 4,
			header = "Purchase Police Bike",
			txt = "Price: $100.000",
			params = {
				event = "drp-garages:Purchasednpolmm",
			}
		},
		{
			id = 5,
			header = "Purchase Dodge Charger",
			txt = "Price: $150.000",
			params = {
				event = "drp-garages:Purchasednpolchar",
			}
		},
    })
end)

RegisterNetEvent("drp-garages:open:interceptor")
AddEventHandler("drp-garages:open:interceptor", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "<- Go back",
			txt = "",
			params = {
				event = "drp-garages:openBuyMenu"
			}
		},
		{
			id = 2,
			header = "Purchase Mustang",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolstang",
			}
		},
		{
			id = 3,
			header = "Purchase Challenger",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolchal",
			}
		},
		{
			id = 4,
			header = "Purchase Corvette",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchasednpolvette",
			}
		},
    })
end)

RegisterNetEvent("drp-garages:open:undercover")
AddEventHandler("drp-garages:open:undercover", function()
    TriggerEvent('drp-context:sendMenu', {
		{
			id = 1,
			header = "<- Go back",
			txt = "",
			params = {
				event = "drp-garages:openBuyMenu"
			}
		},
		{
			id = 2,
			header = "Purchase Undercover Washington",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:Purchaseducwashington",
			}
		},
        {
			id = 3,
			header = "Purchase Undercover Rancher",
			txt = "Price: $80.000",
			params = {
				event = "drp-garages:Purchaseducrancher",
			}
		},
        {
			id = 4,
			header = "Purchase Undercover Primo",
			txt = "Price: $100.000",
			params = {
				event = "drp-garages:Purchaseducprimo",
			}
		},
        {
			id = 5,
			header = "Purchase Undercover Baller",
			txt = "Price: $150.000",
			params = {
				event = "drp-garages:Purchaseducballer",
			}
		},
        {
			id = 6,
			header = "Purchase Undercover Buffalo",
			txt = "Price: $220.000",
			params = {
				event = "drp-garages:Purchaseducbuffalo",
			}
		},
        {
			id = 7,
			header = "Purchase Undercover Coquette",
			txt = "Price: $230.000",
			params = {
				event = "drp-garages:Purchaseduccoquette",
			}
		},
        {
			id = 8,
			header = "Purchase Undercover Banshee",
			txt = "Price: $240.000",
			params = {
				event = "drp-garages:Purchaseducbanshee",
			}
		},
        {
			id = 9,
			header = "Purchase Undercover Comet",
			txt = "Price: $250.000",
			params = {
				event = "drp-garages:Purchaseduccomet",
			}
		}
    })
end)

RegisterNetEvent('drp-garages:open:others')
AddEventHandler('drp-garages:open:others', function()
	TriggerEvent('drp-context:sendMenu', {
        {
			id = 1,
			header = "<- Go back",
			txt = "",
			params = {
				event = "drp-garages:openBuyMenu"
			}
		},
        {
			id = 2,
			header = "Purchase Police Helicopter",
			txt = "$450.000",
			params = {
				event = "drp-garages:Purchasedpolmav"
			}
		},
		{
			id = 3,
			header = "Purchase Ranger Quad",
			txt = "$50.000",
			params = {
				event = "drp-garages:Purchasednpolblazer"
			}
		}	
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

RegisterNetEvent('drp-garages:Purchaseducwashington')
AddEventHandler('drp-garages:Purchaseducwashington', function()
	local price = 80000
	buyCar("ucwashington", price)
end)

RegisterNetEvent('drp-garages:Purchaseducrancher')
AddEventHandler('drp-garages:Purchaseducrancher', function()
	local price = 80000
	buyCar("ucrancher", price)
end)

RegisterNetEvent('drp-garages:Purchaseducprimo')
AddEventHandler('drp-garages:Purchaseducprimo', function()
	local price = 100000
	buyCar("ucprimo", price)
end)

RegisterNetEvent('drp-garages:Purchaseducballer')
AddEventHandler('drp-garages:Purchaseducballer', function()
	local price = 150000
	buyCar("ucballer", price)
end)

RegisterNetEvent('drp-garages:Purchaseducbuffalo')
AddEventHandler('drp-garages:Purchaseducbuffalo', function()
	local price = 220000
	buyCar("ucbuffalo", price)
end)

RegisterNetEvent('drp-garages:Purchaseduccoquette')
AddEventHandler('drp-garages:Purchaseduccoquette', function()
	local price = 230000
	buyCar("uccoquette", price)
end)

RegisterNetEvent('drp-garages:Purchaseducbanshee')
AddEventHandler('drp-garages:Purchaseducbanshee', function()
	local price = 240000
	buyCar("ucbanshee", price)
end)

RegisterNetEvent('drp-garages:Purchaseduccomet')
AddEventHandler('drp-garages:Purchaseduccomet', function()
	local price = 250000
	buyCar("uccomet", price)
end)

RegisterNetEvent('drp-garages:Purchasedpolmav')
AddEventHandler('drp-garages:Purchasedpolmav', function()
	local price = 450000
	buyCar("polmav", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolblazer')
AddEventHandler('drp-garages:Purchasednpolblazer', function()
	local price = 50000
	buyCar("npolblazer", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolexp')
AddEventHandler('drp-garages:Purchasednpolcharg', function()
	local price = 80000
	buyCar("npolexp", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolchar')
AddEventHandler('drp-garages:Purchasednpolchar', function()
	local price = 150000
	buyCar("npolchar", price)
end)

RegisterNetEvent('drp-garages:Purchasednpolmm')
AddEventHandler('drp-garages:Purchasednnpolmm', function()
	local price = 150000
	buyCar("npolmm", price)
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