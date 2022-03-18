local inCasino = false
local postGateTriggered = false
local carOnShow = `r35`
local carOnShowAppearence = json.decode('{"colors":{"primary":5,"secondary":0,"pearlescent":3,"neon":{"b":255,"r":222,"g":222},"xenon":0},"tint":3,"plateIndex":1,"neon":{"right":true,"back":true,"front":true,"left":true}}')
local carOnShowMods = json.decode('{"Brakes":2,"Turbo":1,"Transmission":2,"EngineBlock":0,"Exhaust":2,"Frame":4,"Suspension":4,"Engine":4,"FrontWheels":71,"Spoilers":9,"XenonHeadlights":1,"Hood":8}')
local carOnShow2 = `evo9`
local carOnShow2Active = false
local polyEntryTimeout = false
local enterFirstTime = true
local entranceTeleportCoords = vector3(1089.73, 206.36, -48.99 + 0.05)
local exitTeleportCoords = vector3(934.46, 45.83, 81.1 + 0.05)
local inVRHeadset = false

local spinningObject = nil
local spinningCar = nil
local auxCar = nil

local duiList = {}
local wheelDui = nil
local tvDui = nil
local tvUri = "https://prod-gta.nopixel.net/dui/?type=video&src=https://i.imgur.com/bgn4RKc.mp4&encoding=mp4"
local wheelUrl = nil

local isPowerOut = false

Citizen.CreateThread(function()
  wheelUrl = GetConvar("sv_wheelUrl", "")
end)

-- CAR FOR WINS
function drawCarForWins()
  if DoesEntityExist(spinningCar) then
    DeleteEntity(spinningCar)
  end
  if DoesEntityExist(auxCar) then
    DeleteEntity(auxCar)
  end
  RequestModel(carOnShow)
	while not HasModelLoaded(carOnShow) do
		Citizen.Wait(0)
  end
  RequestModel(carOnShow2)
	while not HasModelLoaded(carOnShow2) do
		Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(carOnShow)
  if carOnShow2Active then
    SetModelAsNoLongerNeeded(carOnShow2)
  end
  spinningCar = CreateVehicle(carOnShow, 975.5, 40.41, 72.16 + 0.05, 0.0, 0, 0)
  Wait(0)
  if carOnShow2Active then
    auxCar = CreateVehicle(carOnShow2, 1007.23, 46.5, 70.47 + 0.05, 197.13, 0, 0)
  end
  SetVehicleDirtLevel(spinningCar, 0.0)
  SetVehicleOnGroundProperly(spinningCar)
  SetVehicleNumberPlateText(spinningCar, "SPIN2WIN")
  if carOnShow2Active then
    SetVehicleDirtLevel(auxCar, 0.0)
    SetVehicleOnGroundProperly(auxCar)
    SetVehicleNumberPlateText(auxCar, "SPIN2WIN")
    SetVehicleDoorsLocked(auxCar, 2)
    SetVehicleUndriveable(auxCar, true)
  end
  Wait(0)
  FreezeEntityPosition(spinningCar, 1)
  if carOnShow2Active then
    FreezeEntityPosition(auxCar, 1)
  end
end
-- END CAR FOR WINS

AddEventHandler("drp-casino:elevatorEnterCasino", function()
  enterCasino(true)
end)
AddEventHandler("drp-casino:elevatorExitCasino", function()
  enterCasino(false)
end)

AddEventHandler("drp-polyzone:enter", function(zone)
  if zone == "casino_entrance" then
    enterCasino(true)
  elseif zone == "casino_exit" then
    enterCasino(false)
  end
end)

-- local lastPostGateTrigger = 0
-- AddEventHandler("drp-polyzone:enter", function(zone)
--   if zone ~= "casino_post_gate" then return end
--   -- postGateTriggered = true
--   -- if lastPostGateTrigger ~= 0 and lastPostGateTrigger + (60 * 60000) > GetGameTimer() then
--   --   return
--   -- end
--   -- lastPostGateTrigger = GetGameTimer()
--   -- TriggerServerEvent("drp-bugs:playerLogAction", {
--   --   title = "Entered Casino Post-Gate",
--   --   content = "(" .. exports["isPed"]:isPed("cid") .. ") "
--   --     .. exports["isPed"]:isPed("firstname") .. " "
--   --     .. exports["isPed"]:isPed("lastname")
--   -- })
-- end)

-- AddEventHandler("drp-polyzone:enter", function(zone)
--   if zone ~= "casino_betting_screen" then return end
--   doDuiStuffMate()
-- end)
-- AddEventHandler("drp-polyzone:exit", function(zone)
--   if zone ~= "casino_betting_screen" then return end
--   RemoveReplaceTexture('vw_vwint01_betting_screen', 'script_rt_casinoscreen_02')
--   -- for i=1,16 do
--   --   local txd = tostring(i)
--   --   local txn = tostring(i + 2)
--   --   if i < 10 then 
--   --     txd = "0" .. tostring(i)
--   --   end
--   --   if i < 8 then
--   --     txn = "0" .. tostring(i + 2)
--   --   end
--   --   RemoveReplaceTexture('vw_vwint01_betting_sreen_' .. txd, 'script_rt_casinoscreen_' .. txn)
--   -- end
--   -- for idx,obj in ipairs(duiList) do
--   --     DestroyDui(obj)
--   --     duiList[idx] = nil
--   -- end
-- end)

function enterCasino(pIsInCasino)
  if pIsInCasino == inCasino then return end
  inCasino = pIsInCasino
  if DoesEntityExist(spinningCar) then
    DeleteEntity(spinningCar)
  end
  if isPowerOut then
    TriggerEvent("weather:blackout", not inCasino)
  end
  local function doInitStuff()
    spinMeRightRoundBaby()
    showDiamondsOnScreenBaby()
    playSomeBackgroundAudioBaby()
    --doSomeTextureReplacesBruv(true)
    --showThe6StrImage(true)
    -- doWeaponBlock()
    -- stopRunningInMyCasino()
    -- doRaffleTickets()
  end
  -- if not pFromElevator then
  --   DoScreenFadeOut(500)
  --   Wait(500)
  --   NetworkFadeOutEntity(PlayerPedId(), true, true)
  --   Wait(300)
  --   SetPedCoordsKeepVehicle(PlayerPedId(), pCoords)
  --   SetEntityHeading(PlayerPedId(), pHeading)
  --   Citizen.CreateThread(function()
  --     -- if enterFirstTime and inCasino then
  --     --   enterFirstTime = false
  --     --   Citizen.Wait(500)
  --     --   SetPedCoordsKeepVehicle(PlayerPedId(), exitTeleportCoords)
  --     --   Citizen.Wait(500)
  --     --   SetPedCoordsKeepVehicle(PlayerPedId(), entranceTeleportCoords)
  --     -- end
  --     if inCasino then
  --       local pedCoords = RPC.execute("drp-casino:getSpawnedPedCoords", true)
  --       handlePedCoordsBaby(pedCoords)
  --       Citizen.Wait(250)
  --     else
  --       Citizen.Wait(800)
  --     end
  --     ClearPedTasksImmediately(PlayerPedId())
  --     SetGameplayCamRelativeHeading(0.0)
  --     NetworkFadeInEntity(PlayerPedId(), true)
  --     if inCasino then
  --       doInitStuff()
  --     end
  --     Citizen.Wait(500)
  --     DoScreenFadeIn(500)
  --   end)
  -- end
  if not inCasino then
    doSomeTextureReplacesBruv(false)
    showThe6StrImage(false)
    RPC.execute("drp-casino:getSpawnedPedCoords", false)
    TriggerEvent("drp-casino:casinoExitedEvent")
    TriggerServerEvent('drp-infinity:scopes:casino', false)
    postGateTriggered = false
    return
  end
  -- local pedCoords = RPC.execute("drp-casino:getSpawnedPedCoords", true)
  -- handlePedCoordsBaby(pedCoords)
  doInitStuff()
  TriggerEvent("drp-casino:casinoEnteredEvent")
  TriggerServerEvent('drp-infinity:scopes:casino', true)
end

Citizen.CreateThread(function()
  -- enterCasino(true)
  Wait(10000)
  RPC.execute("drp-casino:getCurrentInteriorSetName")
  local data = RPC.execute("drp-heists:getVaultLowerState")
  isPowerOut = not data.cityPowerState
end)

local casinoRaffleThreadActive = false
function doRaffleTickets()
  if casinoRaffleThreadActive then return end
  casinoRaffleThreadActive = true
  Citizen.CreateThread(function()
    while inCasino do
      Citizen.Wait(5 * 60000)
      if inCasino and postGateTriggered then
        if hasMembership() then
          --RPC.execute("drp-casino:generateRaffleTicket")
        end
      end
    end
    casinoRaffleThreadActive = false
  end)
end

RegisterNetEvent("sv-heists:cityPowerState", function(pIsPowerOut)
  isPowerOut = not pIsPowerOut
  if not isPowerOut then return end
  if not inCasino then return end
  for i = 1, 5 do
    Citizen.Wait(200)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
  end
  Wait(1000)
  TriggerEvent("chatMessage", "^2[Diamond Casino & Resort]", {100, 100, 100}, "Power outage detected. Backup generators will enable momentarily.")
  Wait(3500)
  for i = 1, 5 do
    Citizen.Wait(200)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
  end
  TriggerEvent("weather:blackout", false)
end)

RegisterNetEvent("sv-heists:casinoPowerBlip", function()
  if not isPowerOut then return end
  if not inCasino then return end
  for i = 1, 5 do
    Citizen.Wait(200)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
  end
  Wait(1000)
  TriggerEvent("chatMessage", "^2[Diamond Casino & Resort]", {100, 100, 100}, "Backup generator disturbed, switching power routing.")
  Wait(3500)
  TriggerEvent("weather:blackout", true)
  for i = 1, 5 do
    Citizen.Wait(200)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
  end
  TriggerEvent("weather:blackout", false)
end)

--First one is big screen, 2-17 are the small betting screens
--currently setup to use the 1st link for everything
--also: doing this many duis likes to crash a lot
local linkList = {
  [1] = 'https://prod-gta.nopixel.net/casinowall/',
  -- [2] = 'https://i.imgur.com/0S2zo4z.png',
  -- [3] = "https://i.imgur.com/0S2zo4z.png",
  -- [4] = "https://i.imgur.com/0S2zo4z.png",
  -- [5] = "https://i.imgur.com/0S2zo4z.png",
  -- [6] = "https://i.imgur.com/0S2zo4z.png",
  -- [7] = "https://i.imgur.com/0S2zo4z.png",
  -- [8] = "https://i.imgur.com/0S2zo4z.png",
  -- [9] = "https://i.imgur.com/0S2zo4z.png",
  -- [10] = "https://i.imgur.com/0S2zo4z.png",
  -- [11] = "https://i.imgur.com/0S2zo4z.png",
  -- [12] = "https://i.imgur.com/0S2zo4z.png",
  -- [13] = "https://i.imgur.com/0S2zo4z.png",
  -- [14] = "https://i.imgur.com/0S2zo4z.png",
  -- [15] = "https://i.imgur.com/0S2zo4z.png",
  -- [16] = "https://i.imgur.com/0S2zo4z.png",
  -- [17] = "https://i.imgur.com/0S2zo4z.png"
}

function doDuiStuffMate()
  for idx,link in ipairs(linkList) do
    if not duiList[idx] then
      local resolution = (idx == 1 and {2048, 1024} or {1280, 800})
      duiList[idx] = CreateDui(link, resolution[1], resolution[2])
    -- else
    --   SetDuiUrl(duiList[idx], link)
      local dui = GetDuiHandle(duiList[idx])
      local txd = CreateRuntimeTxd('duiTxdBetScreen_' .. idx)
      local txd2 = CreateRuntimeTextureFromDuiHandle(txd, 'duiTexBetScreen_' .. idx, dui)
    end
  end
  AddReplaceTexture('vw_vwint01_betting_screen', 'script_rt_casinoscreen_02', 'duiTxdBetScreen_1', 'duiTexBetScreen_1')
  -- for i=1,16 do
  --   local txd = tostring(i)
  --   local txn = tostring(i + 2)
  --   if i < 10 then 
  --     txd = "0" .. tostring(i) 
  --   end
  --   if i < 8 then
  --     txn = "0" .. tostring(i + 2)
  --   end
  --   --AddReplaceTexture('vw_vwint01_betting_sreen_' .. txd, 'script_rt_casinoscreen_' .. txn, 'duiTxdBetScreen_' .. tostring(i + 1), 'duiTexBetScreen_' .. tostring(i + 1))
  --   --AddReplaceTexture('vw_vwint01_betting_sreen_' .. txd, 'script_rt_casinoscreen_' .. txn, 'duiTxdBetScreen_1', 'duiTexBetScreen_1')
  -- end
end

function doSomeTextureReplacesBruv(apply)

    RemoveReplaceTexture('vw_prop_vw_luckywheel_01a', 'script_rt_casinowheel')

  if wheelDui == nil then
    AddReplaceTexture('vw_prop_vw_luckywheel_01a', 'script_rt_casinowheel')
  else
  end
end

function showThe6StrImage(apply)
  if not apply then
    RemoveReplaceTexture('vw_prop_vw_cinema_tv_01', 'script_rt_tvscreen')
   -- exports["drp-lib"]:releaseDui(tvDui.id)
    tvDui = nil
    return
  end
  if tvDui == nil then
    AddReplaceTexture('vw_prop_vw_cinema_tv_01', 'script_rt_tvscreen')
  else
  end
end

function doWeaponBlock()
  Citizen.CreateThread(function()
    while inCasino do
      Citizen.Wait(1500)
      if IsPedArmed(PlayerPedId(), 7) then
        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
      end
    end
  end)
end

function stopRunningInMyCasino()
  Citizen.CreateThread(function()
    while inCasino do
      DisableControlAction(0, 21, true) -- disable sprint
      Citizen.Wait(0)
    end
  end)
end

function spinMeRightRoundBaby()
  Citizen.CreateThread(function()
    while inCasino do
      if not spinningObject or spinningObject == 0 or not DoesEntityExist(spinningObject) then
        spinningObject = GetClosestObjectOfType(974.22, 39.76, 72.16, 10.0, -1561087446, 0, 0, 0)
        drawCarForWins()
      end
      if spinningObject ~= nil and spinningObject ~= 0 then
        local curHeading = GetEntityHeading(spinningObject)
        local curHeadingCar = GetEntityHeading(spinningCar)
        if curHeading >= 360 then
          curHeading = 0.0
          curHeadingCar = 0.0
        elseif curHeading ~= curHeadingCar then
          curHeadingCar = curHeading
        end
        SetEntityHeading(spinningObject, curHeading + 0.075)
        SetEntityHeading(spinningCar, curHeadingCar + 0.075)
      end
      Wait(0)
    end
    spinningObject = nil
  end)
end

-- Casino Screens
local Playlists = {
  "CASINO_DIA_PL", -- diamonds
  "CASINO_SNWFLK_PL", -- snowflakes
  "CASINO_WIN_PL", -- win
  "CASINO_HLW_PL", -- skull
}
-- Render
function CreateNamedRenderTargetForModel(name, model)
  local handle = 0
  if not IsNamedRendertargetRegistered(name) then
    RegisterNamedRendertarget(name, 0)
  end
  if not IsNamedRendertargetLinked(model) then
    LinkNamedRendertarget(model)
  end
  if IsNamedRendertargetRegistered(name) then
    handle = GetNamedRendertargetRenderId(name)
  end
  return handle
end
-- render tv stuff
function showDiamondsOnScreenBaby()
  Citizen.CreateThread(function()
    local propNames = {"vw_vwint01_video_overlay", "gbz_casino_video_overlay"}
    for _, propName in pairs(propNames) do
      Citizen.CreateThread(function()
        local model = GetHashKey(propName)
        local timeout = 21085 -- 5000 / 255
        local casinoScreenStr = propName == "vw_vwint01_video_overlay" and "CasinoScreen_01" or "CasinoScreen_02"
        local handle = CreateNamedRenderTargetForModel(casinoScreenStr, model)
        --print(model, propName, casinoScreenStr, handle)
        RegisterScriptWithAudio(0)
        SetTvChannel(-1)
        SetTvVolume(0)
        SetScriptGfxDrawOrder(4)
        SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
        SetTvChannel(2)
        EnableMovieSubtitles(1)

        function doAlpha()
          Citizen.SetTimeout(timeout, function()
            SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
            SetTvChannel(2)
            if inCasino then
              doAlpha()
            end
          end)
        end
        doAlpha()

        Citizen.CreateThread(function()
          while inCasino do
            SetTextRenderId(handle)
            DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
            SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            Citizen.Wait(0)
          end
          SetTvChannel(-1)
          ReleaseNamedRendertarget(GetHashKey(casinoScreenStr))
          SetTextRenderId(GetDefaultScriptRendertargetRenderId())
        end)
      end)
    end
  end)
end

function showDiamondsOnInsideTrackScreenBaby()
  Citizen.CreateThread(function()
    local model = GetHashKey("vw_vwint01_betting_screen")
    local timeout = 21085 -- 5000 / 255

    local handle = CreateNamedRenderTargetForModel("CasinoScreen_02", model)

    RegisterScriptWithAudio(0)
    SetTvChannel(-1)
    SetTvVolume(0)
    SetScriptGfxDrawOrder(4)
    SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
    SetTvChannel(2)
    EnableMovieSubtitles(1)

    function doAlpha()
      Citizen.SetTimeout(timeout, function()
        SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
        SetTvChannel(2)
        if inCasino then
          doAlpha()
        end
      end)
    end
    doAlpha()

    Citizen.CreateThread(function()
      while inCasino do
        SetTextRenderId(handle)
        DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
        SetTextRenderId(GetDefaultScriptRendertargetRenderId())
        Citizen.Wait(0)
      end
      SetTvChannel(-1)
      ReleaseNamedRendertarget(GetHashKey("CasinoScreen_02"))
      SetTextRenderId(GetDefaultScriptRendertargetRenderId())
    end)
  end)
end

function playSomeBackgroundAudioBaby()
  Citizen.CreateThread(function()
    local function audioBanks()
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1) do
        Citizen.Wait(0)
      end
      -- while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_INTERIOR_STEMS", false, -1) do
      --   print('load 5')
      --   Wait(0)
      -- end
    end
    audioBanks()
    while inCasino do
      if inVRHeadset and IsStreamPlaying() then
        StopStream()
      end
      if inVRHeadset and IsAudioSceneActive("DLC_VW_Casino_General") then
        StopAudioScene("DLC_VW_Casino_General")
      end
      if not inVRHeadset and not IsStreamPlaying() and LoadStream("casino_walla", "DLC_VW_Casino_Interior_Sounds") then
        PlayStreamFromPosition(996.13,38.48,71.07)
      end
      if not inVRHeadset and IsStreamPlaying() and not IsAudioSceneActive("DLC_VW_Casino_General") then
        StartAudioScene("DLC_VW_Casino_General")
      end
      Citizen.Wait(1000)
    end
    if IsStreamPlaying() then
      StopStream()
    end
    if IsAudioSceneActive("DLC_VW_Casino_General") then
      StopAudioScene("DLC_VW_Casino_General")
    end
  end)
end

local myPeds = {}
function handlePedCoordsBaby(pPedCoords)
  if not pPedCoords or not inCasino then return end
  for _, pedData in pairs(pPedCoords) do
    RequestModel(pedData.model)
    while not HasModelLoaded(pedData.model) do
      Wait(0)
    end
    SetModelAsNoLongerNeeded(pedData.model)
    local ped = CreatePed(pedData._pedType, pedData.model, pedData.coords, pedData.heading, 1, 1)
    while not DoesEntityExist(ped) do
      Wait(0)
    end
    SetPedRandomComponentVariation(ped, 0)
    local pedNetId = 0
    while NetworkGetNetworkIdFromEntity(ped) == 0 do
      Wait(0)
    end
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    pedNetId = NetworkGetNetworkIdFromEntity(ped)
    SetNetworkIdCanMigrate(ped, true)
    myPeds[#myPeds + 1] = { entity = ped, scenario = pedData.scenario, netId = pedNetId }
    Wait(0)
  end
  RPC.execute("drp-casino:handoffPedData", myPeds)
  Citizen.CreateThread(function()
    while inCasino do
      for _, ped in pairs(myPeds) do
        if IsPedDeadOrDying(ped.entity, 1) then
          DeleteEntity(ped.entity)
        elseif math.random() < 0.002 then
          TaskWanderStandard(ped.entity)
        elseif not IsPedActiveInScenario(ped.entity) then
          ClearPedTasks(ped.entity)
          TaskStartScenarioInPlace(ped.entity, ped.scenario, 0, 1)
        end
      end
      Wait(15000)
    end
  end)
  -- debug
  -- Citizen.CreateThread(function()
  --   while inCasino do
  --     for _, ped in pairs(myPeds) do
  --       if #(GetEntityCoords(ped.entity) - GetEntityCoords(PlayerPedId())) < 1.2 then
  --         print(ped.entity, ped.scenario)
  --       end
  --     end
  --     Wait(1000)
  --   end
  -- end)
end

-- chips
RegisterUICallback("drp-ui:casinoPurchaseChipsAmount", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local amount = data.values.amount
  RPC.execute("drp-casino:purchaseChips", amount)
  exports['drp-ui']:closeApplication('textbox')
end)

RegisterUICallback("drp-ui:transferChipsAmount", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local amount = data.values.amount
  local stateId = data.values.state_id
  RPC.execute("drp-casino:transferChips", stateId, amount)
  exports['drp-ui']:closeApplication('textbox')
end)

AddEventHandler("drp-casino:purchaseChipsAction", function(pArgs)
  local action = pArgs[1]
  if not hasMembership() then
    TriggerEvent("DoLHudText", 2, "casino-members-only", "Members only")
    return
  end
  if action == "purchase" then
    Wait(100)
    exports['drp-ui']:openApplication('textbox', {
      callbackUrl = 'drp-ui:casinoPurchaseChipsAmount',
      key = 1,
      items = {
        {
          icon = "dollar-sign",
          label = _L("casino-purchase-amount", "Purchase Amount"),
          name = "amount",
        },
      },
      show = true,
    })
  elseif action == "purchase:dirty" then
    local payment = math.random(10, 110)
    if exports["drp-inventory"]:hasEnoughOfItem("markedbills", 20, false, true) then
      TriggerEvent("inventory:removeItem", "markedbills", 20)
      payment = payment + (250 * 20) -- $5k / $250 per
    end
    if exports["drp-inventory"]:hasEnoughOfItem("rollcash", 5, false, true) then
      TriggerEvent("inventory:removeItem", "rollcash", 5)
      payment = payment + (30 * 5) -- $150 / $30 per
    end
    if exports["drp-inventory"]:hasEnoughOfItem("band", 5, false, true) then
      TriggerEvent("inventory:removeItem", "band", 5)
      payment = payment + (300 * 5) -- $1500, / $300 per
    end
    RPC.execute("drp-casino:purchaseChipsDirty", payment)
  elseif action == "withdraw:cash" then
    RPC.execute("drp-casino:withdrawChips", "cash")
  elseif action == "withdraw:bank" then
    RPC.execute("drp-casino:withdrawChips", "bank")
  elseif action == "transfer" then
    Wait(100)
    exports['drp-ui']:openApplication('textbox', {
      callbackUrl = 'drp-ui:transferChipsAmount',
      key = 1,
      items = {
        {
          icon = "user",
          label = _L("casino-state-id", "State ID"),
          name = "state_id",
        },
        {
          icon = "dollar-sign",
          label = _L("casino-amount", "Amount"),
          name = "amount",
        },
      },
      show = true,
    })
  end
end)

AddEventHandler("drp-casino:purchaseMembership", function()
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino"} })
  if not jobAccess then
    TriggerEvent("DoLHudText", 2, "casino-please-talk-to-floor-staff", "Please talk to a member of floor staff")
    return
  end
  exports['drp-ui']:openApplication('textbox', {
    callbackUrl = 'drp-ui:casinoGetMembership',
    key = 1,
    items = {
      {
        icon = "user",
        label = _L("casino-state-id", "State ID"),
        name = "state_id",
      },
    },
    show = true,
  })
end)
RegisterUICallback("drp-ui:casinoGetMembership", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports['drp-ui']:closeApplication('textbox')
  TriggerEvent("player:receiveItem", "casinomember", 1, false, { state_id = data.values.state_id }, { state_id = data.values.state_id })
end)

AddEventHandler("drp-casino:purchaseMembershipCard", function()
  local characterId = exports["isPed"]:isPed("cid")
  RPC.execute("drp-casino:purchaseMembershipCard", characterId)
end)

AddEventHandler("drp-casino:getLoyaltyCard", function()
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino"} })
  if not jobAccess then
    TriggerEvent("DoLHudText", 2, "casino-please-talk-to-floor-staff", "Please talk to a member of floor staff")
    return
  end
  TriggerEvent("player:receiveItem", "casinoloyalty", 1, false, { state_id = characterId }, { state_id = characterId })
end)

AddEventHandler("drp-casino:purchaseVipMembership", function()
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino"} })
  if not jobAccess then
    TriggerEvent("DoLHudText", 2, "casino-please-talk-to-floor-staff", "Please talk to a member of floor staff")
    return
  end
  exports['drp-ui']:openApplication('textbox', {
    callbackUrl = 'drp-ui:casinoGetVipMembership',
    key = 1,
    items = {
      {
        icon = "user",
        label = _L("casino-state-id", "State ID"),
        name = "state_id",
      },
    },
    show = true,
  })
end)
RegisterUICallback("drp-ui:casinoGetVipMembership", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports['drp-ui']:closeApplication('textbox')
  TriggerEvent("player:receiveItem", "casinovip", 1, false, { state_id = data.values.state_id }, { state_id = data.values.state_id })
end)

AddEventHandler("drp-casino:purchaseDrinks", function(data)
  TriggerEvent("server-inventory-open", "46", "Shop")
end)

function hasMembership(hrOnly)
  if exports['drp-config']:GetMiscConfig("casino.membership.bypass") then
    return true
  end
  -- if    (not hrOnly and not exports['drp-inventory']:hasEnoughOfItem("casinomember", 1, false, true))
  --   and not exports['drp-inventory']:hasEnoughOfItem("casinovip", 1, false, true)
  -- then
  --   return false
  -- end
  local characterId = exports["isPed"]:isPed("cid")
  -- local info = hrOnly and nil or exports["drp-inventory"]:GetInfoForFirstItemOfName("casinomember")
  -- if not info then
  --   info = exports["drp-inventory"]:GetInfoForFirstItemOfName("casinovip")
  -- end
  local info = exports["drp-inventory"]:GetInfoForFirstItemOfName("casinomember")
  if not info then
    return false
  end
  info = json.decode(info.information)
  return tonumber(info.state_id) == tonumber(characterId)
end
exports('hasMembership', hasMembership)

AddEventHandler("drp-casino:inVRHeadset", function(pInVRHeadset)
  inVRHeadset = pInVRHeadset
end)

RegisterUICallback("drp-ui:casinoCheckSpentWheelAmount", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local stateId = data.values.state_id
  RPC.execute("drp-casino:checkSpentAmount", stateId)
  exports['drp-ui']:closeApplication('textbox')
end)
AddEventHandler("drp-casino:wheel:checkSpentAmount", function()
  local cid = exports["isPed"]:isPed("cid")
  if cid ~= 3503 then
    TriggerEvent("DoLHudText", 2, "casino-cannot-do-that", "You cannot do that.")
    return
  end
  exports['drp-ui']:openApplication('textbox', {
    callbackUrl = 'drp-ui:casinoCheckSpentWheelAmount',
    key = 1,
    items = {
      {
        icon = "user-alt",
        label = _L("casino-state-id", "State ID"),
        name = "state_id",
      },
    },
    show = true,
  })
end)

-- RegisterCommand("incas", function()
--   inCasino = not inCasino
-- end)

-- Citizen.CreateThread(function()
--   -- StartScreenEffect("SwitchOpenNeutralFIB5", 2000, 0)
--   -- Wait(400)
--   -- StartScreenEffect("PeyoteOut", 4000, 0)
--   -- Wait(1600)
--   -- StopScreenEffect("SwitchOpenNeutralFIB5")
--   -- Wait(3000)
--   -- StopScreenEffect("PeyoteOut")
--   SetTimecycleModifier("BarryFadeOut")
--   Wait(4000)
--   local idx = 1.0
--   while idx > 0 do
--     Wait(32)
--     SetTimecycleModifierStrength(idx)
--     idx = idx - 0.02
--   end
--   ClearTimecycleModifier()
-- end)

--testing and setup
-- local casinoEntranceCoords = vector3(1089.73, 206.36, -48.99)
-- local coordsBro = {}
-- RegisterCommand("+addCasinoCoords", function()
--   local coords = GetEntityCoords(PlayerPedId())
--   local heading = GetEntityHeading(PlayerPedId())
--   print('regular', coords, heading)
--   -- local interior = GetInteriorAtCoords(1100.000, 220.000, -50.000)
--   -- local offset = GetOffsetFromInteriorInWorldCoords(interior, coords)
--   local entity = GetClosestObjectOfType(1100.0, 220.0, -51.0, 10.0, -1561087446, 0, 0, 0) -- spinny boi
--   print(entity)
--   SetEntityHeading(entity, 0.0)
--   local offset = GetOffsetFromEntityGivenWorldCoords(entity, coords)
--   print('offset', offset)
--   coordsBro[#coordsBro + 1] = {
--     entityExists = entity ~= 0,
--     coords = coords,
--     offset = offset,
--     heading = heading,
--     flag = 0,
--   }
--   print(json.encode(coordsBro))
--   print(json.encode(coordsBro[#coordsBro]))
-- end, false)
-- RegisterCommand("-addCasinoCoords", function() end, false)

-- -- 1 = FILM SHOCKING
-- -- 2 = BROWSE
-- -- 3 = RANDOM
-- -- 4 = SIT
-- RegisterCommand("doflag", function(src, args)
--   print(src, json.encode(args))
--   coordsBro[#coordsBro].flag = args[1]
--   print(json.encode(coordsBro[#coordsBro]))
-- end, false)
-- Citizen.CreateThread(function()
--   exports["drp-keybinds"]:registerKeyMapping("", "Casino", "Add Coords", "+addCasinoCoords", "-addCasinoCoords")
-- end)

-- Citizen.CreateThread(function()
--   for _, v in pairs(exports["drp-casino"]:getPedCoordsC()) do
--     if #(vector3(v.coords.x, v.coords.y, v.coords.z) - vector3(1094.15,220.64,-48.99) ) < 2.5 then
--       print(v.coords.x, v.coords.y, v.coords.z)
--       SetEntityCoords(PlayerPedId(), v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0)
--       Wait(1000)
--     end
--   end
-- end)
