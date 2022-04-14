RegisterNetEvent("drp-barriers:stoptraffic")
AddEventHandler("drp-barriers:stoptraffic", function(vec3)
    -- get all peds in a radius of 10
    local peds = GetAllPeds()
    for k, v in pairs(peds) do
        if GetEntityCoords(v) then
            local distance = Vdist(vec3.x, vec3.y, vec3.z, GetEntityCoords(v))
            if distance < 10.0 then
                if IsPedInVehicle(v, GetVehiclePedIsIn(v, false), false) then
                    SetEntityMaxSpeed(v, 0.0)
                end
            end
        end
    end
end)

