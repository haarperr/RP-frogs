Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1153.11, -2172.08, 13.26)
    SetBlipSprite(blip, 523)
    SetBlipScale(blip, 0.5)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Go Kart")
    EndTextCommandSetBlipName(blip)

    RequestIpl("breze_gokart_milo")
    local interiorID = GetInteriorAtCoords(-1123.117,-2108.477,23.23311)
    if IsValidInterior(interiorID) then 
        EnableInteriorProp(interiorID, "0x71348381")
        EnableInteriorProp(interiorID, "breze_gokart")
        RefreshInterior(interiorID)
    end 
end)