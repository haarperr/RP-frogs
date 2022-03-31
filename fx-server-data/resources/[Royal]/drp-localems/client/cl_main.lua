local drivingStyle = 1074528293
local stopRange = 15.0
local speed = 20.5
local spawnDistance = 500
local defaultTimeout = 90000
local currentEmsVehicle = 0
local currentEmsDriver = 0

local locations = {
    [1] = {x = 1322.8845, y =  -2408.4050, z =  50.9380, h =  160.2823},
    [2] = {x = 278.3394, y =  -2659.0352, z =  18.4164, h =  83.1047},
    [3] = {x = 162.4053, y =  -2414.3430, z =  6.5111, h =  145.7557},
    [4] = {x = -145.8261, y =  -1986.8018, z =  22.7774, h =  6.0705},
    [5] = {x = -763.5614, y =  -2175.4985, z =  15.2608, h =  135.5753},
    [6] = {x = -1054.8438, y =  -1503.0361, z =  5.1154, h =  34.6915},
    [7] = {x = -1441.8497, y =  -901.4394, z =  10.9279, h =  235.1443},
    [8] = {x = -847.2868, y =  -990.0735, z =  14.3151, h =  207.9588},
    [9] = {x = -471.8099, y =  -1221.1919, z =  21.8093, h =  7.4875},
    [10] = {x = -243.1280, y =  -587.8333, z =  34.2882, h =  160.7281},
    [11] = {x = 226.2309, y =  -852.8980, z =  29.9688, h =  246.9908},
    [12] = {x = 340.2568, y =  -1467.6747, z =  29.4378, h =  227.2265},
    [13] = {x = 1378.6744, y =  -1074.0110, z =  52.9701, h =  113.8000},
    [14] = {x = 1312.1893, y =  -719.3542, z =  64.9356, h =  78.8778},
    [15] = {x = 883.7424, y =  20.5668, z =  78.8544, h =  52.0342},
    [16] = {x = 287.2773, y =  863.3387, z =  195.4579, h =  159.9182},
    [17] = {x = -1532.8143, y =  238.0054, z =  61.3502, h =  273.2794},
    [18] = {x = -1733.5908, y =  -428.9887, z =  43.5230, h =  320.8696},
    [19] = {x = -1766.6284, y =  822.8953, z =  141.1792, h =  210.9763},
    [20] = {x = -1491.7439, y =  2140.5913, z =  55.8012, h =  283.3195},
    [21] = {x = -490.2356, y =  2780.5002, z =  39.7359, h =  288.6544},
    [22] = {x = 1552.8551, y =  2778.5171, z =  38.1639, h =  303.9982},
    [23] = {x = 2809.1824, y =  2780.1167, z =  54.1630, h =  107.1790},
    [24] = {x = 2821.6865, y =  4499.4087, z =  47.2799, h =  42.0959},
    [25] = {x = 1629.6913, y =  4568.3457, z =  44.8268, h =  264.2533},
    [26] = {x = 1956.0903, y =  6315.0811, z =  44.0768, h =  46.3251},
    [27] = {x = -739.5274, y =  4413.5010, z =  20.7286, h =  78.5943},
    [28] = {x = -3199.7434, y =  912.9976, z =  14.3713, h =  271.0326},
    [29] = {x = -350.1258, y =  -2719.3306, z =  6.0013, h =  334.5772},
    [30] = {x = 1661.4265, y =  -2509.3733, z =  78.0616, h =  345.5394},
    [31] = {x = 83.7243, y =  -599.7020, z =  44.2237, h =  153.6986},
    [32] = {x = -1354.5626, y =  -731.7192, z =  11.0422, h =  113.4602},
    [33] = {x = -989.1730, y =  -792.5524, z =  16.3173, h =  149.2663},
    [34] = {x = -667.4376, y =  -186.1555, z =  37.6795, h =  203.2063},
    [35] = {x = -1621.6577, y =  -476.7811, z =  37.6203, h =  227.5011},
    [36] = {x = -76.7262, y =  289.7360, z =  105.7832, h =  242.2530},
    [37] = {x = 488.4796, y =  -2099.5378, z =  17.8462, h =  131.0628},
    [38] = {x = 1110.6584, y =  -867.8627, z =  51.9312, h =  343.6902},
    [39] = {x = 491.6109, y =  972.9086, z =  206.2258, h =  157.0617},
    [40] = {x = -540.7803, y =  1944.2933, z =  206.5898, h =  340.3127},
    [41] = {x = 2.7926, y =  3607.3899, z =  40.9183, h =  80.8548},
    [42] = {x = 1947.9940, y =  638.8982, z =  179.1119, h =  179.2566},
    [43] = {x = 62.4520, y =  6594.8462, z =  31.4350, h =  310.1152},
    [44] = {x = -415.1430, y =  6125.9185, z =  31.3067, h =  131.3404},
    [45] = {x = -1265.4548, y =  5265.3945, z =  50.6459, h =  119.6153},
    [46] = {x = -2220.3018, y =  4253.7866, z =  46.5641, h =  57.6873},
    [47] = {x = -2241.9951, y =  3364.8530, z =  33.3694, h =  268.9908},
    [48] = {x = -2421.0276, y =  2281.1995, z =  32.9294, h =  221.3786},
    [49] = {x = -2174.4355, y =  -318.9713, z =  13.0118, h =  163.9823},
    [50] = {x = -1775.3977, y =  -464.5201, z =  40.7534, h =  251.5097},
    [51] = {x = -2301.5518, y =  467.0646, z =  174.4249, h =  341.9511},
    [52] = {x = -1514.3982, y =  2149.9800, z =  55.9239, h =  255.9226},
    [53] = {x = -475.1984, y =  2827.2642, z =  35.7297, h =  32.9826},
    [54] = {x = 1827.8597, y =  3779.9646, z =  33.6113, h =  27.8567},
    [55] = {x = 925.1007, y =  3549.1335, z =  34.0227, h =  183.4221},
    [56] = {x = 3007.9595, y =  3522.7292, z =  71.4233, h =  0.6903},
    [57] = {x = 2452.5754, y =  4225.1069, z =  37.0306, h =  4.4080},
    [58] = {x = 2186.7383, y =  4760.9380, z =  41.1676, h =  348.5103},
    [59] = {x = 2579.4287, y =  4710.7266, z =  33.5552, h =  46.8425},
    [60] = {x = 2395.1216, y =  5138.8301, z =  47.4174, h =  323.7990},
    [61] = {x = 1574.9750, y =  6439.6787, z =  24.6301, h =  170.0821},
    [62] = {x = 515.9646, y =  1093.4117, z =  230.1072, h =  217.9647},
    [63] = {x = -515.9873, y = 643.7718, z = 136.8152, h = 15.2146}

}

RegisterCommand('localems', function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)


    local car = GetHashKey("emsnspeedo")
    local ped = GetHashKey("s_m_m_paramedic_01")
    RequestModel(car)
    RequestModel(ped)
    while not HasModelLoaded(car) and not HasModelLoaded(ped) do
        Citizen.Wait(0)
    end
    
    -- get the closest location
    local closest = nil
    local closest_dist = nil
    for k,v in pairs(locations) do
        local dist = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)
        if closest_dist == nil or dist < closest_dist then
            closest_dist = dist
            closest = k
        end
    end

    Citizen.Trace(locations[closest].x .. " " .. locations[closest].y .. " " .. locations[closest].z .. " " .. locations[closest].h .. "\n")
    Citizen.Trace(closest_dist .. "\n")
    Citizen.Trace(closest .. "\n")


    
    -- spawn the vehicle
    local veh = CreateVehicle("emsnspeedo", locations[closest].x, locations[closest].y, locations[closest].z, locations[closest].h, true, true)
    SetVehicleNumberPlateText(veh, "LOCALEMS")
    SetVehicleOnGroundProperly(veh)

    local ped = CreatePedInsideVehicle(veh, 26, ped, -1, true, true)

    -- Flags
    SetVehicleHasBeenDrivenFlag(vehicle, true)
    SetVehicleDoorsLockedForAllPlayers(vehicle, true)
    SetVehicleForwardSpeed(vehicle, 120.0)
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleLights(vehicle, 2)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetPedAsEnemy(ped, false)
    SetPedCanPlayAmbientAnims(ped, false)
    SetPedCanPlayAmbientBaseAnims(ped, false)
    SetPedCanPlayGestureAnims(ped, false)
    SetPedCanPlayVisemeAnims(ped, false)
    SetPedCanRagdoll(ped, false)
    SetPedCanSwitchWeapon(ped, false)
    SetPedCanBeShotInVehicle(ped, false)
    SetEntityInvincible(ped, true)
    SetDriveTaskDrivingStyle(ped, drivingStyle)
    SetEntityAsMissionEntity(ped, true, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetEntityCanBeDamaged(vehicle, false)
    SetVehicleDamageModifier(vehicle, 0.0)
    SetVehicleEngineCanDegrade(vehicle, false)
    SetEntityCanBeDamaged(ped, false)
    SetPedCanBeTargetted(ped, false)
    SetDriverAbility(ped, 1.0)
    SetDriverAggressiveness(ped, 0.0)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedConfigFlag(ped, 251, true)
    SetPedConfigFlag(ped, 64, true)
    SetPedStayInVehicleWhenJacked(ped, true)
    SetPedCanBeDraggedOut(ped, false)

    -- enable sirens
    SetVehicleSiren(vehicle, true)

    -- Set coordinates to player
    TaskVehicleDriveToCoordLongrange(ped, veh, locations[closest].x, locations[closest].y, locations[closest].z, 30.0, drivingStyle, 1.0, stopRange)




end)

