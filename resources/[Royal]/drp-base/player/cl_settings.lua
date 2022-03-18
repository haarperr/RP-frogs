DRP.SettingsData = DRP.SettingsData or {}
DRP.Settings = DRP.Settings or {}

DRP.Settings.Current = {}
-- Current bind name and keys
DRP.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["clickVolume"] = 0.8,
    ["radioVolume"] = 0.8,
    ["phoneVolume"] = 0.8,
    ["releaseDelay"] = 200
  },
  ["hud"] = {

  }

}


function DRP.SettingsData.setSettingsTable(settingsTable, shouldSend)
  if settingsTable == nil then
    DRP.Settings.Current = DRP.Settings.Default
    TriggerServerEvent('drp-base:sv:player_settings_set',DRP.Settings.Current)
    DRP.SettingsData.checkForMissing()
  else
    if shouldSend then
      DRP.Settings.Current = settingsTable
      TriggerServerEvent('drp-base:sv:player_settings_set',DRP.Settings.Current)
      DRP.SettingsData.checkForMissing()
    else
       DRP.Settings.Current = settingsTable
       DRP.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",DRP.Settings.Current)

end

function DRP.SettingsData.setSettingsTableGlobal(self, settingsTable)
  DRP.SettingsData.setSettingsTable(settingsTable,true);
end

function DRP.SettingsData.getSettingsTable()
    return DRP.Settings.Current
end

function DRP.SettingsData.setVarible(self,tablename,atrr,val)
  DRP.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('drp-base:sv:player_settings_set',DRP.Settings.Current)
end

function DRP.SettingsData.getVarible(self,tablename,atrr)
  return DRP.Settings.Current[tablename][atrr]
end

function DRP.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(DRP.Settings.Default) do
    if DRP.Settings.Current[j] == nil then
      isMissing = true
      DRP.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  DRP.Settings.Current[j][k] == nil then
           DRP.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('drp-base:sv:player_settings_set',DRP.Settings.Current)
  end


end

RegisterNetEvent("drp-base:cl:player_settings")
AddEventHandler("drp-base:cl:player_settings", function(settingsTable)
  DRP.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("drp-base:cl:player_reset")
AddEventHandler("drp-base:cl:player_reset", function(tableName)
  if DRP.Settings.Default[tableName] then
      if DRP.Settings.Current[tableName] then
        DRP.Settings.Current[tableName] = DRP.Settings.Default[tableName]
        DRP.SettingsData.setSettingsTable(DRP.Settings.Current,true)
      end
  end
end)