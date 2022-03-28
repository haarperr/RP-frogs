warehouses = {
    [1] =  { ['x'] = 493.3533, ['y'] = -570.8793, ['z'] = 24.5781, ['h'] = 263.2521, ['locationName'] = 'LS Freeway', ['keyName'] = 'warehousekey1'},
}


function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y) 
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function buildWarehouse(warehouseId)
	DoScreenFadeOut(1)
	Citizen.Wait(1000)

	local generator = { x = warehouses[warehouseId]["x"] , y = warehouses[warehouseId]["y"], z = warehouses[warehouseId]["z"] - 35}
  	
	SetEntityCoords(PlayerPedId(), generator.x-0.31811000,generator.y+1.79183500,generator.z+2.56171400)

	local building = CreateObject(`warehouse_shell`,generator.x-0.31811000,generator.y+1.79183500,generator.z+2.56171400,false,false,false)

	FreezeEntityPosition(building, true)
	local coordsofbuilding = GetEntityCoords(building, true)

    local chest = CreateObject(`imp_prop_impexp_boxpile_01`,coordsofbuilding.x,coordsofbuilding.y+2.375,coordsofbuilding.z-2,false,false,false)
    local crafting = CreateObject(`gr_prop_gr_bench_01b`,coordsofbuilding.x,coordsofbuilding.y-3.4,coordsofbuilding.z-2,false,false,false)

    SetEntityRotation(crafting,0.0,0.0,-180.0,2,1)
    FreezeEntityPosition(crafting, true)
    
    FreezeEntityPosition(chest, true)

	FreezeEntityPosition(coordsofbuilding,true)

    
    
	Citizen.Wait(750)
	SetEntityCoords(PlayerPedId(), coordsofbuilding)
	Citizen.Wait(500)
	SetEntityHeading(PlayerPedId(),0.0)
	FreezeEntityPosition(PlayerPedId(),false)
	DoScreenFadeIn(1)
end

local currentWarehouse = 0
local isInWarehouse = false

Citizen.CreateThread(function()
    while true do
	    Citizen.Wait(0)
        -- for each warehouse
        for i, warehouse in pairs(warehouses) do  
        -- if player is near the warehouse
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"], warehouses[i]["y"], warehouses[i]["z"], true)
            if distance <= 22.5 and exports["drp-inventory"]:hasEnoughOfItem(warehouses[i]["keyName"],1,false) then
                -- draw the text
                Draw3DText(warehouses[i]["x"],warehouses[i]["y"],warehouses[i]["z"], "Press [E] to enter")
                -- if player presses E
                if IsControlJustPressed(0, 38) and distance <= 1.75 then
                    -- build the warehouse
                    buildWarehouse(i)
				    Citizen.Wait(1000)
                end
            end
            
            local exitDistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"]-9, warehouses[i]["y"]+1.5, warehouses[i]["z"]-31, true)
            if exitDistance <= 15 then
                Draw3DText(warehouses[i]["x"]-9,warehouses[i]["y"]+1.5,warehouses[i]["z"]-31, "Press [E] to exit")
                if IsControlJustPressed(0, 38) and exitDistance <= 1.75 then
                    -- exit the warehouse
                    DoScreenFadeOut(1)
                    SetEntityCoords(PlayerPedId(), warehouses[i]["x"], warehouses[i]["y"], warehouses[i]["z"])
                    Citizen.Wait(1000)
                    SetEntityCoords(PlayerPedId(), warehouses[i]["x"], warehouses[i]["y"], warehouses[i]["z"])
                    DoScreenFadeIn(1)
                end
            end


            local stashDistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"], warehouses[i]["y"]+4, warehouses[i]["z"]-32, true)
            if stashDistance <= 15 then
                Draw3DText(warehouses[i]["x"], warehouses[i]["y"]+4, warehouses[i]["z"]-32, "Press [H] to stash")
                if IsControlJustPressed(0, 74) and stashDistance <= 1.75 then
                    -- stash the items
			        TriggerEvent("server-inventory-open", "1", "WAREHOUSE -"..i)
                end
            end

            
            local craftingDistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"], warehouses[i]["y"]-4, warehouses[i]["z"]-32, true)
            if craftingDistance <= 15 then
                Draw3DText(warehouses[i]["x"], warehouses[i]["y"]-4, warehouses[i]["z"]-32, "Press [H] to stash")
                if IsControlJustPressed(0, 74) and stashDistance <= 1.75 then
                    -- nothing
                end
            end
        end
    end
end)