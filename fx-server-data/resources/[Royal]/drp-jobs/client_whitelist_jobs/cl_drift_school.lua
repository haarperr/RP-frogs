

function DriftSchoolGetVeh() -- BOOSTING PED LOL
    modelHash = GetHashKey("g_m_y_famfor_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , -128.45274353027, -2534.7033691406, 5.993408203125  -1, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityHeading(created_ped, 238.11022949219)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
end

Citizen.CreateThread(function()
    DriftSchoolGetVeh()
end)


--// Pull Out Cars

RegisterNetEvent("drp-jobs:get-drift-cars")
AddEventHandler("drp-jobs:get-drift-cars", function()
  local rank = exports["isPed"]:GroupRank("drift_school")
  if rank > 1 then   

    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Drift School",
            txt = "",
            params = {
                event = ""
            }
        },
        {
          id = 2, 
          header = "BMW",
          txt = "BMW",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "cookie60",
            }
          }
        },
        {
          id = 3, 
          header = "BMW Hatch",
          txt = "BMW Hatch",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "m3tp",
            }
          }
        },
        {
          id = 4, 
          header = "Drift Komoda",
          txt = "Drift Komoda",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "komodafr",
            }
          }
        },
        {
          id = 5, 
          header = "Drift Kart",
          txt = "Drift Kart",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "skart",
            }
          }
        },
        {
          id = 6, 
          header = "Drift Lambo",
          txt = "Drift Lambo",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "huralbcamber",
            }
          }
        },
        {
          id = 7, 
          header = "Drift Lynx",
          txt = "Drift Lynx",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "lynxgpr",
            }
          }
        },
        {
          id = 8, 
          header = "S14",
          txt = "S14",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "mads14",
            }
          }
        },
        {
          id = 9, 
          header = "C63 AMG",
          txt = "C63 AMG",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "mbc63",
            }
          }
        },
        {
          id = 10, 
          header = "S15",
          txt = "S15",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "s15rbjr",
            }
          }
        },
        {
          id = 11, 
          header = "MLEC",
          txt = "MLEC",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "mlec",
            }
          }
        },
        {
          id = 12, 
          header = "Hachura R",
          txt = "Hachura R",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "hachurac",
            }
          }
        },
        {
          id = 13, 
          header = "Subaru WRX",
          txt = "Subaru WRX",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "wrxwide",
            }
          }
        },
        {
          id = 14, 
          header = "6STR Annis ZR380",
          txt = "6STR Annis ZR380",
          params = {
            event = "drp-jobs:attempt-pull-out-drift-car",
            args = {
              vehicle = "zr3806str",
            }
          }
        },
        {
          id = 15, 
          header = "Close Garage",
          txt = "",
          params = {
            event = "",
          }
        },
      })
    end
end)

RegisterNetEvent("drp-jobs:attempt-pull-out-drift-car")
AddEventHandler("drp-jobs:attempt-pull-out-drift-car", function(data)
  local TowUnionCar = data.vehicle
  if IsAnyVehicleNearPoint(-120.64614868164, -2534.6242675781, 5.3868408203125, 1.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("drp-jobs:spawn-drift-car",TowUnionCar)
  end 
end)


RegisterNetEvent("drp-jobs:pull-drift-veh")
AddEventHandler("drp-jobs:pull-drift-veh", function(data, cb)

  print(data)

  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local RoyalTowUnionBay1Vehicle = CreateVehicle(model, vector4(-120.64614868164, -2534.6242675781, 5.3868408203125, 238.11022949219), true, false)

  Citizen.Wait(100)

  SetEntityAsMissionEntity(RoyalTowUnionBay1Vehicle, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(RoyalTowUnionBay1Vehicle)

  SetVehicleNumberPlateText(RoyalTowUnionBay1Vehicle, "DriftSchool"..tostring(math.random(1000, 9999)))
  TriggerEvent("keys:addNew",RoyalTowUnionBay1Vehicle,plate)

  local plateText = GetVehicleNumberPlateText(RoyalTowUnionBay1Vehicle)
  local player = exports["drp-base"]:getModule("LocalPlayer")

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(RoyalTowUnionBay1Vehicle) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end

end)