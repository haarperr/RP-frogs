-- local NearLaptopSpot = false

-- Citizen.CreateThread(function()
--   exports["drp-polyzone"]:AddBoxZone("laptop_spot", vector3(1641.6, 4853.34, 42.02), 1.4, 1, {
--     name="laptop_spot",
--     --debugPoly=true,
--     heading=0,
--     minZ=40.22,
--     maxZ=43.22
--   }) 
-- end)

-- RegisterNetEvent('drp-polyzone:enter')
-- AddEventHandler('drp-polyzone:enter', function(name)
--   if name == "laptop_spot" then
--     NearLaptopSpot = true
--       TriggerEvent('drp-textui:ShowUI', 'show', ("%s"):format("[E] Use Note")) 
--       LaptopSpot()
--   end
-- end)

-- RegisterNetEvent('drp-polyzone:exit')
-- AddEventHandler('drp-polyzone:exit', function(name)
--   if name == "laptop_spot" then
--     NearLaptopSpot = false
--   end
-- end)

-- function LaptopSpot()
--   Citizen.CreateThread(function()
--       while NearLaptopSpot do
--           Citizen.Wait(5)
--           if IsControlJustReleased(0, 38) then
--             if exports["drp-inventory"]:hasEnoughOfItem('secretnote',1,false) then
--               TriggerEvent("inventory:removeItem", "secretnote", 1)
--               TriggerServerEvent("drp-fleeca:item")
--             end
--           end
--       end
--   end)
-- end

RegisterNetEvent('drp-secret:menu')
AddEventHandler('drp-secret:menu', function()
  TriggerServerEvent("drp-secret:menu")
end)

RegisterNetEvent('drp-secret:craft')
AddEventHandler('drp-secret:craft', function()
  if exports["drp-inventory"]:hasEnoughOfItem("cpu",1) and exports["drp-inventory"]:hasEnoughOfItem("powersupply",1) then
    local finished = exports["drp-taskbar"]:taskBar(12000,"Gathering Information")
    if finished == 100 then	
    TriggerServerEvent("drp-secret:craft")
  else
      TriggerEvent("DoLongHudText", "You Are Missing Items.", 2)
      end
    end
end)