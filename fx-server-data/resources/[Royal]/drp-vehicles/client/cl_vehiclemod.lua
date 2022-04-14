local offroadVehicles = {
    "bifta",
    "blazer",
    "brawler",
    "dubsta3",
    "dune",
    "rebel2",
    "sandking",
    "trophytruck",
    "sanchez",
    "sanchez2",
    "blazer",
    "enduro",
    "pol9",
    "police3", -- police SUV
    "sheriff2", -- sheriff SUV
    "hwaycar", -- trooper suv
    "fbi2",
    "bf400"
}

local offroadbikes = {
    "ENDURO",
    "sanchez",
    "sanchez2"
}

local carsEnabled = {}
local airtime = 0
local offroadTimer = 0
local airtimeCoords = GetEntityCoords(PlayerPedId())
local heightPeak = 0
local lasthighPeak = 0
local highestPoint = 0
local zDownForce = 0
local veloc = GetEntityVelocity(GetVehiclePedIsIn(PlayerPedId()), false)
local offroadVehicle = false

local playerPed = nil
local currentVehicle = nil
local driverPed = nil
local harness = false
local harnessDurability = 0.0
local disableControl = false
local nosCar = nil
local nosTimeInSeconds = 10
local stalled = false
DecorRegister("vehicleHarnessDur", 1) -- who knows if this works :)

local NosVehicles = {}
local nosMods = {}
local nosForce = 0.0
local seatbelt = false
local disablenos = false
local exhausts = {
    "exhaust"
}
for i=2, 30 do
    exhausts[#exhausts+1] = "exhaust_"..i
end

function downgrade(veh,power,offroad)
    local vehModel = GetEntityModel(veh)
    if carsEnabled["" .. veh .. ""] == nil then
        return
    end
    if offroad then
        power = power + 0.5
        if IsThisModelABike(vehModel) then
            power = power + 0.3
        else
            power = power + 0.3
        end

    end
    power = math.ceil(power * 10)

    local factor = math.random( 3+power ) / 10


    if factor > 0.7 then
        if IsThisModelABike(vehModel) then
            if not offroad then
                factor = 0.7
            end
        else
            if not offroad then
                factor = 0.7
            else
                factor = 0.8
            end

        end
    end

    if factor < 0.4 then
        if not offroad then
            factor = 0.25
        else
            factor = 0.4
        end
    end

    if carsEnabled["" .. veh .. ""] == nil then return end
    local carData = carsEnabled["" .. veh .. ""]
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel', carData["fInitialDriveMaxFlatVel"] * factor)
    --SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock', carsEnabled["" .. veh .. ""]["fSteeringLock"] * factor)
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionLossMult', carData["fTractionLossMult"] * factor)
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fLowSpeedTractionLossMult', carData["fLowSpeedTractionLossMult"] * factor)
    SetVehicleEnginePowerMultiplier(veh,factor)
    SetVehicleEngineTorqueMultiplier(veh,factor)
    TriggerEvent("tuner:setDriver")
end

function resetdowngrade(veh)
    if carsEnabled["" .. veh .. ""] == nil then
        return
    end
    local carData = carsEnabled["" .. veh .. ""]
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel', carData["fInitialDriveMaxFlatVel"])
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock', carData["fSteeringLock"])
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionLossMult', carData["fTractionLossMult"])
    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fLowSpeedTractionLossMult', carData["fLowSpeedTractionLossMult"])
    SetVehicleEnginePowerMultiplier(veh,0.7)
    SetVehicleEngineTorqueMultiplier(veh,0.7)

end

function ejectionLUL()
    local veh = GetVehiclePedIsIn(playerPed,false)
    local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
    SetEntityCoords(playerPed, coords)
    Citizen.Wait(1)
    SetPedToRagdoll(playerPed, 5511, 5511, 0, 0, 0, 0)
    SetEntityVelocity(playerPed, veloc.x*4,veloc.y*4,veloc.z*4)
    local ejectspeed = math.ceil(GetEntitySpeed(playerPed) * 8)
    if IsPedWearingHelmet(playerPed) and IsThisModelABicycle(GetEntityModel(veh)) then
        -- Players on bicycles wearing helmets shouldn't die from the ejection itself. Instead, set HP to 1.
        -- Player will only die if further native damage occurs post ejection, more than the armour can protect.
        local damageAmount = GetEntityHealth(playerPed) - 1
        if damageAmount > ejectspeed then
            damageAmount = ejectspeed
        end
        SetEntityHealth(playerPed, GetEntityHealth(playerPed) - damageAmount)
        return
    end
    SetEntityHealth(playerPed, (GetEntityHealth(playerPed) - ejectspeed) )
   -- TriggerEvent("randomBoneDamage")
end

function preventVehicleExit()
    Citizen.CreateThread(function()
        local options = {1000,2000,3000}
        disableControl = true
        disableTurning()
        local finished = exports["drp-taskbar"]:taskBar(options[math.random(1,3)],"Taking off Harness",true)
        if finished == 100 then
            harness = false
            TriggerEvent("harness", false, harnessDurability)
            TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
            TriggerEvent("DoShortHudText",'Harness Disabled',4)
        end
        disableControl = false
    end)
end

function disableTurning()
    local tempVeh = currentVehicle
    if carsEnabled["" .. tempVeh .. ""] ~= nil then
        local defaultHandling = carsEnabled["" .. tempVeh .. ""]["fSteeringLock"]
        Citizen.CreateThread(function()
            while disableControl do
                SetVehicleHandlingFloat(tempVeh, 'CHandlingData', 'fSteeringLock', defaultHandling / 4)
                Citizen.Wait(10)
                -- DisableControlAction(0, 59, 1)
            end
            SetVehicleHandlingFloat(tempVeh, 'CHandlingData', 'fSteeringLock', defaultHandling)
        end)
    end
end

-- function carCrash()
    -- endNos()
    -- local new_health = GetVehicleEngineHealth(currentVehicle) - math.random(50, 150)
    -- TriggerEvent('DoLongHudText', 'Your vehicle has stalled!', 2)
    -- SetVehicleEngineOn(currentVehicle, false, true, true)
    -- SetVehicleEngineHealth(currentVehicle, new_health)
    -- SetVehicleUndriveable(veh, true)
    -- lastCurrentVehicleSpeed = 0.0
    -- lastCurrentVehicleBodyHealth = new_health
-- end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if stalled then
            Citizen.Wait(math.random(3500, 4500))
            SetVehicleEngineOn(currentVehicle, true, true, true)
            stalled = false
        end
    end
end)

function nosInit()
    nosCar = GetVehiclePedIsIn(playerPed, false)
    if nosCar ~= 0 and nosCar ~= false and nosCar ~= nil then
        Citizen.CreateThread(function()
            startNos()
            sendServerEventForPassengers("NetworkNos")

            local curSpeed = GetEntitySpeed(nosCar)
            local modifier = (1.0 / (curSpeed / 5)) * 0.81
            -- SetVehicleForwardSpeed(nosCar, curSpeed + modifier) --Forward Speed

            if nosForce == 0.0 then
                local fInitialDriveForce = GetVehicleHandlingFloat(nosCar, 'CHandlingData', 'fInitialDriveForce')
                nosForce = fInitialDriveForce
            end
            local burst = math.ceil( (nosForce + nosForce * 1.15) * 100000 ) / 100000
            if GetEntitySpeed(nosCar) > 70 then
                burst = math.ceil( (nosForce + nosForce * 0.85) * 100000 ) / 100000
            end

            if burst > 0 then
                local fInitialDriveForce = GetVehicleHandlingFloat(nosCar, 'CHandlingData', 'fInitialDriveForce')
                if burst >= fInitialDriveForce then
                    if nosMods[nosCar] ~= nil and burst > nosMods[nosCar] then
                        burst = nosMods[nosCar]
                    else
                        nosMods[nosCar] = burst
                    end
                    SetVehicleHandlingField(nosCar, 'CHandlingData', 'fInitialDriveForce', burst)
                end
            end
            nosParticles()
        end)
    end
end

function nosParticles()
     -- TODO: Fix for all exhaust
    local scale = 1.0
    local count = 500
    local particleDict = "veh_xs_vehicle_mods"
    local particleCar = GetVehiclePedIsIn(playerPed, false)
    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Citizen.Wait(0)
    end
    UseParticleFxAssetNextCall(particleDict)

    local particles = {}

    function removeParticles()
        Citizen.CreateThread(function()
            for i,v in pairs(particles) do
                RemoveParticleFx(v)
            end
            Citizen.Wait(2000)
            for i,v in pairs(particles) do
                RemoveParticleFx(v)
                particles[i] = nil
            end
        end)
    end

    if particleCar ~= 0 and particleCar ~= false and particleCar ~= nil then
        local pitch = GetEntityPitch(particleCar)
        local carPos = GetEntityCoords(particleCar, false)

        for i,v in pairs(exhausts) do
            local bone = GetEntityBoneIndexByName(particleCar, v)
            if bone ~= -1 then
                local offset = GetWorldPositionOfEntityBone(particleCar, bone)
                UseParticleFxAsset(particleDict)
                particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_nitrous", particleCar, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
            end
        end

        Citizen.Wait(1000)

        for i,v in pairs(exhausts) do
            local bone = GetEntityBoneIndexByName(particleCar, v)
            if bone ~= -1 then
                local offset = GetWorldPositionOfEntityBone(particleCar, bone)
                UseParticleFxAsset(particleDict)
                particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_nitrous", particleCar, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
            end
        end
    end

    Citizen.SetTimeout(1000 * nosTimeInSeconds, function()
        removeParticles()
        endNos()
    end)
end

function startNos(veh)
    disablenos = true
    if nosCar ~= 0 and nosCar ~= false and nosCar ~= nil then
        SetVehicleBoostActive(nosCar, 1) --Boost Sound
    elseif veh ~= nil then
        SetVehicleBoostActive(veh, 1)
    end

    Citizen.CreateThread(function()
        local active = true

        Citizen.SetTimeout(1000 * math.ceil(nosTimeInSeconds / 3), function()
            active = false
        end)

        while active do
            Citizen.Wait(0)
            -- StartScreenEffect("RaceTurbo", 30.0, 0)
            StartScreenEffect("ExplosionJosh3", 30.0, 0)
        end

        -- StartScreenEffect("RaceTurbo", 0, 0)
        StartScreenEffect("ExplosionJosh3", 0, 0)
        if nosCar ~= 0 and nosCar ~= false and nosCar ~= nil then
            SetVehicleBoostActive(nosCar, 0)
        end
    end)
end

function endNos()
    if not disablenos then
        return
    end

    if nosCar ~= 0 and nosCar ~= false and nosCar ~= nil then
        TriggerEvent("noshud", NosVehicles[nosCar], false)
        SetVehicleHandlingField(nosCar, 'CHandlingData', 'fInitialDriveForce', nosForce)
    end

    nosForce = 0.0
    disablenos = false
end

function sendServerEventForPassengers(event, value)
    local player = PlayerPedId()
    for i=-1, GetVehicleMaxNumberOfPassengers(currentVehicle)-1 do
        local ped = GetPedInVehicleSeat(currentVehicle, i)
        if ped ~= player and ped ~= 0 then
            TriggerServerEvent(event, GetPlayerServerId(v), value)
        end
    end
end

function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle
	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		offset = offset - 1
		if vehicle ~= 0 then break end
	end
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	if distance > 25 then vehicle = nil end
    return vehicle ~= nil and vehicle or 0
end

function toggleHarness()
    disableControl = true
    disableTurning()
    local finished = 0
    if harness then
        finished = exports["drp-taskbar"]:taskBar(5000,"Taking off Harness",true)               
    else
        finished = exports["drp-taskbar"]:taskBar(5000,"Putting on Harness",true)               
    end
    if (finished == 100) then
        if playerPed == driverPed then
            if not harness then
                TriggerEvent("harness", true, harnessDurability)
                TriggerEvent("seatbelt",true)
                TriggerEvent("InteractSound_CL:PlayOnOne","seatbelt",0.1)
                TriggerEvent("DoShortHudText",'Harness Enabled',4)                               
            else
                TriggerEvent("harness", false, harnessDurability)
                TriggerEvent("seatbelt",false)
                TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
                TriggerEvent("DoShortHudText",'Harness Disabled',4)                                  
            end
            harness = not harness
            seatbelt = false
        else
            -- Player switched while putting it on ...
            harnessDurability = 0.0
            TriggerEvent("harness", false, harnessDurability)
            TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
            TriggerEvent("DoShortHudText",'Harness Disabled',4)
            harness = false
            seatbelt = false
        end
    end
    disableControl = false
end

function toggleSeatbelt()
    if seatbelt == false then
        TriggerEvent("seatbelt",true)
        TriggerEvent("InteractSound_CL:PlayOnOne","seatbelt",0.1)
        TriggerEvent("DoShortHudText",'Seat Belt Enabled',4)
    else
        TriggerEvent("seatbelt",false)
        TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
        TriggerEvent("DoShortHudText",'Seat Belt Disabled',4)
    end
    seatbelt = not seatbelt
end

RegisterNetEvent('NosStatus')
AddEventHandler('NosStatus', function()
    if not IsToggleModOn(currentVehicle,18) then
        TriggerEvent('DoLongHudText', 'Need a Turbo for Nos!', 2)
        return
    end

    if currentVehicle ~= nil and currentVehicle ~= false and currentVehicle ~= 0 then
        if driverPed == playerPed then
            NosVehicles[currentVehicle] = 100
        end
    end
end)

RegisterNetEvent('NetworkNos')
AddEventHandler('NetworkNos', function()
    startNos(GetVehiclePedIsIn(playerPed,false))
end)

RegisterNetEvent('nos:help')
AddEventHandler('nos:help', function()
    if NosVehicles[currentVehicle] == nil then
        NosVehicles[currentVehicle] = 0
    end

    TriggerEvent("chatMessage", "NOS: ", {255, 255, 255}, "You have %" .. math.floor(NosVehicles[currentVehicle]) .. " left")
end)

RegisterNetEvent("carhud:ejection:client")
AddEventHandler("carhud:ejection:client",function(value)
    veloc = value
    if seatbelt then
        if math.random(100) > 83 then -- 17%
            ejectionLUL()
        end
    else
        if math.random(100) > 45 then -- 55%
            ejectionLUL()
        end
    end
end)

RegisterNetEvent('event:control:vehicleMod')
AddEventHandler('event:control:vehicleMod', function(useID)
    if IsPedInAnyVehicle(playerPed) and not IsThisModelABike(GetEntityModel(currentVehicle)) then
        if harnessDurability > 0.0 then
            toggleHarness()
        elseif harnessDurability <= 0.0 and harness then
            TriggerEvent("harness", false, harnessDurability)
            TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
            TriggerEvent("DoShortHudText",'Harness Disabled',4)               
            harness = false
        else
            toggleSeatbelt()
        end
    end
end)

RegisterNetEvent("vehicleMod:setHarness")
AddEventHandler("vehicleMod:setHarness",function(result, isNew)
    if result then -- player owned car
        if tonumber(result) >= 0.0 then
            harnessDurability = tonumber(result)
        else
            harnessDurability = 0.0
        end
    else -- local car or fake plates
        if DecorExistOn(currentVehicle, "vehicleHarnessDur") and not isNew then
            harnessDurability = DecorGetFloat(currentVehicle, "vehicleHarnessDur")
        elseif isNew then
            DecorSetFloat(currentVehicle, "vehicleHarnessDur", 1.0)
            harnessDurability = 1.0
        else
            harnessDurability = 0.0
        end
    end
    if currentVehicle ~= 0 and currentVehicle ~= nil and currentVehicle ~= false then
        if driverPed == playerPed then
            TriggerEvent("harness", harness, harnessDurability)
        else
            harness = false
            harnessDurability = 0.0
            TriggerEvent("harness", false, 0.0)
        end
    end
end)

RegisterNetEvent("vehicleMod:useHarnessItem")
AddEventHandler("vehicleMod:useHarnessItem",function()
    TriggerServerEvent("vehicleMod:applyHarness", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 1.0)
end)

RegisterNetEvent("vehicleMod:resetDowngrade")
AddEventHandler("vehicleMod:resetDowngrade",function(targetvehicle)
    resetdowngrade(targetvehicle)
end)

RegisterNetEvent("client:illegal:upgrades")
AddEventHandler("client:illegal:upgrades",function(Extractors,Filter,Suspension,Rollbars,Bored,Carbon)
    if (IsPedInAnyVehicle(playerPed, false)) then
        local veh = GetVehiclePedIsIn(playerPed,false)
        if Extractors == 1 then

            local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
            fInitialDriveForce = fInitialDriveForce + fInitialDriveForce * 0.1
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
        end


        if Filter == 1 then

            local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
            fInitialDriveForce = fInitialDriveForce + fInitialDriveForce * 0.1
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
        end

        if Suspension == 1 then

            local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
            fBrakeForce = fBrakeForce + fBrakeForce * 0.3
            SetVehicleHandlingField(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)

            local fSteeringLock = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock')
            fSteeringLock = fSteeringLock + fSteeringLock * 0.2
            SetVehicleHandlingField(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)

        end

        if Rollbars == 1 then

            local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
            fBrakeForce = fBrakeForce + fBrakeForce * 0.1
            SetVehicleHandlingField(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)

            local fSteeringLock = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock')
            fSteeringLock = fSteeringLock + fSteeringLock * 0.2
            SetVehicleHandlingField(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)

        end

        if Bored == 1 then

            local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
            fInitialDriveForce = fInitialDriveForce + fInitialDriveForce * 0.05
            SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
        end

        if Carbon == 1 then


            local fMass = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fMass')
            fMass = fMass - fMass * 0.3
            SetVehicleHandlingField(veh, 'CHandlingData', 'fMass', fMass)

            local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
            fInitialDriveForce = fInitialDriveForce + fInitialDriveForce * 0.1

        end
    end
end)


Citizen.CreateThread(function()
    local firstDrop = GetEntityVelocity(PlayerPedId())
    local lastentSpeed = 0
    while true do
        Citizen.Wait(1)

        if (IsPedInAnyVehicle(PlayerPedId(), false)) then

            local veh = GetVehiclePedIsIn(PlayerPedId(),false)
            if not invehicle and not IsThisModelABike(GetEntityModel(veh)) then
                invehicle = true
                TriggerEvent("InteractSound_CL:PlayOnOne","beltalarm",0.35)
            end

            local bicycle = IsThisModelABicycle( GetEntityModel(veh) )

            if carsEnabled["" .. veh .. ""] == nil and not bicycle then
                SetVehiclePetrolTankHealth(veh, 4000.0)

                SetVehicleHandlingFloat(veh, 'CHandlingData', 'fWeaponDamageMult', 3.500000)

                local fSteeringLock = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock')

                fSteeringLock = math.ceil((fSteeringLock * 0.6)) + 0.1
                SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)
                SetVehicleHandlingField(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)

                local fInitialDriveMaxFlatVel = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel')
                if IsThisModelABike(GetEntityModel(veh)) then

                    local fTractionCurveMin = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMin')

                    fTractionCurveMin = fTractionCurveMin * 0.6
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMin', fTractionCurveMin)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fTractionCurveMin', fTractionCurveMin)

                    local fTractionCurveMax = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMax')

                    fTractionCurveMax = fTractionCurveMax * 0.6
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMax', fTractionCurveMax)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fTractionCurveMax', fTractionCurveMax)



                    local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
                    fInitialDriveForce = fInitialDriveForce * 2.2
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)

                    local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
                    fBrakeForce = fBrakeForce * 1.4
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionReboundDamp', 5.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionReboundDamp', 5.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionCompDamp', 5.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionCompDamp', 5.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionForce', 22.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionForce', 22.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fCollisionDamageMult', 2.500000)
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fEngineDamageMult', 0.120000)
                else

                    local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
                    fBrakeForce = fBrakeForce * 0.5
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)

                    local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
                    if fInitialDriveForce < 0.289 then
                        fInitialDriveForce = fInitialDriveForce * 1.05
                        SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
                    else
                        fInitialDriveForce = fInitialDriveForce * 0.8
                        SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
                    end
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fEngineDamageMult', 0.100000)
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fCollisionDamageMult', 2.900000)

                end

                SetVehicleHandlingFloat(veh, 'CHandlingData', 'fDeformationDamageMult', 1.000000)

                SetVehicleHasBeenOwnedByPlayer(veh,true)
                carsEnabled["" .. veh .. ""] = {
                    ["fInitialDriveMaxFlatVel"] = fInitialDriveMaxFlatVel,
                    ["fSteeringLock"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock'),
                    ["fTractionLossMult"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionLossMult'),
                    ["fLowSpeedTractionLossMult"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fLowSpeedTractionLossMult')
                }
                local plt = GetVehicleNumberPlateText(veh)
                TriggerServerEvent("request:illegal:upgrades",plt)
            else
                Wait(1000)
            end


            if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then

                local coords = GetEntityCoords(PlayerPedId())
                local roadtest2 = IsPointOnRoad(coords.x, coords.y, coords.z, veh)
              --  roadtest, endResult, outHeading = GetClosestVehicleNode(coords.x, coords.y, coords.z,  1, 0, -1)
             --   endDistance = #(vector3(endResult.x, endResult.y, endResult.z) - GetEntityCoords(PlayerPedId()))
                local myspeed = GetEntitySpeed(veh) * 3.6
                local xRot = GetEntityUprightValue(veh)
                if not roadtest2 then
                    if (xRot < 0.90) then
                        offroadTimer = offroadTimer + (1 - xRot)
                    elseif xRot > 0.90 then
                        if offroadTimer < 1 then
                            offroadTimer = 0
                        else
                            offroadTimer = offroadTimer - xRot
                            resetdowngrade(veh)
                        end
                    end
                elseif offroadTimer > 0 or offroadTimer == 0 then
                    offroadTimer = 0
                    offroadVehicle = false
                    resetdowngrade(veh)
                end

                if offroadTimer > 5 and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then

                    for i = 1, #offroadVehicles do
                        if IsVehicleModel( GetVehiclePedIsUsing(PlayerPedId()), GetHashKey(offroadVehicles[i]) ) then
                            offroadVehicle = true

                        end
                    end

                    if not offroadVehicle then
                        if IsThisModelABike(GetEntityModel(veh)) then
                            downgrade(veh,0.12 - xRot / 10,offroadVehicle)
                        else
                            downgrade(veh,0.20 - xRot / 10,offroadVehicle)
                        end

                    else
                        downgrade(veh,0.35 - xRot / 10,offroadVehicle)
                    end
                end

                if IsEntityInAir(veh) then
                    firstDrop = GetEntityVelocity(veh)
                    lastentSpeed = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())))
                    if airtime == 1 then
                        heightPeak = 0
                        lasthighPeak = 0
                        airtimeCoords = GetEntityCoords(veh)
                        lasthighPeak = airtimeCoords.z
                    else
                        local AirCurCoords = GetEntityCoords(veh)
                        heightPeak = AirCurCoords.z
                        if tonumber(heightPeak) > tonumber(lasthighPeak) and airtime ~= 0 then
                            lasthighPeak = heightPeak
                            highestPoint = heightPeak - airtimeCoords.z
                        end
                    end
                    airtime = airtime + 1
                elseif airtime > 0 then

                    if airtime > 110 then
                        Citizen.Wait(333)
                        local landingCoords = GetEntityCoords(veh)
                        local landingfactor = landingCoords.z - airtimeCoords.z
                        local momentum = GetEntityVelocity(veh)
                        highestPoint = highestPoint - landingfactor

                        highestPoint = highestPoint * 0.55

                        airtime = math.ceil(airtime * highestPoint)

                        local xdf = 0
                        local ydf = 0
                        if momentum.x < 0 then
                            xdf = momentum.x
                            xdf = math.ceil(xdf - (xdf * 2))
                        else
                            xdf = momentum.x
                        end

                        if momentum.y < 0 then
                            ydf = momentum.y
                            ydf = math.ceil(ydf - (ydf * 2))
                        else
                            ydf = momentum.y
                        end



                        zdf = momentum.z
                        lastzvel = firstDrop.z

                        zdf = zdf - lastzvel
                        local dirtBike = false
                        for i = 1, #offroadbikes do
                            if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()), GetHashKey(offroadbikes[i], _r)) then
                                dirtBike = true
                            end
                        end
                        if dirtBike then
                            airtime = airtime - 200
                        end

                        if IsThisModelABicycle(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) then
                            local ohshit = math.ceil((zdf * 200))
                            local entSpeed = math.ceil( GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 1.35 )

                            if airtime > 550 then
                                if airtime > 550 and ohshit > airtime and ( entSpeed < lastentSpeed or entSpeed < 2.0 ) then
                                    ejectionLUL()
                                elseif airtime > 1500 and entSpeed < lastentSpeed then
                                    ejectionLUL()
                                else
                                end
                            end

                        elseif airtime > 950 and IsThisModelABike(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) then
                            local ohshit = math.ceil((zdf * 200))
                            local entSpeed = math.ceil( GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 1.15 )

                            if airtime > 950 then
                                if airtime > 950 and ohshit > airtime and ( entSpeed < lastentSpeed or entSpeed < 2.0 ) then
                                    ejectionLUL()
                                elseif airtime > 2500 and entSpeed < lastentSpeed then
                                    ejectionLUL()
                                else
                                end
                            end

                        end
                    end
                    airtimeCoords = GetEntityCoords(PlayerPedId())
                    heightPeak = 0
                    airtime = 0
                    lasthighPeak = 0
                    zDownForce = 0
                end

                --GetVehicleClass(vehicle)
                local ped = PlayerPedId()
                local roll = GetEntityRoll(veh)

                if IsEntityInAir(veh) and not IsThisModelABike(GetEntityModel(veh)) then
                    DisableControlAction(0, 59)
                    DisableControlAction(0, 60)
                end
                if ((roll > 75.0 or roll < -75.0) or not IsVehicleEngineOn(veh)) and not IsThisModelABike(GetEntityModel(veh)) then
                    DisableControlAction(2,59,true)
                    DisableControlAction(2,60,true)
                end
            else
                Wait(1000)
            end
        else
            if invehicle or seatbelt then
                if seatbelt then
                    TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
                end
                invehicle = false
                seatbelt = false
                TriggerEvent("seatbelt",false)
            end
            Citizen.Wait(1500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if seatbelt then
            DisableControlAction(0, 75)
        end
    end
end)

-- CurrentVehicle and DriverPed Updater --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        playerPed = PlayerPedId()
        local tempVehicle = GetVehiclePedIsIn(playerPed, false)
        local tempDriver = GetPedInVehicleSeat(tempVehicle, -1)
        if tempVehicle ~= currentVehicle then
            harness = false
            seatbelt = false
            currentVehicle = tempVehicle
            if currentVehicle == nil or currentVehicle == 0 or currentVehicle == false then
                TriggerEvent("DensityModifierEnable", true)
            else
                driverPed = GetPedInVehicleSeat(currentVehicle, -1)
                if driverPed == playerPed then
                    TriggerEvent("DensityModifierEnable", true)
                    TriggerEvent("noshud", NosVehicles[currentVehicle], false)
                    TriggerEvent("tuner:setDriver")
                else
                    TriggerEvent("DensityModifierEnable", false)
                end
                TriggerServerEvent("vehicleMod:getHarness", GetVehicleNumberPlateText(currentVehicle))
            end
        elseif (tempDriver ~= driverPed and tempDriver ~= 0) or (tempDriver == 0 and driverPed == playerPed) then
            driverPed = tempDriver
            if driverPed == playerPed then
                -- Switched seat to driver
                if seatbelt then
                    toggleSeatbelt()
                end
                TriggerEvent("DensityModifierEnable", true)
                TriggerEvent("noshud", NosVehicles[currentVehicle], false)
                TriggerServerEvent("vehicleMod:getHarness", GetVehicleNumberPlateText(currentVehicle))
                TriggerEvent("tuner:setDriver")
            else
                if harness then
                    toggleHarness()
                elseif seatbelt then
                    toggleSeatbelt()
                else
                    TriggerServerEvent("vehicleMod:getHarness", GetVehicleNumberPlateText(currentVehicle))
                end

                TriggerEvent("DensityModifierEnable", false)
                TriggerEvent("noshud", 0, false)
            end

            TriggerEvent("seatbelt",false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        if currentVehicle ~= nil and currentVehicle ~= false and currentVehicle ~= 0 then
            if harness then
                DisableControlAction(1, 75, true)
                if IsDisabledControlJustPressed(1, 75) then
                    preventVehicleExit()
                end
            elseif IsControlJustPressed(1, 75) then
                endNos()
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(5000)
        end
    end
end)

-- Collision Thread --
-- Citizen.CreateThread(function()
--     Citizen.Wait(1000)
--     local lastCurrentVehicleBodyHealth = 0
--     local lastCurrentVehicleSpeed = 0
-- 
--     local function eject(percent, speed, trigger)
--         if math.random(math.ceil(speed)) > percent then
--             ejectionLUL()
--             if trigger then
--           --      TriggerEvent("civilian:alertPolice",50.0,"carcrash",0)
--             end
--         end
--     end
-- 
--     while true do
--         Citizen.Wait(1)
--         if currentVehicle ~= nil and currentVehicle ~= false and currentVehicle ~= 0 then
--             SetPedHelmet(playerPed, false)
--             if driverPed == playerPed then
--                 local currentEngineHealth = GetVehicleEngineHealth(currentVehicle)
--                 if currentEngineHealth < 0.0 then
--                     -- Dont blow up
--                     SetVehicleEngineHealth(currentVehicle,0.0)
--                 end
-- 
--                 local collision = HasEntityCollidedWithAnything(currentVehicle)
--                 if collision == false then
--                     lastCurrentVehicleSpeed = GetEntitySpeed(currentVehicle)
--                     lastCurrentVehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
--                     veloc = GetEntityVelocity(currentVehicle)
--                     if currentEngineHealth > 15.0 and (currentEngineHealth < 200.0 or lastCurrentVehicleBodyHealth < 60.0) then
--                         carCrash()
--                         stalled = true
--                         Citizen.Wait(1000)
--                     end
--                 else
--                     Citizen.Wait(100)
--                     local currentVehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
--                     local currentVehicleSpeed = GetEntitySpeed(currentVehicle)
--                     if currentEngineHealth > 0.0 and lastCurrentVehicleBodyHealth - currentVehicleBodyHealth > 20 then
--                         if lastCurrentVehicleSpeed > 35.5 and currentVehicleSpeed < (lastCurrentVehicleSpeed * 0.75) then
--                             if not IsThisModelABike(GetEntityModel(currentVehicle)) then
--                                 carCrash()
--                                 stalled = true
--                                 sendServerEventForPassengers("carhud:ejection:server", veloc)
--                                 if harness and harnessDurability > 0.0 then
--                                     harnessDurability = harnessDurability - 0.1                                                                                                       
--                                     TriggerServerEvent("vehicleMod:updateHarness", GetVehicleNumberPlateText(currentVehicle), harnessDurability)
--                                     if DecorExistOn(currentVehicle, "vehicleHarnessDur") then
--                                         DecorSetFloat(currentVehicle, "vehicleHarnessDur", harnessDurability)                                        
--                                     end
--                                     if harnessDurability <= 0.0 then
--                                         harnessDurability = 0.0
--                                         TriggerEvent("event:control:vehicleMod")
--                                         TriggerEvent('DoLongHudText', 'Harness Broken!', 2)
--                                     end
--                                 elseif not seatbelt then
--                                     eject(30.5, lastCurrentVehicleSpeed, true)
--                                 elseif seatbelt and lastCurrentVehicleSpeed > 41.6 then
--                                     eject(33.0, lastCurrentVehicleSpeed, false)
--                                 end
--                                 -- Buffer after crash
--                                 Citizen.Wait(1000)
--                                 lastCurrentVehicleSpeed = 0.0
--                                 lastCurrentVehicleBodyHealth = currentVehicleBodyHealth
--                             else
--                                 -- IsBike
--                                 carCrash()
--                                 local stallchance = math.random(1,3)
--                                 if stallchance == 3 then
--                                     stalled = true
--                                 end -- 1/3 stall chance on bikes maybe?
--                                 Citizen.Wait(1000)
--                                 lastCurrentVehicleSpeed = 0.0
--                                 lastCurrentVehicleBodyHealth = currentVehicleBodyHealth
--                             end
--                         end
--                     else
--                         if currentEngineHealth > 15.0 and (currentEngineHealth < 200.0 or currentVehicleBodyHealth < 60.0) then
--                             carCrash()
--                             stalled = true
--                             Citizen.Wait(1000)
--                         end
--                         lastCurrentVehicleSpeed = currentVehicleSpeed
--                         lastCurrentVehicleBodyHealth = currentVehicleBodyHealth
--                     end
--                 end
--             else
--                 -- Not driver
--                 Citizen.Wait(1000)
--             end
--         else
--             -- Not in veh
--             currentVehicleSpeed = 0
--             lastCurrentVehicleSpeed = 0
--             lastCurrentVehicleBodyHealth = 0
--             Citizen.Wait(4000)
--         end
--     end
-- end)
-- 
-- -- NOS Thread --
-- Citizen.CreateThread(function()
--     -- Handle NOS
--     while true do
--         Citizen.Wait(200)
--         if currentVehicle ~= nil and currentVehicle ~= false and currentVehicle ~= 0 and driverPed == playerPed then
--             if NosVehicles[currentVehicle] == nil then
--                 NosVehicles[currentVehicle] = 0
--             end
--             local vehModel = GetEntityModel(currentVehicle)
--             if IsControlPressed(1,209) and NosVehicles[currentVehicle] ~= nil then
--                 if not IsThisModelAHeli(vehModel) and not IsThisModelABoat(vehModel) and not IsThisModelABike(vehModel) and IsVehicleOnAllWheels(currentVehicle) and IsVehicleEngineOn(currentVehicle) then
--                     if GetEntitySpeed(currentVehicle) > 12.5 and NosVehicles[currentVehicle] > 0 then
--                         if GetEntitySpeed(currentVehicle) > 113.0 then -- 250mph
--                             SetVehicleEngineHealth(currentVehicle, 0.0)
--                             SetVehicleEngineOn(currentVehicle, false, true, true)
--                         elseif not disablenos then
--                             nosInit()
--                             TriggerEvent("noshud", NosVehicles[currentVehicle], true)
--                             NosVehicles[currentVehicle] = NosVehicles[currentVehicle] - 10
--                         end
--                     end
--                 end
--             end
--         else
--             Citizen.Wait(5000)
--         end
--     end
-- end)



function getVehicleInDirection()

	playerped = PlayerPedId()
    coordFrom = GetEntityCoords(playerped, 1)
    coordTo = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)

	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end


    local LastVehicle = nil
    local LicencePlate = {}
    LicencePlate.Index = false
    LicencePlate.Number = false

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end



RegisterNetEvent('fakeplate:accepted')
AddEventHandler('fakeplate:accepted', function(newplate, oldplate)
    local enough = exports["drp-inventory"]:hasEnoughOfItem("fakeplate",1)
    if not LicencePlate.Index and not LicencePlate.Number then
        local PlayerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPed)
        local Vehicle = GetClosestVehicle(Coords.x, Coords.y, Coords.z, 3.5, 0, 70)
        local VehicleCoords = GetEntityCoords(Vehicle)
        local Distance = Vdist(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, Coords.x, Coords.y, Coords.z)
        if Distance < 3.5 and not IsPedInAnyVehicle(PlayerPed, false) then
			LastVehicle = Vehicle
            if enough then
            loadAnimDict("amb@medic@standing@kneel@base")
            TaskPlayAnim(PlayerPed,"amb@medic@standing@kneel@base","base", 8.0, -8, -1, 6, 0, 0, 0, 0)
            FreezeEntityPosition(playerped, true)
            local finished = exports["drp-taskbar"]:taskBar(15000,"Changing plates", true)
            if finished == 100 then
            TriggerEvent("inventory:removeItem","fakeplate", 1)
            ClearPedTasks(playerped)
            FreezeEntityPosition(playerped, false)
            -- Wait 1 seconds
            Citizen.Wait(1000)
            TriggerEvent("DoLongHudText", 'You are now running on fake plates!')
            LicencePlate.Index = GetVehicleNumberPlateTextIndex(Vehicle)
            LicencePlate.Number = GetVehicleNumberPlateText(Vehicle)
            SetVehicleNumberPlateText(Vehicle, "NVW"..math.ceil(math.random(10000,99999)))
            TriggerEvent("keys:addNew",Vehicle)
        else
			TriggerEvent('DoLongHudText', 'No vehicle nearby.')
        end
    else
		TriggerEvent('DoLongHudText', 'You do not have a licence plate on you.')
    end
    end
end
end)

RegisterCommand("fakeplateoff", function()
    TriggerEvent("fakeplate:off")
    plate = GetVehicleNumberPlateText(pEntity)
             hasKeys = exports["drp-keys"]:hasKey(plate)
            
end)

RegisterNetEvent('fakeplate:off') 
AddEventHandler('fakeplate:off', function()

        local PlayerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPed)
        local Vehicle = GetClosestVehicle(Coords.x, Coords.y, Coords.z, 3.5, 0, 70)
        local VehicleCoords = GetEntityCoords(Vehicle)
        local Distance = Vdist(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, Coords.x, Coords.y, Coords.z)

        if ( (Distance < 3.5) and not IsPedInAnyVehicle(PlayerPed, false) ) then
		if (Vehicle == LastVehicle) then
			LastVehicle = nil

            loadAnimDict("amb@medic@standing@kneel@base")
            TaskPlayAnim(PlayerPed,"amb@medic@standing@kneel@base","base", 8.0, -8, -1, 6, 0, 0, 0, 0)
            FreezeEntityPosition(PlayerPed, true)
            local finished = exports["drp-taskbar"]:taskBar(15000,"Changing back to orginal plates", true)
            FreezeEntityPosition(PlayerPed, false)
			-- Wait 6 seconds
			Citizen.Wait(6000)
            -- POG SHIT WORKS NOW 
            TriggerEvent("DoLongHudText", 'You are now running on your orginal plates!')
			SetVehicleNumberPlateTextIndex(Vehicle, LicencePlate.Index)
			SetVehicleNumberPlateText(Vehicle, LicencePlate.Number)
			LicencePlate.Index = false
			LicencePlate.Number = false

        else
			TriggerEvent('DoLongHudText', 'Already on original plates!')
        end
    end
end)

function HarnessDur(currentVehicle)
   return DecorGetFloat(currentVehicle, "vehicleHarnessDur")
end

exports('HarnessDur', HarnessDur)


cfg = {
	deformationMultiplier = 1.25,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
	deformationExponent = 0.99,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	collisionDamageExponent = 0.99,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

	damageFactorEngine = 2,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorBody = 2,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorPetrolTank = 10.0,				-- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
	engineDamageExponent = 0.99,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	weaponsDamageMultiplier = -1,				-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
	degradingHealthSpeedFactor = 5,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
	cascadingFailureSpeedFactor = 5.0,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

	degradingFailureThreshold = 400.0,			-- Below this value, slow health degradation will set in
	cascadingFailureThreshold = 200.0,			-- Below this value, health cascading failure will set in
	engineSafeGuard = 175.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

	torqueMultiplierEnabled = true,				-- Decrease engine torque as engine gets more and more damaged

	limpMode = true,							-- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
	limpModeMultiplier = 0.25,					-- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25

	preventVehicleFlip = true,					-- If true, you can't turn over an upside down vehicle

	sundayDriver = false,						-- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
	sundayDriverAcceleratorCurve = 7.5,			-- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
	sundayDriverBrakeCurve = 5.0,				-- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers


	compatibilityMode = false,					-- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)

	randomTireBurstInterval = 0,				-- Number of minutes (statistically, not precisely) to drive above 22 mph before you get a tire puncture. 0=feature is disabled

	classDamageMultiplier = {
		[0] = 	0.8,		--	0: Compacts
				0.8,		--	1: Sedans
				0.8,		--	2: SUVs
				0.95,		--	3: Coupes
				0.9,		--	4: Muscle
				0.95,		--	5: Sports Classics
				0.95,		--	6: Sports
				0.95,		--	7: Super
				0.2,		--	8: Motorcycles
				0.7,		--	9: Off-road
				0.25,		--	10: Industrial
				0.35,		--	11: Utility
				0.85,		--	12: Vans
				1.0,		--	13: Cycles
				0.4,		--	14: Boats
				0.7,		--	15: Helicopters
				0.7,		--	16: Planes
				0.75,		--	17: Service
				0.4,		--	18: Emergency
				0.67,		--	19: Military
				0.43,		--	20: Commercial
				1.0			--	21: Trains
	}
}




local pedInSameVehicleLast=false
local vehicle
local lastVehicle
local vehicleClass
local fCollisionDamageMult = 0.0
local fDeformationDamageMult = 0.0
local fEngineDamageMult = 0.0
local fBrakeForce = 1.0
local isBrakingForward = false
local isBrakingReverse = false

local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0
local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0

local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0

local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0
local tireBurstLuckyNumber

local repairCost = 0

math.randomseed(GetGameTimer());

local tireBurstMaxNumber = cfg.randomTireBurstInterval * 1200; 												-- the tire burst lottery runs roughly 1200 times per minute
if cfg.randomTireBurstInterval ~= 0 then tireBurstLuckyNumber = math.random(tireBurstMaxNumber) end			-- If we hit this number again randomly, a tire will burst.

local function notification(msg)
	TriggerEvent("DoLongHudText", msg)
end

local function isPedDrivingAVehicle()
	local ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		-- Check if ped is in driver seat
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			-- We don't want planes, helicopters, bicycles and trains
			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end

local function fscale(inputValue, originalMin, originalMax, newBegin, newEnd, curve)
	local OriginalRange = 0.0
	local NewRange = 0.0
	local zeroRefCurVal = 0.0
	local normalizedCurVal = 0.0
	local rangedValue = 0.0
	local invFlag = 0

	if (curve > 10.0) then curve = 10.0 end
	if (curve < -10.0) then curve = -10.0 end

	curve = (curve * -.1)
	curve = 10.0 ^ curve

	if (inputValue < originalMin) then
	  inputValue = originalMin
	end
	if inputValue > originalMax then
	  inputValue = originalMax
	end

	OriginalRange = originalMax - originalMin

	if (newEnd > newBegin) then
		NewRange = newEnd - newBegin
	else
	  NewRange = newBegin - newEnd
	  invFlag = 1
	end

	zeroRefCurVal = inputValue - originalMin
	normalizedCurVal  =  zeroRefCurVal / OriginalRange

	if (originalMin > originalMax ) then
	  return 0
	end

	if (invFlag == 0) then
		rangedValue =  ((normalizedCurVal ^ curve) * NewRange) + newBegin
	else
		rangedValue =  newBegin - ((normalizedCurVal ^ curve) * NewRange)
	end

	return rangedValue
end



local function tireBurstLottery()
	local tireBurstNumber = math.random(tireBurstMaxNumber)
	if tireBurstNumber == tireBurstLuckyNumber then
		-- We won the lottery, lets burst a tire.
		if GetVehicleTyresCanBurst(vehicle) == false then return end
		local numWheels = GetVehicleNumberOfWheels(vehicle)
		local affectedTire
		if numWheels == 2 then
			affectedTire = (math.random(2)-1)*4		-- wheel 0 or 4
		elseif numWheels == 4 then
			affectedTire = (math.random(4)-1)
			if affectedTire > 1 then affectedTire = affectedTire + 2 end	-- 0, 1, 4, 5
		elseif numWheels == 6 then
			affectedTire = (math.random(6)-1)
		else
			affectedTire = 0
		end
		SetVehicleTyreBurst(vehicle, affectedTire, false, 1000.0)
		tireBurstLuckyNumber = math.random(tireBurstMaxNumber)			-- Select a new number to hit, just in case some numbers occur more often than others
	end
end



if cfg.torqueMultiplierEnabled or cfg.preventVehicleFlip or cfg.limpMode then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if cfg.torqueMultiplierEnabled or cfg.sundayDriver or cfg.limpMode then
				if pedInSameVehicleLast then
					local factor = 1.0
					if cfg.torqueMultiplierEnabled and healthEngineNew < 900 then
						factor = (healthEngineNew+200.0) / 1100
					end
					if cfg.sundayDriver and GetVehicleClass(vehicle) ~= 14 then -- Not for boats
						local accelerator = GetControlValue(2,71)
						local brake = GetControlValue(2,72)
						local speed = GetEntitySpeedVector(vehicle, true)['y']
						-- Change Braking force
						local brk = fBrakeForce
						if speed >= 1.0 then
							-- Going forward
							if accelerator > 127 then
								-- Forward and accelerating
								local acc = fscale(accelerator, 127.0, 254.0, 0.1, 1.0, 10.0-(cfg.sundayDriverAcceleratorCurve*2.0))
								factor = factor * acc
							end
							if brake > 127 then
								-- Forward and braking
								isBrakingForward = true
								brk = fscale(brake, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfg.sundayDriverBrakeCurve*2.0))
							end
						elseif speed <= -1.0 then
							-- Going reverse
							if brake > 127 then
								-- Reversing and accelerating (using the brake)
								local rev = fscale(brake, 127.0, 254.0, 0.1, 1.0, 10.0-(cfg.sundayDriverAcceleratorCurve*2.0))
								factor = factor * rev
							end
							if accelerator > 127 then
								-- Reversing and braking (Using the accelerator)
								isBrakingReverse = true
								brk = fscale(accelerator, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfg.sundayDriverBrakeCurve*2.0))
							end
						else
							-- Stopped or almost stopped or sliding sideways
							local entitySpeed = GetEntitySpeed(vehicle)
							if entitySpeed < 1 then
								-- Not sliding sideways
								if isBrakingForward == true then
									--Stopped or going slightly forward while braking
									-- DisableControlAction(2,72,true) -- Disable Brake until user lets go of brake
									SetVehicleForwardSpeed(vehicle,speed*0.98)
									SetVehicleBrakeLights(vehicle,true)
								end
								if isBrakingReverse == true then
									--Stopped or going slightly in reverse while braking
									-- DisableControlAction(2,71,true) -- Disable reverse Brake until user lets go of reverse brake (Accelerator)
									SetVehicleForwardSpeed(vehicle,speed*0.98)
									SetVehicleBrakeLights(vehicle,true)
								end
								if isBrakingForward == true and GetDisabledControlNormal(2,72) == 0 then
									-- We let go of the brake
									isBrakingForward=false
								end
								if isBrakingReverse == true and GetDisabledControlNormal(2,71) == 0 then
									-- We let go of the reverse brake (Accelerator)
									isBrakingReverse=false
								end
							end
						end
						if brk > fBrakeForce - 0.02 then brk = fBrakeForce end -- Make sure we can brake max.
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', brk)  -- Set new Brake Force multiplier
					end
					if cfg.limpMode == true and healthEngineNew < cfg.engineSafeGuard + 5 then
						factor = cfg.limpModeMultiplier
					end
					SetVehicleEngineTorqueMultiplier(vehicle, factor)
				end
			end
			if cfg.preventVehicleFlip then
				local roll = GetEntityRoll(vehicle)
				if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					DisableControlAction(2,59,true) -- Disable left/right
					DisableControlAction(2,60,true) -- Disable up/down
				end
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		local ped = GetPlayerPed(-1)
		if isPedDrivingAVehicle() then
			vehicle = GetVehiclePedIsIn(ped, false)
			vehicleClass = GetVehicleClass(vehicle)
			healthEngineCurrent = GetVehicleEngineHealth(vehicle)
			if healthEngineCurrent == 1000 then healthEngineLast = 1000.0 end
			healthEngineNew = healthEngineCurrent
			healthEngineDelta = healthEngineLast - healthEngineCurrent
			healthEngineDeltaScaled = healthEngineDelta * cfg.damageFactorEngine * cfg.classDamageMultiplier[vehicleClass]

			healthBodyCurrent = GetVehicleBodyHealth(vehicle)
			if healthBodyCurrent == 1000 then healthBodyLast = 1000.0 end
			healthBodyNew = healthBodyCurrent
			healthBodyDelta = healthBodyLast - healthBodyCurrent
			healthBodyDeltaScaled = healthBodyDelta * cfg.damageFactorBody * cfg.classDamageMultiplier[vehicleClass]

			healthPetrolTankCurrent = GetVehiclePetrolTankHealth(vehicle)
			if cfg.compatibilityMode and healthPetrolTankCurrent < 1 then
				--	SetVehiclePetrolTankHealth(vehicle, healthPetrolTankLast)
				--	healthPetrolTankCurrent = healthPetrolTankLast
				healthPetrolTankLast = healthPetrolTankCurrent
			end
			if healthPetrolTankCurrent == 1000 then healthPetrolTankLast = 1000.0 end
			healthPetrolTankNew = healthPetrolTankCurrent
			healthPetrolTankDelta = healthPetrolTankLast-healthPetrolTankCurrent
			healthPetrolTankDeltaScaled = healthPetrolTankDelta * cfg.damageFactorPetrolTank * cfg.classDamageMultiplier[vehicleClass]

			if healthEngineCurrent > cfg.engineSafeGuard+1 then
				SetVehicleUndriveable(vehicle,false)
			end

			if healthEngineCurrent <= cfg.engineSafeGuard+1 and cfg.limpMode == false then
				SetVehicleUndriveable(vehicle,true)
			end

			-- If ped spawned a new vehicle while in a vehicle or teleported from one vehicle to another, handle as if we just entered the car
			if vehicle ~= lastVehicle then
				pedInSameVehicleLast = false
			end


			if pedInSameVehicleLast == true then
				-- Damage happened while in the car = can be multiplied

				-- Only do calculations if any damage is present on the car. Prevents weird behavior when fixing using trainer or other script
				if healthEngineCurrent ~= 1000.0 or healthBodyCurrent ~= 1000.0 or healthPetrolTankCurrent ~= 1000.0 then

					-- Combine the delta values (Get the largest of the three)
					local healthEngineCombinedDelta = math.max(healthEngineDeltaScaled, healthBodyDeltaScaled, healthPetrolTankDeltaScaled)

					-- If huge damage, scale back a bit
					if healthEngineCombinedDelta > (healthEngineCurrent - cfg.engineSafeGuard) then
						healthEngineCombinedDelta = healthEngineCombinedDelta * 0.7
					end

					-- If complete damage, but not catastrophic (ie. explosion territory) pull back a bit, to give a couple of seconds og engine runtime before dying
					if healthEngineCombinedDelta > healthEngineCurrent then
						healthEngineCombinedDelta = healthEngineCurrent - (cfg.cascadingFailureThreshold / 5)
					end


					------- Calculate new value

					healthEngineNew = healthEngineLast - healthEngineCombinedDelta


					------- Sanity Check on new values and further manipulations

					-- If somewhat damaged, slowly degrade until slightly before cascading failure sets in, then stop

					if healthEngineNew > (cfg.cascadingFailureThreshold + 5) and healthEngineNew < cfg.degradingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.038 * cfg.degradingHealthSpeedFactor)
					end

					-- If Damage is near catastrophic, cascade the failure
					if healthEngineNew < cfg.cascadingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.1 * cfg.cascadingFailureSpeedFactor)
					end

					-- Prevent Engine going to or below zero. Ensures you can reenter a damaged car.
					if healthEngineNew < cfg.engineSafeGuard then
						healthEngineNew = cfg.engineSafeGuard
					end

					-- Prevent Explosions
					if cfg.compatibilityMode == false and healthPetrolTankCurrent < 750 then
						healthPetrolTankNew = 750.0
					end

					-- Prevent negative body damage.
					if healthBodyNew < 0  then
						healthBodyNew = 0.0
					end
				end
			else
				-- Just got in the vehicle. Damage can not be multiplied this round
				-- Set vehicle handling data
				fDeformationDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult')
				fBrakeForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
				local newFDeformationDamageMult = fDeformationDamageMult ^ cfg.deformationExponent	-- Pull the handling file value closer to 1
				if cfg.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', newFDeformationDamageMult * cfg.deformationMultiplier) end  -- Multiply by our factor
				if cfg.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', cfg.weaponsDamageMultiplier/cfg.damageFactorBody) end -- Set weaponsDamageMultiplier and compensate for damageFactorBody

				--Get the CollisionDamageMultiplier
				fCollisionDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult')
				--Modify it by pulling all number a towards 1.0
				local newFCollisionDamageMultiplier = fCollisionDamageMult ^ cfg.collisionDamageExponent	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult', newFCollisionDamageMultiplier)

				--Get the EngineDamageMultiplier
				fEngineDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult')
				--Modify it by pulling all number a towards 1.0
				local newFEngineDamageMult = fEngineDamageMult ^ cfg.engineDamageExponent	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult', newFEngineDamageMult)

				-- If body damage catastrophic, reset somewhat so we can get new damage to multiply
				if healthBodyCurrent < cfg.cascadingFailureThreshold then
					healthBodyNew = cfg.cascadingFailureThreshold
				end
				pedInSameVehicleLast = true
			end

			-- set the actual new values
			if healthEngineNew ~= healthEngineCurrent then
				SetVehicleEngineHealth(vehicle, healthEngineNew)
			end
			if healthBodyNew ~= healthBodyCurrent then SetVehicleBodyHealth(vehicle, healthBodyNew) end
			if healthPetrolTankNew ~= healthPetrolTankCurrent then SetVehiclePetrolTankHealth(vehicle, healthPetrolTankNew) end

			-- Store current values, so we can calculate delta next time around
			healthEngineLast = healthEngineNew
			healthBodyLast = healthBodyNew
			healthPetrolTankLast = healthPetrolTankNew
			lastVehicle=vehicle
			if cfg.randomTireBurstInterval ~= 0 and GetEntitySpeed(vehicle) > 10 then tireBurstLottery() end
		else
			if pedInSameVehicleLast == true then
				-- We just got out of the vehicle
				lastVehicle = GetVehiclePedIsIn(ped, true)				
				if cfg.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fDeformationDamageMult', fDeformationDamageMult) end -- Restore deformation multiplier
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fBrakeForce', fBrakeForce)  -- Restore Brake Force multiplier
				if cfg.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fWeaponDamageMult', cfg.weaponsDamageMultiplier) end	-- Since we are out of the vehicle, we should no longer compensate for bodyDamageFactor
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fCollisionDamageMult', fCollisionDamageMult) -- Restore the original CollisionDamageMultiplier
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fEngineDamageMult', fEngineDamageMult) -- Restore the original EngineDamageMultiplier
			end
			pedInSameVehicleLast = false
		end
	end
end)

