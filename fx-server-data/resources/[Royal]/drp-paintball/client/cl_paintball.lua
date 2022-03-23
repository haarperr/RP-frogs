local inArena = false
local isDead = false
local lastHitByPaintball = false

function isNpa()
  local cid = exports["isPed"]:isPed("cid")
  local isEmployedAtNpa = RPC.execute("IsEmployedAtBusiness", { character = { id = cid }, business = { id = "npa"} })
  if not isEmployedAtNpa then
    TriggerEvent("DoLongHudText", "They don't recognize you", 2)
  end
  return isEmployedAtNpa
end

RegisterNetEvent('paintballshop')
AddEventHandler('paintballshop', function()
    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Paintball Menu",
            txt = ""
        },
        {
            id = 2,
            header = "Painball Gun",
            txt = "",
            params = {
               event = "getpaintballgun"
           }
        },
        {
            id = 3,
            header = "Paintballs X5",
            txt = "",
            params = {
                event = "getpaintballs"
            }
        },
        {
          id = 4,
          header = "Clothing Menu",
          txt = "",
          params = {
              event = "royal:clothing:admin"
          }
      },
        
    })
end)
 
RegisterNetEvent('getpaintballgun')
AddEventHandler('getpaintballgun', function()
    if exports['drp-inventory']:hasEnoughOfItem('-2009644972', 1) then
        TriggerEvent('DoLongHudText', 'You already have a paintball gun!', 2)
    else
      TriggerEvent('player:receiveItem', '-2009644972', 1)
    end
end)

RegisterNetEvent('getpaintballs')
AddEventHandler('getpaintballs', function()
    if exports['drp-inventory']:hasEnoughOfItem('paintballs', 3) then
        TriggerEvent('DoLongHudText', 'You already have paintballs!', 2)
    else
      TriggerEvent('player:receiveItem', 'paintballs', 5)
    end
end)

RegisterCommand("pbmenu", function()
  if inArena then
  TriggerEvent("paintballshop")
else
  TriggerEvent('DoLongHudText', 'You are not in the arena!', 2)
end
  end)

  
RegisterCommand("startpb", function()
  if inArena then
    TriggerEvent("DoLongHudText","Game Starts in 3",14)
    PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    Citizen.Wait(1000)
    TriggerEvent("DoLongHudText","Game Starts in 2",14)
    PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    Citizen.Wait(1000)
    TriggerEvent("DoLongHudText","Game Starts in 1",14)
    PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    Citizen.Wait(1000)
    PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    TriggerEvent("DoLongHudText","GO!",14)
   
else
  TriggerEvent('DoLongHudText', 'You are not in the arena!', 2)
end
  end)

 

function paintballguy()
  modelHash = GetHashKey("a_m_m_eastsa_02")
  RequestModel(modelHash)
  while not HasModelLoaded(modelHash) do
      Wait(1)
  end
  created_ped = CreatePed(0, modelHash , 2365.3, 2595.09, 58.818  -1, true)
  FreezeEntityPosition(created_ped, true)
  SetEntityHeading(created_ped, 65.77166748047)
  SetEntityInvincible(created_ped, true)
  SetBlockingOfNonTemporaryEvents(created_ped, true)
  TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

end

Citizen.CreateThread(function()
  paintballguy()
end)

local function removeGuns()
  local qty = exports["drp-inventory"]:getQuantity("-2009644972")
  if qty and qty > 0 then
    TriggerEvent("inventory:removeItem", "-2009644972", qty)
  end
  if GetSelectedPedWeapon(PlayerPedId()) == -2009644972 then
    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
  end
  local megaphoneQty = exports["drp-inventory"]:getQuantity("megaphone", true, { type = "paintball" })
  if megaphoneQty and megaphoneQty > 0 then
    TriggerEvent("inventory:removeItemByMetaKV", "megaphone", megaphoneQty, "type", "paintball")
  end
  local qty = exports["drp-inventory"]:getQuantity("paintballs")
  if qty and qty > 0 then
    TriggerEvent("inventory:removeItem", "paintballs", qty)
  end
  local smokeQty = exports["drp-inventory"]:getQuantity("smokegrenadenpa")
  if smokeQty and smokeQty > 0 then
    TriggerEvent("inventory:removeItem", "smokegrenadenpa", smokeQty)
  end
end

AddEventHandler("drp-paintball:getPaintballGun", function()
  TriggerEvent("player:receiveItem", "-2009644972", 1)
end)

AddEventHandler("drp-paintball:getCaddy", function()
  if not isNpa() then return end
  RPC.execute("np:vehicles:basicSpawn", "caddy", { x = 5513.32, y = 5992.66, z = 590.01 }, 359.1, "paintball")
end)

AddEventHandler("drp-paintball:getGoKart", function()
  if not isNpa() then return end
  RPC.execute("np:vehicles:basicSpawn", "kart", { x = 5513.32, y = 5992.66, z = 590.01 }, 359.1, "paintball")
end)

AddEventHandler("drp-paintball:getPaintballSmoke", function()
  if not isNpa() then return end
  TriggerEvent("player:receiveItem", "smokegrenadenpa", 1)
end)

AddEventHandler("drp-paintball:getPaintballAmmo", function()
  TriggerEvent("player:receiveItem", "paintballs", 20)
end)

AddEventHandler("drp-paintball:getMegaphone", function()
  if not isNpa() then return end
  TriggerEvent("player:receiveItem", "megaphone", 1, false, { type = "paintball" }, { type = "paintball" })
end)

AddEventHandler("drp-polyzone:enter", function(zone)
  if zone ~= "paintball_arena" then return end
  inArena = true
end)
AddEventHandler("drp-polyzone:exit", function(zone)
  if zone ~= "paintball_arena" then return end
  inArena = false
  lastHitByPaintball = false
  removeGuns()
end)

RegisterNetEvent("drp-paintball:reviveAfterDown", function()
  if inArena and isDead then
    TriggerEvent("reviveFunction")
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000 * 5)
    if not inArena then
      removeGuns()
    end
  end
end)

AddEventHandler("pd:deathcheck", function()
  isDead = not isDead
end)

local arenaVariations = {
  ["set_arena_dirt"] = {
    ["wasteland"] = true,
  },
  ["set_npa"] = {
    ["wasteland"] = true,
  },
  ["set_arena_concrete"] = {
    ["gokarts"] = true,
    ["gokarts2"] = true,
  },
  ["set_gokart"] = {
    ["gokarts"] = true,
  },
  ["set_gokart_two"] = {
    ["gokarts2"] = true,
  },
}
AddEventHandler("drp-paintball:setArenaType", function(pArgs)
  if not isNpa() then return end
  RPC.execute("np-paintball:setArenaType", pArgs[1])
end)

RegisterNetEvent("drp-paintball:changeArenaType", function(pType)
  local cInteriorId = GetInteriorAtCoords(5505.03, 5997.68, 590.0)
  for k, v in pairs(arenaVariations) do
    DeactivateInteriorEntitySet(cInteriorId, k)
  end
  for k, v in pairs(arenaVariations) do
    if v[pType] then
      ActivateInteriorEntitySet(cInteriorId, k)
    end
  end
  RefreshInterior(cInteriorId)
end)

Citizen.CreateThread(function()
  Citizen.Wait(30000)
  TriggerServerEvent("np-paintball:getArenaType")
end)

local currentLocation = "arena"
local coordLocs = {
  ["arena"] = {
    coords = vector3(5515.0,5985.28,590.01),
    heading = 359.62,
  },
  ["grass"] = {
    coords = vector3(5500.04,5348.98,603.5),
    heading = 358.62,
  },
}
AddEventHandler("drp-paintball:swapLocations", function()
  DoScreenFadeOut(400)
  if currentLocation == "arena" then
    currentLocation = "grass"
  else
    currentLocation = "arena"
  end
  Wait(500)
  SetEntityCoords(PlayerPedId(), coordLocs[currentLocation].coords)
  SetEntityHeading(PlayerPedId(), coordLocs[currentLocation].heading)
  Wait(1000)
  DoScreenFadeIn(800)
end)

AddEventHandler("drp-paintball:enterArena", function()
  inArena = true
  TriggerEvent("drp-cleanup:enableCleanup", false)
  Citizen.CreateThread(function()
    while inArena do
      if currentLocation == "arena" then
        local ped = PlayerPedId()
        local interior = GetInteriorAtCoords(vector3(5500.15, 6079.29, 591.71))
        ForceRoomForEntity(ped, interior, 289098304)
        ForceRoomForGameViewport(interior, 289098304)
      end
      Citizen.Wait(100)
    end
  end)
end)

AddEventHandler("np-paintball:exitArena", function()
  inArena = false
  TriggerEvent("np-cleanup:enableCleanup", true)
  removeGuns()
end)

-- CUSTOM ARENA
Enabled = {
  ['Playground_1'] = true,
  ['Terrain_1'] = true,
  ['Vegetation_1'] = true,
}

IPLs = {
  Playground_1 = {
      "gabz_npa_hyperpipe",
  },
  Terrain_1 = {
      "gabz_npa_terrain1",
  },
  Vegetation_1 = {
      "gabz_npa_fern_proc",
      "gabz_npa_grass_mix_proc",
      "gabz_npa_grass_proc",
      "gabz_npa_grass_sm_proc",
      "gabz_npa_grass_xs_proc",
      "gabz_npa_log_proc",
      "gabz_npa_stones_proc",
      "gabz_npa_trees"
  },
}

-- do not touch
Citizen.CreateThread(function()
  Citizen.Wait(60000)
  for category, iplName in pairs(IPLs) do
    if Enabled[category] then
      for k,v in pairs(iplName) do 
        RequestIpl(v)
      end
    end
  end
end)




-- Citizen.CreateThread(function()
--   local cInteriorId = GetInteriorAtCoords(5505.03, 5397.68, 590.0)
--   ActivateInteriorEntitySet(cInteriorId, "set_arena_dirt")
--   ActivateInteriorEntitySet(cInteriorId, "set_npa")
--   RefreshInterior(cInteriorId)
-- end)

-- RegisterCommand("arena-off", function()
--   local cInteriorId = GetInteriorAtCoords(5505.03, 5397.68, 590.0)
--   DeactivateInteriorEntitySet(cInteriorId, "set_arena_dirt")
--   DeactivateInteriorEntitySet(cInteriorId, "set_npa")
--   RefreshInterior(cInteriorId)
-- end, false)

-- RegisterCommand("arena-dirt", function()
--   local cInteriorId = GetInteriorAtCoords(5505.03, 5397.68, 590.0)
--   ActivateInteriorEntitySet(cInteriorId, "set_arena_dirt")
--   RefreshInterior(cInteriorId)
-- end, false)

-- RegisterCommand("arena-wasteland", function()
--   local cInteriorId = GetInteriorAtCoords(5505.03, 5397.68, 590.0)
--   ActivateInteriorEntitySet(cInteriorId, "set_npa")
--   RefreshInterior(cInteriorId)
-- end, false)

   if inArena and isDead then
     if not lastHitByPaintball then
       Wait(1000)
     end
     if not lastHitByPaintball then
       Wait(1000)
     end
     if not lastHitByPaintball then
       Wait(1000)
     end
     if lastHitByPaintball then
       lastHitByPaintball = false
       local src = GetPlayerServerId(PlayerId())
       TriggerServerEvent('reviveGranted', src)
       TriggerServerEvent('ems:healplayer', src)
       TriggerEvent('Hospital:HealInjuries', src, true)
       TriggerEvent('heal', src)
       TriggerEvent('status:needs:restore', src)
     end
   end
 AddEventHandler("DamageEvents:EntityDamaged", function(victim, attacker, pWeapon, isMelee)
   local playerPed = PlayerPedId()
   if victim ~= playerPed then
     return
   end
   print(victim, attacker, pWeapon, isMelee, (pWeapon == -2009644972))
   lastHitByPaintball = lastHitByPaintball or (pWeapon == -2009644972)
 end)
