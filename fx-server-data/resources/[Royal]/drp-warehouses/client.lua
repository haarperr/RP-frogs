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
	local generator = { x = warehouses[warehouseId]["x"] , y = warehouses[warehouseId]["y"], z = warehouses[warehouseId]["z"]}
  	SetEntityCoords(PlayerPedId(),generator.x,generator.y,generator.z+2)
  	
	local building = CreateObject(`ex_int_warehouse_s_dlc`,generator.x-0.31811000,generator.y+1.79183500,generator.z+2.56171400,false,false,false)
	FreezeEntityPosition(building, true)
	local coordsofbuilding = GetEntityCoords(building, true)
	FreezeEntityPosition(coordsofbuilding,true)
    
	Citizen.Wait(500)
	SetEntityCoords(PlayerPedId(), coordsofbuilding)
	Citizen.Wait(500)
	SetEntityHeading(PlayerPedId(),0.0)
	FreezeEntityPosition(PlayerPedId(),false)
	DoScreenFadeIn(1)
end



Citizen.CreateThread(function()
    while true do
	    Citizen.Wait(0)
        -- for each warehouse
        for i, warehouse in pairs(warehouses) do
            
        -- if player is near the warehouse
        
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"], warehouses[i]["y"], warehouses[i]["z"], true)
            if distance <= 25.0 and exports["drp-inventory"]:hasEnoughOfItem(warehouses[i]["keyName"],1,false) then
                -- draw the text
                Draw3DText(warehouses[i]["x"],warehouses[i]["y"],warehouses[i]["z"], "Press [E] to enter")
                -- if player presses E
                if IsControlJustPressed(0, 38) and distance <= 1.75 then
                    -- build the warehouse
                    buildWarehouse(i)
                end
            end
        end
    end
end)