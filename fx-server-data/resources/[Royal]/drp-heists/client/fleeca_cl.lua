
Freeze = {F1 = 0, F2 = 0, F3 = 0, F4 = 0, F5 = 0, F6 = 0}
Check = {F1 = false, F2 = false, F3 = false, F4 = false, F5 = false, F6 = false}
LootCheck = {
    F1 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F2 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F3 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F4 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F5 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F6 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false}
}
local disableinput = false
local initiator = false
local startdstcheck = false
local currentname = nil
local currentcoords = nil
local done = true
local fleecaBanks = {}
local fleecaBanksTimes = 0
local fleecaDoorState = false
local fleecaStateAlready = false

RegisterNetEvent("drp-fleeca:getBanks")
AddEventHandler("drp-fleeca:getBanks", function(result)
    fleecaBanks = result
end)

RegisterNetEvent("drp-fleeca:getHit")
AddEventHandler("drp-fleeca:getHit", function(result)
    fleecaBanksTimes = result
end)

RegisterNetEvent("drp-fleeca:getDoorCheckCL")
AddEventHandler("drp-fleeca:getDoorCheckCL", function(result)
    fleecaDoorState = result
end)

RegisterNetEvent("drp-fleeca:GetTimeCL")
AddEventHandler("drp-fleeca:GetTimeCL", function(result)
    fleecaTimesHit = result
end)

RegisterNetEvent("drp-fleeca:GetTime2CL")
AddEventHandler("drp-fleeca:GetTime2CL", function(result)
    fleecaTimesHit2 = result
end)

RegisterNetEvent("drp-fleeca:GetDoorAccessCL")
AddEventHandler("drp-fleeca:GetDoorAccessCL", function(result)
    fleecaStateAlready = result
end)

Citizen.CreateThread(function() 
    while true do 
        local enabled = false 
        Citizen.Wait(1) 
        if disableinput then 
            enabled = true 
            DisableControl() 
        end 
        if not enabled then 
            Citizen.Wait(500) 
        end 
    end 
end)
function DrawText3D(x, y, z, text) 
    local onScreen, _x, _y = World3dToScreen2d(x, y, z) 
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) 
    SetTextScale(0.35, 0.35) 
    SetTextFont(4) 
    SetTextProportional(1) 
    SetTextEntry("STRING") 
    SetTextCentre(true) 
    SetTextColour(255, 255, 255, 215) 
    AddTextComponentString(text) 
    DrawText(_x, _y) 
    local factor = (string.len(text)) / 700 
    DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) 
end

function DisableControl() 
    DisableControlAction(0, 73, false) 
    DisableControlAction(0, 24, true) 
    DisableControlAction(0, 257, true) 
    DisableControlAction(0, 25, true) 
    DisableControlAction(0, 263, true) 
    DisableControlAction(0, 32, true) 
    DisableControlAction(0, 34, true) 
    DisableControlAction(0, 31, true) 
    DisableControlAction(0, 30, true) 
    DisableControlAction(0, 45, true) 
    DisableControlAction(0, 22, true) 
    DisableControlAction(0, 44, true) 
    DisableControlAction(0, 37, true) 
    DisableControlAction(0, 23, true) 
    DisableControlAction(0, 288, true) 
    DisableControlAction(0, 289, true) 
    DisableControlAction(0, 170, true) 
    DisableControlAction(0, 167, true) 
    DisableControlAction(0, 73, true) 
    DisableControlAction(2, 199, true) 
    DisableControlAction(0, 47, true) 
    DisableControlAction(0, 264, true) 
    DisableControlAction(0, 257, true) 
    DisableControlAction(0, 140, true) 
    DisableControlAction(0, 141, true) 
    DisableControlAction(0, 142, true) 
    DisableControlAction(0, 143, true) 
end

RegisterNetEvent("drp-fleeca:openDoor_c")
AddEventHandler("drp-fleeca:openDoor_c", function(coords, method)
    if method == 1 then
        local obj = GetClosestObjectOfType(coords, 2.0, GetHashKey(fleeca.vaultdoor), false, false, false)
        local count = 0

        repeat
            local heading = GetEntityHeading(obj) - 0.10

            SetEntityHeading(obj, heading)
            count = count + 1
            Citizen.Wait(10)
        until count == 900
    elseif method == 2 then
        local obj = GetClosestObjectOfType(fleeca.Banks.F4.doors.startloc.x, fleeca.Banks.F4.doors.startloc.y, fleeca.Banks.F4.doors.startloc.z, 2.0, fleeca.Banks.F4.hash, false, false, false)
        local count = 0
        repeat
            local heading = GetEntityHeading(obj) - 0.10

            SetEntityHeading(obj, heading)
            count = count + 1
            Citizen.Wait(10)
        until count == 900
    elseif method == 3 then
        local obj = GetClosestObjectOfType(coords, 2.0, GetHashKey(fleeca.door), false, false, false)

        FreezeEntityPosition(obj, false)
    elseif method == 4 then
        local obj = GetClosestObjectOfType(coords, 2.0, GetHashKey(fleeca.vaultdoor), false, false, false)
        local count = 0

        repeat
            local heading = GetEntityHeading(obj) + 0.10

            SetEntityHeading(obj, heading)
            count = count + 1
            Citizen.Wait(10)
        until count == 900
    elseif method == 5 then
        local obj = GetClosestObjectOfType(fleeca.Banks.F4.doors.startloc.x, fleeca.Banks.F4.doors.startloc.y, fleeca.Banks.F4.doors.startloc.z, 2.0, fleeca.Banks.F4.hash, false, false, false)
        local count = 0

        repeat
            local heading = GetEntityHeading(obj) + 0.10

            SetEntityHeading(obj, heading)
            count = count + 1
            Citizen.Wait(10)
        until count == 900
    end
end)

RegisterNetEvent("drp-fleeca:resetDoorState")
AddEventHandler("drp-fleeca:resetDoorState", function(name)
    Freeze[name] = 0
end)

RegisterNetEvent("drp-fleeca:lootup_c")
AddEventHandler("drp-fleeca:lootup_c", function(var, var2)
    LootCheck[var][var2] = true
end)

RegisterNetEvent("drp-fleeca:outcome")
AddEventHandler("drp-fleeca:outcome", function(oc, arg)
    for i = 1, #Check, 1 do
        Check[i] = false
    end
    for i = 1, #LootCheck, 1 do
        for j = 1, #LootCheck[i] do
            LootCheck[i][j] = false
        end
    end
    if oc then
        Check[arg] = true
        TriggerEvent("drp-fleeca:startheist", fleeca.Banks[arg], arg)
    elseif not oc then
        TriggerEvent('DoLongHudText', arg, 2)
    end
end)

RegisterNetEvent('lootCash1')
AddEventHandler('lootCash1',function()
    TriggerServerEvent("drp-fleeca:lootup", "F1", "Loot1")
    StartGrab(name)
end)

RegisterNetEvent('lootCash2')
AddEventHandler('lootCash2',function()
    TriggerServerEvent("drp-fleeca:lootup", "F1", "Loot2")
    StartGrab(name)
end)

RegisterNetEvent('lootCash3')
AddEventHandler('lootCash3',function()
    TriggerServerEvent("drp-fleeca:lootup", "F1", "Loot3")
    StartGrab(name)
end)

RegisterNetEvent("drp-fleeca:startLoot_c")
AddEventHandler("drp-fleeca:startLoot_c", function(data, name)
    currentname = name
    currentcoords = vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z)
    if not LootCheck[name].Stop then
            exports["drp-polytarget"]:AddBoxZone("cash", vector3(314.54, -283.57, 54.14), 0.6, 1.0, {
            name="cash",
            heading=344,
            --debugPoly=true,
            minZ=53.99,
            maxZ=54.24
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            }) 
            exports["drp-polytarget"]:AddBoxZone("lootcash2", vector3(311.48, -288.61, 54.14), 0.6, 1.0, {
            name="lootcash2",
            heading=344,
            --debugPoly=true,
            minZ=53.99,
            maxZ=54.24
            }, {
                options = {
                    {
                        event = "lootCash2",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            }) 
            exports["drp-polytarget"]:AddBoxZone("cash3", vector3(313.37, -289.27, 54.14), 0.6, 1, {
            name="cash3",
            heading=345,
            --debugPoly=true,
            minZ=54.04,
            maxZ=54.29
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            --3213
            exports["drp-polytarget"]:AddBoxZone("cash4", vector3(150.24, -1045.4, 29.35), 0.6, 1, {
            name="cash4",
            heading=340,
            --debugPoly=true,
            minZ=29.25,
            maxZ=29.45
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash5", vector3(147.24, -1050.34, 29.35), 0.6, 1, {
            name="lootCash5",
            heading=345,
            --debugPoly=true,
            minZ=29.25,
            maxZ=29.45
            }, {
                options = {
                    {
                        event = "lootCash2",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("cash6", vector3(149.21, -1051.06, 29.35), 0.6, 1, {
            name="cash6",
            heading=345,
            --debugPoly=true,
            minZ=29.25,
            maxZ=29.45
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            --7032
            exports["drp-polytarget"]:AddBoxZone("cash7", vector3(-350.54, -54.48, 49.01), 0.6, 1, {
            name="cash7",
            heading=340,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash28", vector3(-353.37, -59.48, 49.01), 0.6, 1, {
            name="lootcash28",
            heading=345,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash2",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("cash39", vector3(-351.61, -60.08, 49.01), 0.6, 1, {
            name="cash39",
            heading=345,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            --7032
            exports["drp-polytarget"]:AddBoxZone("cash11", vector3(-350.54, -54.48, 49.01), 0.6, 1, {
            name="cash11",
            heading=340,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash212", vector3(-353.37, -59.48, 49.01), 0.6, 1, {
            name="lootcash2",
            heading=345,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash2",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("cash313", vector3(-351.61, -60.08, 49.01), 0.6, 1, {
            name="cash313",
            heading=345,
            --debugPoly=true,
            minZ=48.91,
            maxZ=49.11
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            }) 
            --5146
            exports["drp-polytarget"]:AddBoxZone("cash14", vector3(-1209.05, -333.58, 37.76), 0.6, 1, {
            name="cash14",
            heading=30,
            --debugPoly=true,
            minZ=37.66,
            maxZ=37.86
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 2
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash215", vector3(-1207.53, -339.23, 37.76), 0.6, 1, {
            name="lootcash215",
            heading=31,
            --debugPoly=true,
            minZ=37.66,
            maxZ=37.86
            }, {
                options = {
                    {
                        event = "lootCash2",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 2
            })
            exports["drp-polytarget"]:AddBoxZone("cash316", vector3(-1205.65, -338.26, 37.76), 0.6, 1, {
            name="cash316",
            heading=30,
            --debugPoly=true,
            minZ=37.66,
            maxZ=37.86
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 2
            })
            --7066
            exports["drp-polytarget"]:AddBoxZone("cash17", vector3(-2958.36, 484.76, 15.68), 0.6, 1, {
            name="cash",
            heading=270,
            --debugPoly=true,
            minZ=15.58,
            maxZ=15.78
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash217", vector3(-2952.66, 483.29, 15.68), 0.6, 1, {
            name="lootcash217",
            heading=85,
            --debugPoly=true,
            minZ=15.58,
            maxZ=15.78
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("cash318", vector3(-2952.57, 485.12, 15.68), 0.6, 1, {
            name="cash318",
            heading=265,
            --debugPoly=true,
            minZ=15.58,
            maxZ=15.78
            }, {
                options = {
                    {
                        event = "lootCash3",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            --706
            exports["drp-polytarget"]:AddBoxZone("cash19", vector3(1173.19, 2711.0, 38.07), 0.6, 1, {
            name="cash19",
            heading=0,
            --debugPoly=true,
            minZ=37.97,
            maxZ=38.17
            }, {
                options = {
                    {
                        event = "lootCash1",
                        icon = "fas fa-hand-holding",
                        label = "Grab it!",
                    },
                },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("lootCash220", vector3(1174.28, 2716.72, 38.07), 0.6, 1, {
            name="lootcash220",
            heading=0,
            minZ=37.97,
            maxZ=38.17
            }, {
           options = {
                {
                    event = "lootCash3",
                    icon = "fas fa-hand-holding",
                    label = "Grab it!",
                },
            },
                job = {"all"},
                distance = 1.0
            })
            exports["drp-polytarget"]:AddBoxZone("cash321", vector3(1172.3, 2716.69, 38.07), 0.6, 1, {
            name="cash321",
            heading=0,
            minZ=37.97,
            maxZ=38.17
            }, {
            options = {
                {
                    event = "lootCash3",
                    icon = "fas fa-hand-holding",
                    label = "Grab it!",
                },
            },
            job = {"all"},
            distance = 1.0
        }) 
        while true do
            local pedcoords = GetEntityCoords(PlayerPedId())
            local dst = GetDistanceBetweenCoords(pedcoords, data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z, true)
        
            if dst < 40 then
                if LootCheck[name].Stop or (LootCheck[name].Loot1 and LootCheck[name].Loot2 and LootCheck[name].Loot3) then
                    LootCheck[name].Stop = false
                    if initiator then
                        TriggerEvent("drp-fleeca:reset", name, data)
                        return
                    end
                    return
                end
                Citizen.Wait(1)
            else
                Citizen.Wait(1000)
            end
        end
    end
end)

RegisterNetEvent("drp-fleeca:stopHeist_c")
AddEventHandler("drp-fleeca:stopHeist_c", function(name)
    LootCheck[name].Stop = true
end)

function GetStreetAndZone()
    local plyPos = GetEntityCoords(PlayerPedId(), true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
    local street = street1 .. ", " .. zone
    return street
end

RegisterNetEvent("drp-fleeca:freezeDoors")
AddEventHandler("drp-fleeca:freezeDoors", function()
    Citizen.CreateThread(function()
        while true do
            local pedcoords = GetEntityCoords(PlayerPedId())

            for k, v in pairs(fleeca.Banks) do
                if Freeze[k] < 3 then
                    local dst = GetDistanceBetweenCoords(pedcoords, v.doors.startloc.x, v.doors.startloc.y, v.doors.startloc.z, true)

                    if dst < 10 then
                        local obj = GetClosestObjectOfType(v.doors.secondloc.x, v.doors.secondloc.y, v.doors.secondloc.z, 5.0, fleeca.door, false, true ,true)

                        FreezeEntityPosition(obj, true)
                        Freeze[k] = Freeze[k] + 1
                    end
                end
            end
            if Freeze.F1 > 3 and Freeze.F2 > 3 and Freeze.F3 > 3 and Freeze.F4 > 3 and Freeze.F5 > 3 and Freeze.F6 > 3 then
                Citizen.Wait(5000)
            end
            Citizen.Wait(500)
        end
    end)
end)

RegisterNetEvent("drp-fleeca:reset")
AddEventHandler("drp-fleeca:reset", function(name, data)
    for i = 1, #LootCheck[name], 1 do
        LootCheck[name][i] = false
    end
    Check[name] = false
    TriggerEvent('DoLongHudText', 'Vault door will close in 3 minutes', 2)
    Citizen.Wait(180000)
   -- TriggerEvent('DoLongHudText', 'VAULT DOOR CLOSING', 2)
    TriggerEvent("drp-fleeca:cleanUp", data, name)
    if data.hash == nil then
        TriggerServerEvent("drp-fleeca:openDoor", vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z), 4)
    elseif not data.hash == nil then
        TriggerServerEvent("drp-fleeca:openDoor", vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z), 5)
    end
end)

RegisterNetEvent("drp-fleeca:startheist")
AddEventHandler("drp-fleeca:startheist", function(data, name)
    currentname = name
    currentcoords = vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z)
    initiator = true

    TriggerEvent("chatMessage", "Encrypted", 8, "Bank security captcha bypassed successfully. Door will open shortly. ")
    TriggerEvent("drp-hud:updateStress",true,35)
    Citizen.Wait(180000) -- set to 180000 when finish testing

    if data.hash == nil then
        TriggerServerEvent("drp-fleeca:openDoor", vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z), 1)
    elseif data.hash ~= nil then
        TriggerServerEvent("drp-fleeca:openDoor", "anana", 2)
    end
    startdstcheck = true
    currentname = name
   -- TriggerEvent('DoLongHudText', 'You have 2 minutes until the security system activation.', 1)
    SpawnTrolleys(data, name)
end)

AddEventHandler("drp-fleeca:cleanUp", function(data, name)
    TriggerServerEvent("drp-fleeca:setCooldown", name)
    Citizen.Wait(60000)
    for i = 1, 3, 1 do -- full trolley clean
        local obj = GetClosestObjectOfType(data.objects[i].x, data.objects[i].y, data.objects[i].z, 0.75, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)

        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    for j = 1, 3, 1 do -- empty trolley clean
        local obj = GetClosestObjectOfType(data.objects[j].x, data.objects[j].y, data.objects[j].z, 0.75, GetHashKey("hei_prop_hei_cash_trolly_03"), false, false, false)

        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    if DoesEntityExist(IdProp) then
        DeleteEntity(IdProp)
    end
    if DoesEntityExist(IdProp2) then
        DeleteEntity(IdProp2)
    end
    fleecaBanks = {}
    initiator = false
end)

function SpawnTrolleys(data, name)
    RequestModel("hei_prop_hei_cash_trolly_01")
    while not HasModelLoaded("hei_prop_hei_cash_trolly_01") do
        Citizen.Wait(1)
    end
    Trolley1 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), data.trolley1.x, data.trolley1.y, data.trolley1.z, 1, 1, 0)
    Trolley2 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), data.trolley2.x, data.trolley2.y, data.trolley2.z, 1, 1, 0)
    Trolley3 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), data.trolley3.x, data.trolley3.y, data.trolley3.z, 1, 1, 0)
    local h1 = GetEntityHeading(Trolley1)
    local h2 = GetEntityHeading(Trolley2)
    local h3 = GetEntityHeading(Trolley3)

    SetEntityHeading(Trolley1, h1 + fleeca.Banks[name].trolley1.h)
    SetEntityHeading(Trolley2, h2 + fleeca.Banks[name].trolley2.h)
    SetEntityHeading(Trolley3, h3 + fleeca.Banks[name].trolley3.h)
    TriggerServerEvent("drp-fleeca:startLoot", data, name)
    done = false
end

function StartGrab(name)
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"

    Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.0, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)
    local CashAppear = function()
	    local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)

        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(100)
        end
	    local grabobj = CreateObject(grabmodel, pedCoords, true)

	    FreezeEntityPosition(grabobj, true)
	    SetEntityInvincible(grabobj, true)
	    SetEntityNoCollisionEntity(grabobj, ped)
	    SetEntityVisible(grabobj, false, false)
	    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	    local startedGrabbing = GetGameTimer()

	    Citizen.CreateThread(function()
		    while GetGameTimer() - startedGrabbing < 37000 do
                Citizen.Wait(1)
			    DisableControlAction(0, 73, true)
			    if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
				    if not IsEntityVisible(grabobj) then
					    SetEntityVisible(grabobj, true, false)
				    end
			    end
			    if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                       --TriggerServerEvent("drp-fleeca:rewardCash")
				    end
			    end
		    end
		    DeleteObject(grabobj)
	    end)
    end
	local trollyobj = Trolley
    local emptyobj = GetHashKey("hei_prop_hei_cash_trolly_03")

	if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(100)
    end
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
	NetworkStartSynchronisedScene(scene1)
	Citizen.Wait(1500)
	CashAppear()
	local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene2)
	Citizen.Wait(37000)
	local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene3)
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	DeleteObject(trollyobj)
    --exports['drp-textui']:hideInteraction()
	Citizen.Wait(1800)
    TriggerServerEvent("drp-fleeca:rewardCash")
	DeleteObject(bag)
    --SetPedComponentVariation(ped, 5, 45, 0, 0)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
    disableinput = false
end

Citizen.CreateThread(function()
    while true do
        if startdstcheck then
            if initiator then
                local playercoord = GetEntityCoords(PlayerPedId())

                if (GetDistanceBetweenCoords(playercoord, currentcoords, true)) > 20 then
                    LootCheck[currentname].Stop = true
                    startdstcheck = false
                    TriggerServerEvent("drp-fleeca:stopHeist", currentname)
                end
            end
            Citizen.Wait(1)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    local resettimer = fleeca.timer

    while true do
        if startdstcheck then
            if initiator then
                if fleeca.timer > 0 then
                    Citizen.Wait(1000)
                    fleeca.timer = fleeca.timer - 1
                elseif fleeca.timer == 0 then
                    startdstcheck = false
                    TriggerServerEvent("drp-fleeca:stopHeist", currentname)
                    fleeca.timer = resettimer
                end
            end
            Citizen.Wait(1)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if fleecaBanksTimes < 1 then
            Citizen.Wait(600000)
            TriggerServerEvent('drp-fleeca:getHitSVSV', 3)
        end
        Citizen.Wait(5)
    end
end)

local hackAnimDict = "anim@heists@ornate_bank@hack"
local function loadDicts()
    RequestAnimDict(hackAnimDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded(hackAnimDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Wait(0)
    end
end

RegisterNetEvent("drp-robberies:hackinganim")
AddEventHandler("drp-robberies:hackinganim", function(toggle)
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    local plyHeading = GetEntityHeading(ply)
    if toggle == true then
        ClearPedTasksImmediately(ply)
        Wait(0)
        loadDicts()
        Wait(0)
        ClearPedTasksImmediately(ply)
        Wait(0)
        SetEntityHeading(ply, plyHeading)
        Wait(0)
        TaskPlayAnimAdvanced(ply, hackAnimDict, "hack_enter", plyCoords, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
        Wait(0)
        SetEntityHeading(ply, plyHeading)
        while IsEntityPlayingAnim(ply, hackAnimDict, "hack_enter", 3) do
            Wait(0)
        end
        Wait(0)
        TaskPlayAnim(ply, hackAnimDict, "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)
    elseif toggle == false then
        ClearPedTasksImmediately(ply)
    end
end)

RegisterNetEvent("drp-fleeca:removePlease")
AddEventHandler("drp-fleeca:removePlease", function()
    if not fleecaStateAlready == true then
        TriggerServerEvent('drp-fleeca:getHitSVSV', fleecaBanksTimes - 1)
        TriggerEvent('drp-robberies:hackinganim', false)
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasks(PlayerPedId())
        ClearPedTasksImmediately(PlayerPedId())
    end
end)

RegisterNetEvent("drp-fleeca:addPlease")
AddEventHandler("drp-fleeca:addPlease", function()
    for k, v in pairs(fleecaBanks) do
        local coords = GetEntityCoords(PlayerPedId())
        local dst = GetDistanceBetweenCoords(coords, v.doors.startloc.x, v.doors.startloc.y, v.doors.startloc.z, true)
        if not v.onaction then
            if dst <= 5 and not Check[k] then
                FreezeEntityPosition(PlayerPedId(), false)
                ClearPedTasks(PlayerPedId())
                ClearPedTasksImmediately(PlayerPedId())
                TriggerEvent('drp-robberies:hackinganim', false)
                TriggerServerEvent("drp-fleeca:startcheck", k)
                return
            end
        end
    end
end)

RegisterNetEvent("drp-fleeca:policenotify")
AddEventHandler("drp-fleeca:policenotify", function(name)
    local street1 = GetStreetAndZone()
    local plyPos = GetEntityCoords(PlayerPedId(), true)
    local gender = IsPedMale(PlayerPedId())
  
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = "10-90A",
        firstStreet = street1,
        gender = gender,
        isImportant = true,
		priority = 1,
        dispatchMessage = "Fleeca Bank Robbery",
        recipientList = {
          police = "police"
        },
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        }
    })
    TriggerEvent('drp-dispatch:bankrobbery')
end)

-- Code
local closestBank = nil
local inRange
local laptop = 0

Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist
            inRange = false
            for k, v in pairs(Config.SmallBanks) do
                dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[k]["coords"]["x"], Config.SmallBanks[k]["coords"]["y"], Config.SmallBanks[k]["coords"]["z"])
                if dist < 15 then
                    closestBank = k
                    inRange = true
                end
            end
            if not inRange then
                Citizen.Wait(1000)
                closestBank = nil
            end

        Citizen.Wait(3)
    end
end)



RegisterNetEvent("drp-fleeca:distcheck")
AddEventHandler("drp-fleeca:distcheck", function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank].coords.x, Config.SmallBanks[closestBank].coords.y, Config.SmallBanks[closestBank].coords.z)
    if dist < 1.5 then	
        TriggerEvent("drp-fleeca:startFleecaHeist")
    end
end)



RegisterNetEvent("drp-fleeca:startFleecaHeist")
AddEventHandler("drp-fleeca:startFleecaHeist", function()
    TriggerEvent("drp-fleeca:freezeDoors")
    TriggerServerEvent('drp-fleeca:getBanksSV')
    TriggerServerEvent('drp-fleeca:getHitSV')
    TriggerServerEvent('drp-fleeca:getTimeSV')
    TriggerServerEvent('drp-fleeca:getTime2SV')
    TriggerServerEvent('drp-fleeca:getDoorAccessSV')
    Citizen.Wait(1000)
	if exports["drp-duty"]:LawAmount() >= 1 then
        if not fleecaStateAlready == true then
            if fleecaTimesHit2 > fleecaTimesHit then
                if fleecaBanksTimes >= 1 then
                    if exports['drp-inventory']:hasEnoughOfItem('heistlaptop3', 1, false) then
                        TriggerEvent('drp-dispatch:bankrobbery')
                        TriggerEvent('drp-robberies:hackinganim', true)
                      
                      TriggerEvent('bankrobbery:log')
                       
                        Citizen.Wait(7000)
                        exports["hacking"]:hacking(
                            function() -- success
                                TriggerEvent('drp-fleeca:addPlease')
                                TriggerEvent("inventory:removeItem","heistlaptop3", 1)
                            end,
                            function() -- failure
                                TriggerEvent('drp-fleeca:removePlease')  local breaklaptop = math.random(1,3)
                                if breaklaptop == 1 then
                                TriggerEvent("inventory:removeItem","heistlaptop3", 1) -- delete laptop on use 33% chance
                                TriggerEvent('DoLongHudText', 'You broke the laptop', 2)
                            end
                            end)
                                        
                    else
                        TriggerEvent('DoLongHudText', 'You do not have the proper hacking equipment!', 2)
                        return
                    end
                else
                    TriggerEvent('DoLongHudText', 'Tablet is overloaded!', 2)
                    return
                end
            else
                TriggerServerEvent('drp-fleeca:TimePoggers')
            end
        else
            TriggerServerEvent('drp-fleeca:DoorAccessPoggers')
        end
    else
        TriggerEvent('DoLongHudText', 'No police on duty', 2)
        return
    end
end)