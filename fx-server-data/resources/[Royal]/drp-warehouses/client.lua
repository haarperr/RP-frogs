warehouses = {
    [1] =  { ['x'] = 493.3533, ['y'] = -570.8793, ['z'] = 24.5781, ['h'] = 263.2521, ['locationName'] = 'LS Freeway', ['keyName'] = 'warehousekey1'},
}


function Draw3DText(x,y,z, text)
    local factor = string_len(text) * inv_factor
    local onScreen,_x,_y = _in(0x34E82F05DF2974F5, x, y, z, _f, _f, _r) -- GetScreenCoordFromWorldCoord

    if onScreen then
        _in(0x07C837F9A01C34C9, 0.35, 0.35) -- SetTextScale
        _in(0x66E0276CC5F6B9DA, 4) -- SetTextFont
        _in(0x038C1F517D7FDCF8, 1) -- SetTextProportional
        _in(0xBE6B23FFA53FB442, 255, 255, 255, 215) -- SetTextColour
        _in(0x25FBB336DF1804CB, "STRING") -- SetTextEntry
        _in(0xC02F4DBFB51D988B, 1) -- SetTextCentre
        _in(0x6C188BE134E074AA, text) -- AddTextComponentString, assumes "text" is of type string
        _in(0xCD015E5BB0D96A57, _x, _y) -- DrawText
        _in(0x3A618A217E5154F0, _x,_y+0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68) -- DrawRect
    end
end



function buildWarehouse(warehouseId)
	DoScreenFadeOut(1)
	Citizen.Wait(1000)
	local generator = { x = warehouses[warehouseId]["x"] , y = warehouses[warehouseId]["y"]-50, z = warehouses[warehouseId]["z"] - 35.0}
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
        for i=1,#warehouses do
            -- if player is near the warehouse
            Citizen.Trace(warehouses[i]["x"])
            Citizen.Trace(warehouses[i]["y"])
            Citizen.Trace(warehouses[i]["z"])
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), warehouses[i]["x"], warehouses[i]["y"], warehouses[i]["z"], true)
            if distance <= 25.0 and exports["drp-inventory"]:hasEnoughOfItem(warehouses[i]["keyName"],1,false) then
                -- draw the text
                Draw3DText(warehouses[i]["x"],warehouses[i]["y"],warehouses[i]["z"], "Press [E] to enter")
                -- if player presses E
                if IsControlJustPressed(0, 38) then
                    -- build the warehouse
                    buildWarehouse(i)
                end
            end
        end
    end
end)