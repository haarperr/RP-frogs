--------------------
------ LOCALS ------
--------------------
local tasking = false
local rnd = 0
local blip = 0
local deliveryPed = 0
local gangTaskArea = "local"
local mygang = "local"
local watching = "local"
local watchinglist = {}
local drugStorePed = 0
local vehspawn = false
local oxyVehicle = 0
local firstdeal = false
local lunchtime = false
local rollcount = 10
local cashrollcount = 10
local bandcount = 10
local cashstackamount = 1
local inkedmoneybagamount = 1

local OxyDropOffs = {
    [1] = {
        ['x'] = 74.5,
        ['y'] = -762.17,
        ['z'] = 31.68,
        ['h'] = 160.98,
        ['info'] = ' 1'
    },
    [2] = {
        ['x'] = 100.58,
        ['y'] = -644.11,
        ['z'] = 44.23,
        ['h'] = 69.11,
        ['info'] = ' 2'
    },
    [3] = {
        ['x'] = 175.45,
        ['y'] = -445.95,
        ['z'] = 41.1,
        ['h'] = 92.72,
        ['info'] = ' 3'
    },
    [4] = {
        ['x'] = 130.3,
        ['y'] = -246.26,
        ['z'] = 51.45,
        ['h'] = 219.63,
        ['info'] = ' 4'
    },
    [5] = {
        ['x'] = 198.1,
        ['y'] = -162.11,
        ['z'] = 56.35,
        ['h'] = 340.09,
        ['info'] = ' 5'
    },
    [6] = {
        ['x'] = 341.0,
        ['y'] = -184.71,
        ['z'] = 58.07,
        ['h'] = 159.33,
        ['info'] = ' 6'
    },
    [7] = {
        ['x'] = -26.96,
        ['y'] = -368.45,
        ['z'] = 39.69,
        ['h'] = 251.12,
        ['info'] = ' 7'
    },
    [8] = {
        ['x'] = -155.88,
        ['y'] = -751.76,
        ['z'] = 33.76,
        ['h'] = 251.82,
        ['info'] = ' 8'
    },
    [9] = {
        ['x'] = -305.02,
        ['y'] = -226.17,
        ['z'] = 36.29,
        ['h'] = 306.04,
        ['info'] = ' 9'
    },
    [10] = {
        ['x'] = -347.19,
        ['y'] = -791.04,
        ['z'] = 33.97,
        ['h'] = 3.06,
        ['info'] = ' 10'
    },
    [11] = {
        ['x'] = -703.75,
        ['y'] = -932.93,
        ['z'] = 19.22,
        ['h'] = 87.86,
        ['info'] = ' 11'
    },
    [12] = {
        ['x'] = -659.35,
        ['y'] = -256.83,
        ['z'] = 36.23,
        ['h'] = 118.92,
        ['info'] = ' 12'
    },
    [13] = {
        ['x'] = -934.18,
        ['y'] = -124.28,
        ['z'] = 37.77,
        ['h'] = 205.79,
        ['info'] = ' 13'
    },
    [14] = {
        ['x'] = -1214.3,
        ['y'] = -317.57,
        ['z'] = 37.75,
        ['h'] = 18.39,
        ['info'] = ' 14'
    },
    [15] = {
        ['x'] = -822.83,
        ['y'] = -636.97,
        ['z'] = 27.9,
        ['h'] = 160.23,
        ['info'] = ' 15'
    },
    [16] = {
        ['x'] = 308.04,
        ['y'] = -1386.09,
        ['z'] = 31.79,
        ['h'] = 47.23,
        ['info'] = ' 16'
    }, -- what the fuck lmao
    [17] = {
        ['x'] = 175.98,
        ['y'] = -1542.48,
        ['z'] = 29.27,
        ['h'] = 316.21,
        ['info'] = ' Central 3'
    },
    [18] = {
        ['x'] = -99.69,
        ['y'] = -1577.74,
        ['z'] = 31.73,
        ['h'] = 231.66,
        ['info'] = ' Central 4'
    },
    [19] = {
        ['x'] = -171.68,
        ['y'] = -1659.11,
        ['z'] = 33.47,
        ['h'] = 85.41,
        ['info'] = ' Central 5'
    },
    [20] = {
        ['x'] = -209.75,
        ['y'] = -1632.29,
        ['z'] = 33.9,
        ['h'] = 177.99,
        ['info'] = ' Central 6'
    },
    [21] = {
        ['x'] = -262.65,
        ['y'] = -1580.04,
        ['z'] = 31.86,
        ['h'] = 251.02,
        ['info'] = ' Central 7'
    },
    [22] = {
        ['x'] = -182.0,
        ['y'] = -1433.79,
        ['z'] = 31.31,
        ['h'] = 210.92,
        ['info'] = ' Central 8'
    },
    [23] = {
        ['x'] = -83.37,
        ['y'] = -1415.39,
        ['z'] = 29.33,
        ['h'] = 180.98,
        ['info'] = ' Central 9'
    },
    [24] = {
        ['x'] = -39.13,
        ['y'] = -1473.67,
        ['z'] = 31.65,
        ['h'] = 5.17,
        ['info'] = ' Central 10'
    },
    [25] = {
        ['x'] = 45.16,
        ['y'] = -1475.65,
        ['z'] = 29.36,
        ['h'] = 136.92,
        ['info'] = ' Central 11'
    },
    [26] = {
        ['x'] = 158.52,
        ['y'] = -1496.02,
        ['z'] = 29.27,
        ['h'] = 133.49,
        ['info'] = ' Central 12'
    },
    [27] = {
        ['x'] = 43.58,
        ['y'] = -1599.87,
        ['z'] = 29.61,
        ['h'] = 50.3,
        ['info'] = ' Central 13'
    },
    [28] = {
        ['x'] = 7.97,
        ['y'] = -1662.14,
        ['z'] = 29.33,
        ['h'] = 318.63,
        ['info'] = ' Central 14'
    },
    [29] = {
        ['x'] = -726.92,
        ['y'] = -854.64,
        ['z'] = 22.8,
        ['h'] = 2.0,
        ['info'] = ' West 1'
    },
    [30] = {
        ['x'] = -713.09,
        ['y'] = -886.66,
        ['z'] = 23.81,
        ['h'] = 357.65,
        ['info'] = ' West 2'
    },
    [31] = {
        ['x'] = -591.45,
        ['y'] = -891.2,
        ['z'] = 25.95,
        ['h'] = 91.53,
        ['info'] = ' West 3'
    },
    [32] = {
        ['x'] = -683.59,
        ['y'] = -945.62,
        ['z'] = 20.85,
        ['h'] = 180.74,
        ['info'] = ' West 4'
    },
    [33] = {
        ['x'] = -765.92,
        ['y'] = -920.94,
        ['z'] = 18.94,
        ['h'] = 180.44,
        ['info'] = ' West 5'
    },
    [34] = {
        ['x'] = -807.45,
        ['y'] = -957.09,
        ['z'] = 15.29,
        ['h'] = 340.4,
        ['info'] = ' West 6'
    },
    [35] = {
        ['x'] = -822.88,
        ['y'] = -973.96,
        ['z'] = 14.72,
        ['h'] = 126.28,
        ['info'] = ' West 7'
    },
    [36] = {
        ['x'] = -657.53,
        ['y'] = -729.91,
        ['z'] = 27.84,
        ['h'] = 309.58,
        ['info'] = ' West 8'
    },
    [37] = {
        ['x'] = -618.39,
        ['y'] = -750.71,
        ['z'] = 26.66,
        ['h'] = 85.6,
        ['info'] = ' West 9'
    },
    [38] = {
        ['x'] = -548.36,
        ['y'] = -854.53,
        ['z'] = 28.82,
        ['h'] = 352.84,
        ['info'] = ' West 10'
    },
    [39] = {
        ['x'] = -518.18,
        ['y'] = -804.65,
        ['z'] = 30.8,
        ['h'] = 267.32,
        ['info'] = ' West 11'
    },
    [40] = {
        ['x'] = -509.05,
        ['y'] = -737.77,
        ['z'] = 32.6,
        ['h'] = 174.97,
        ['info'] = ' West 12'
    },
    [41] = {
        ['x'] = -567.5,
        ['y'] = -717.77,
        ['z'] = 33.43,
        ['h'] = 268.02,
        ['info'] = ' West 13'
    },
    [42] = {
        ['x'] = -654.89,
        ['y'] = -732.13,
        ['z'] = 27.56,
        ['h'] = 309.15,
        ['info'] = ' West 14'
    },
    [43] = {
        ['x'] = 483.17,
        ['y'] = -1827.35,
        ['z'] = 27.86,
        ['h'] = 135.87,
        ['info'] = ' East Side 1'
    },
    [44] = {
        ['x'] = 475.87,
        ['y'] = -1798.45,
        ['z'] = 28.49,
        ['h'] = 229.85,
        ['info'] = ' East Side 2'
    },
    [45] = {
        ['x'] = 503.54,
        ['y'] = -1765.06,
        ['z'] = 28.51,
        ['h'] = 67.61,
        ['info'] = ' East Side 3'
    },
    [46] = {
        ['x'] = 512.0,
        ['y'] = -1842.13,
        ['z'] = 27.9,
        ['h'] = 138.1,
        ['info'] = ' East Side 4'
    },
    [47] = {
        ['x'] = 466.89,
        ['y'] = -1852.81,
        ['z'] = 27.72,
        ['h'] = 310.97,
        ['info'] = ' East Side 5'
    },
    [48] = {
        ['x'] = 431.33,
        ['y'] = -1882.85,
        ['z'] = 26.85,
        ['h'] = 39.7,
        ['info'] = ' East Side 6'
    },
    [49] = {
        ['x'] = 410.64,
        ['y'] = -1908.57,
        ['z'] = 25.46,
        ['h'] = 80.03,
        ['info'] = ' East Side 7'
    },
    [50] = {
        ['x'] = 192.93,
        ['y'] = -2027.95,
        ['z'] = 18.29,
        ['h'] = 251.25,
        ['info'] = ' East Side 8'
    },
    [50] = {
        ['x'] = 184.05,
        ['y'] = -2004.77,
        ['z'] = 18.31,
        ['h'] = 49.81,
        ['info'] = ' East Side 9'
    },
    [51] = {
        ['x'] = 212.4,
        ['y'] = -1971.66,
        ['z'] = 20.31,
        ['h'] = 63.83,
        ['info'] = ' East Side 10'
    },
    [52] = {
        ['x'] = 266.85,
        ['y'] = -1964.41,
        ['z'] = 23.0,
        ['h'] = 49.59,
        ['info'] = ' East Side 11'
    },
    [53] = {
        ['x'] = 313.05,
        ['y'] = -1918.57,
        ['z'] = 25.65,
        ['h'] = 315.88,
        ['info'] = ' East Side 12'
    },
    [54] = {
        ['x'] = 282.63,
        ['y'] = -1948.96,
        ['z'] = 24.39,
        ['h'] = 40.21,
        ['info'] = ' East Side 13'
    },
    [55] = {
        ['x'] = 250.44,
        ['y'] = -1995.9,
        ['z'] = 20.32,
        ['h'] = 324.5,
        ['info'] = ' East Side 14'
    },
    [56] = {
        ['x'] = 270.54,
        ['y'] = -1706.13,
        ['z'] = 29.31,
        ['h'] = 46.82,
        ['info'] = ' Central 1'
    },
    [57] = {
        ['x'] = 167.78,
        ['y'] = -1635.0,
        ['z'] = 29.3,
        ['h'] = 22.04,
        ['info'] = ' Central 2'
    }
}

local pillWorker = {
    ['x'] = -1487.1783447266,
    ['y'] = -909.90631103516,
    ['z'] = 10.02357673645,
    ['h'] = 144.23208618164,
    ['info'] = 'boop bap'
}

local carpick = {
    [1] = "felon",
    [2] = "kuruma",
    [3] = "sultan",
    [4] = "granger",
    [5] = "tailgater"
}

local carspawns = {
    [1] = {
        ['x'] = 199.42840576172,
        ['y'] = -1852.0401611328,
        ['z'] = 26.831035614014,
        ['h'] = 140.05461120605,
        ['info'] = ' car 8'
    },
    [2] = {
        ['x'] = 204.01142883301,
        ['y'] = -1856.0180664063,
        ['z'] = 26.831539154053,
        ['h'] = 140.54141235352,
        ['info'] = ' car 1'
    },
    [3] = {
        ['x'] = 208.28317260742,
        ['y'] = -1860.2180175781,
        ['z'] = 26.757471084595,
        ['h'] = 140.10749816895,
        ['info'] = ' car 2'
    }
}
-----------------------
------ NETEVENTS ------
-----------------------

RegisterNetEvent('lunchtime')
AddEventHandler('lunchtime', function(pass)
    lunchtime = pass
end)

RegisterNetEvent("oxydelivery:client")
AddEventHandler("oxydelivery:client", function()
    if tasking then
        return
    end

    rnd = math.random(1, #OxyDropOffs)

    CreateBlipOxy()

    local pedCreated = false

    tasking = true
    local toolong = 600000
    while tasking do

        Citizen.Wait(1)
        local plycoords = GetEntityCoords(PlayerPedId())
        local dstcheck = #(plycoords - vector3(OxyDropOffs[rnd]["x"], OxyDropOffs[rnd]["y"], OxyDropOffs[rnd]["z"]))
        local oxyVehCoords = GetEntityCoords(oxyVehicle)
        local dstcheck2 = #(plycoords - oxyVehCoords)

        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if dstcheck < 40.0 and not pedCreated and (oxyVehicle == veh or dstcheck2 < 15.0) then
            pedCreated = true
            DeleteCreatedPed()
            CreateOxyPed()
            TriggerEvent("DoLongHudText", "You are close to the drop off.")
        end
        toolong = toolong - 1
        if toolong < 0 then

            SetVehicleHasBeenOwnedByPlayer(oxyVehicle, false)
            SetEntityAsNoLongerNeeded(oxyVehicle)
            tasking = false
            OxyRun = false
            TriggerEvent("DoLongHudText", "You are no longer selling Oxy due to taking too long to drop off.")
        end
        if dstcheck < 2.0 and pedCreated then

            local crds = GetEntityCoords(deliveryPed)
            DrawText3Ds(crds["x"], crds["y"], crds["z"], "[~b~E~w~]")
            if IsControlJustReleased(0, 38) then
                if not IsPedInVehicle(PlayerPedId(), oxyVehicle, false) then
                    if exports["drp-inventory"]:hasEnoughOfItem("darkmarketdeliveries", 1) then

                        TaskTurnPedToFaceEntity(deliveryPed, PlayerPedId(), 1.0)
                        Citizen.Wait(1500)
                        PlayAmbientSpeech1(deliveryPed, "Generic_Hi", "Speech_Params_Force")
                        PedGiveAnim()
                        if math.random(1,3) == 1 then
                            local plyPos = GetEntityCoords(PlayerPedId(),  true)
                            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                            local street1 = GetStreetNameFromHashKey(s1)
                            local street2 = GetStreetNameFromHashKey(s2)
                            local player = PlayerPedId()
                    
                            TriggerEvent("civilian:alertPolice", 15.0, "drugsale", 0)
                        end
                        local finished = exports["drp-taskbar"]:taskBar(22500, "Handing Over Package")
                        if finished == 100 then
                            DoDropOff()
                            tasking = false
                        end
                    else
                        TriggerEvent("DoLongHudText", "You do not have a delivery list.")
                    end
                else
                    TriggerEvent("DoLongHudText", "You cannot sell out of your Car Bozo")
                end
            end
        end
    end
    DeleteCreatedPed()
    DeleteBlipOxy()
end)

function PedGiveAnim()
    if (DoesEntityExist(PlayerPedId()) and not IsEntityDead(PlayerPedId())) then
        loadAnimDict("mp_safehouselost@")
        if (IsEntityPlayingAnim(PlayerPedId(), "mp_safehouselost@", "package_dropoff", 3)) then
            TaskPlayAnim(PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        else
            TaskPlayAnim(PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        end
    end
end

RegisterNetEvent("oxydelivery:startDealing")
AddEventHandler("oxydelivery:startDealing", function()
    TriggerEvent('player:receiveItem', 'darkmarketdeliveries', 1)
    local NearNPC = exports["isPed"]:GetClosestNPC()
    PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
    TriggerEvent("DoLongHudText", "Your pager will be updated with locations soon.")
    salecount = 0
    firstdeal = true
    OxyRun = true
    vehspawn = false
    CreateOxyVehicle()
    vehspawn = true
end)
-----------------------
------ FUNCTIONS ------
-----------------------

function CleanUpArea()
    local playerped = PlayerPedId()
    local plycoords = GetEntityCoords(playerped)
    local handle, ObjectFound = FindFirstObject()
    local success
    repeat
        local pos = GetEntityCoords(ObjectFound)
        local distance = #(plycoords - pos)
        if distance < 10.0 and ObjectFound ~= playerped then
            if IsEntityAPed(ObjectFound) then
                if IsPedAPlayer(ObjectFound) then
                else
                    DeleteObject(ObjectFound)
                end
            else
                if not IsEntityAVehicle(ObjectFound) and not IsEntityAttached(ObjectFound) then
                    DeleteObject(ObjectFound)
                end
            end
        end
        success, ObjectFound = FindNextObject(handle)
    until not success
    SetEntityAsNoLongerNeeded(drugStorePed)
    DeleteEntity(drugStorePed)
    EndFindObject(handle)
end

OxySpot = false

AddEventHandler("oxy:initialize", function()
    if not OxyRun then
        TriggerServerEvent("oxydelivery:server", 1500)
    else
        TriggerEvent("DoLongHudText", "Come back later.")
    end
end)

Citizen.CreateThread(function()
    while true do
        if drugdealer then
            Citizen.Wait(1000)
            if firstdeal then
                Citizen.Wait(10000)
            end
            TriggerEvent("drugdelivery:client")
            salecount = salecount + 1
            if salecount == 6 then
                TriggerEvent("chatMessage", "EMAIL - Drug Deliveries", 8,
                    "You finished the run. You can start a new one later.")
                Citizen.Wait(1200000)
                drugdealer = false
            end
            Citizen.Wait(150000)
            firstdeal = false
        elseif OxyRun then
            if (not DoesEntityExist(oxyVehicle) or GetVehicleEngineHealth(oxyVehicle) < 100.0) and vehspawn then
                OxyRun = false
                tasking = false
                TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8,
                    "Dude! You fucked the car up, I canceled your run, asshole! ")
            else
                if tasking then
                    Citizen.Wait(30000)
                else
                    TriggerEvent("oxydelivery:client")
                    salecount = salecount + 1
                    if salecount == 6 then
                        TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8,
                            "You finished the run. You can start a new one later.")
                        Citizen.Wait(1200000)
                        OxyRun = false
                    end
                end
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

function CreateOxyVehicle()

    if DoesEntityExist(oxyVehicle) then

        SetVehicleHasBeenOwnedByPlayer(oxyVehicle, false)
        SetEntityAsNoLongerNeeded(oxyVehicle)
        DeleteEntity(oxyVehicle)
    end

    local car = GetHashKey(carpick[math.random(#carpick)])
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end

    local spawnpoint = 1
    for i = 1, #carspawns do
        local caisseo = GetClosestVehicle(carspawns[i]["x"], carspawns[i]["y"], carspawns[i]["z"], 3.500, 0, 70)
        if not DoesEntityExist(caisseo) then
            spawnpoint = i
        end
    end

    oxyVehicle = CreateVehicle(car, carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"],
        carspawns[spawnpoint]["h"], true, false)
    local plt = GetVehicleNumberPlateText(oxyVehicle)
    DecorSetInt(oxyVehicle, "GamemodeCar", 955)
    SetVehicleHasBeenOwnedByPlayer(oxyVehicle, true)
    SetVehicleIsStolen(oxyVehicle, true)
    SetVehRadioStation(oxyVehicle, 'OFF')
    TriggerEvent("keys:received", plt)

    while true do
        Citizen.Wait(1)
        DrawText3Ds(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"],
            "Your Delivery Car (Stolen).")
        if #(GetEntityCoords(PlayerPedId()) -
            vector3(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"])) < 8.0 then
            return
        end
    end

end

function CreateOxyPed()

    local hashKey = "a_m_y_stwhi_01"

    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end

    deliveryPed = CreatePed(pedType, hashKey, OxyDropOffs[rnd]["x"], OxyDropOffs[rnd]["y"], OxyDropOffs[rnd]["z"],
        OxyDropOffs[rnd]["h"], 0, 0, true, true)

    DecorSetBool(deliveryPed, 'ScriptedPed', true)
    ClearPedTasks(deliveryPed)
    ClearPedSecondaryTask(deliveryPed)
    TaskSetBlockingOfNonTemporaryEvents(deliveryPed, true)
    SetPedFleeAttributes(deliveryPed, 0, 0)
    SetPedCombatAttributes(deliveryPed, 17, 1)

    SetPedSeeingRange(deliveryPed, 0.0)
    SetPedHearingRange(deliveryPed, 0.0)
    SetPedAlertness(deliveryPed, 0)
    searchPockets()
    SetPedKeepTask(deliveryPed, true)

end

function DeleteCreatedPed()
    if DoesEntityExist(deliveryPed) then
        SetPedKeepTask(deliveryPed, false)
        TaskSetBlockingOfNonTemporaryEvents(deliveryPed, false)
        ClearPedTasks(deliveryPed)
        TaskWanderStandard(deliveryPed, 10.0, 10)
        SetPedAsNoLongerNeeded(deliveryPed)
        DecorSetBool(deliveryPed, 'ScriptedPed', false)

        Citizen.Wait(20000)
        DeletePed(deliveryPed)
    end
end

function DeleteBlipOxy()
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
end

function CreateBlipOxy()
    DeleteBlipOxy()
    if OxyRun then
        blip = AddBlipForCoord(OxyDropOffs[rnd]["x"], OxyDropOffs[rnd]["y"], OxyDropOffs[rnd]["z"])
    else
        blip = AddBlipForCoord(dropoffpoints[rnd]["x"], dropoffpoints[rnd]["y"], dropoffpoints[rnd]["z"])
    end

    SetBlipSprite(blip, 514)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Drop Off")
    EndTextCommandSetBlipName(blip)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function searchPockets()
    if (DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed)) then
        loadAnimDict("random@mugging4")
        TaskPlayAnim(deliveryPed, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    end
end

function giveAnim()
    if (DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed)) then
        loadAnimDict("mp_safehouselost@")
        if (IsEntityPlayingAnim(deliveryPed, "mp_safehouselost@", "package_dropoff", 3)) then
            TaskPlayAnim(deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        else
            TaskPlayAnim(deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        end
    end
end

function DoDropOff(requestMoney)

    local success = true

    searchPockets()

    Wait(1500)

    PlayAmbientSpeech1(deliveryPed, "Chat_State", "Speech_Params_Force")

    if DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed) then

        if math.random(30) == 1 then
            TriggerEvent("player:receiveItem", "safecrackingkit", 1)
        end

        if math.random(50) == 1 then
            TriggerEvent("player:receiveItem", "heistusb4", 1)
        end

        if math.random(15) == 1 then
            TriggerEvent("player:receiveItem", "lockpick", 1)
        end

        if OxyRun then
			local bandprice = math.random(200, 350)
			local markedbillsprice = math.random(180, 500)
			local rollcashprice = math.random(50, 100)
			local cashrollprice = math.random(100, 235)
			local inkedmoneybagprice = math.random(20000, 30000)

            local sellableItems = {
                [1] = {
                    name = 'rollcash',
                    amount = math.random(3, 8),
                    price = rollcashprice
                },
                [2] = {
                    name = 'inkedmoneybag',
                    amount = 1,
                    price = inkedmoneybagprice
                },
                [3] = {
                    name = 'markedbills',
                    amount = math.random(3, 5),
                    price = markedbillsprice
                },
                [4] = {
                    name = 'band',
                    amount = math.random(2, 6),
                    price = bandprice
                }
            }

            local cashPayment = math.random(50, 60)

            local pog = false

            -- randomize the sellable items
            for i = 1, #sellableItems do
                local randomIndex = math.random(#sellableItems)
                sellableItems[i] = sellableItems[randomIndex]

                if exports["drp-inventory"]:hasEnoughOfItem(sellableItems[i].name, sellableItems[i].amount, false) then
                    TriggerEvent("inventory:removeItem", sellableItems[i].name, sellableItems[i].amount)
                    TriggerServerEvent('mission:completed', (sellableItems[i].price * sellableItems[i].amount))
                    pog = true
                    break
                end
            end

            if pog == false then
                TriggerEvent("player:receiveItem", "oxy", math.random(1, 2))
            end

            if math.random(2) == 1 then
                TriggerEvent("player:receiveItem", "oxy", 1)
            end

            if math.random(100) >= 35 then
                if math.random(1, 2) == 1 then
                    cashPayment = cashPayment + math.random(250, 1000)
                else
                    TriggerEvent("player:receiveItem", "oxy", math.random(1, 2))
                end
            end

            if math.random(100) == 69 then
                cashPayment = cashPayment + math.random(1000, 1500)
            end

            if math.random(1000) == 69 then
                cashPayment = cashPayment + math.random(10000, 15000)
            end
        end
    end

    local counter = math.random(90, 115)
    while counter > 0 do
        local crds = GetEntityCoords(deliveryPed)
        counter = counter - 1
        Citizen.Wait(1)
    end

    if success then
        searchPockets()
        local counter = math.random(90, 115)
        while counter > 0 do
            local crds = GetEntityCoords(deliveryPed)
            counter = counter - 1
            Citizen.Wait(1)
        end

        giveAnim()
    end

    local crds = GetEntityCoords(deliveryPed)
    local crds2 = GetEntityCoords(PlayerPedId())

    if #(crds - crds2) > 5.0 or not DoesEntityExist(deliveryPed) or IsEntityDead(deliveryPed) then
        success = false
    end

    if success then

        PlayAmbientSpeech1(deliveryPed, "Generic_Thanks", "Speech_Params_Force_Shouted_Critical")
        TriggerEvent("player:receiveItem", "oxy", math.random(1, 2))
        -- 100% chance to recieve some oxy

        TriggerServerEvent('mission:completed', cashPayment)
        -- TriggerServerEvent("police:multipledenominators",true)
        TriggerEvent("denoms", true)
        TriggerEvent("drp-hud:updateStress", true, 5)
    else
        TriggerEvent("DoLongHudText", "The drop off failed.", 2)
    end

    DeleteBlipOxy()
    if success then
        Citizen.Wait(2000)
        TriggerEvent("DoLongHudText", "I got the call in, delivery was on point, go await the next one! ", 2)
    else
        TriggerEvent("DoLongHudText", "The drop off failed.", 2)
    end

    DeleteCreatedPed()
end

function DropItemPed(ai)
    local ai = ai
    local chance = math.random(50)
    if chance > 41 then
        DropDrugs(ai, true)
    elseif chance > 35 then
        DropDrugs(ai, false)
    end
    TriggerServerEvent('mission:completed', cashPayment)
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

