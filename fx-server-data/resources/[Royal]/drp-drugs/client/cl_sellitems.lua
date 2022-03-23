function doSell(itemname, price)
    if exports["drp-inventory"]:getQuantity(itemname) >= 1 then
        local toSell = exports["drp-inventory"]:getAmountOfItem(itemname)
		local finished = exports["drp-taskbar"]:taskBar(1000*toSell, "Selling")
		if finished == 100 then
			if exports["drp-inventory"]:getQuantity(itemname) >= 1 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', itemname, toSell)
                TriggerServerEvent( 'sk1c2:payout', (price-50*toSell)) -- -50 overall nerf

                lucky = math.random(1,100)
                if lucky == 1 then
                    TriggerServerEvent( 'sk1c2:payout', math.random(750, 1500))
                    TriggerEvent('DoLongHudText', 'You are a loyal customer, here is some extra cash.', 2)
                end

                lucky = math.random(1,250)
                if lucky == 1 then
                    TriggerServerEvent( 'sk1c2:payout', math.random(5000, 12500))
                    TriggerEvent('DoLongHudText', 'You are my best customer, here is some extra cash.', 2)
                end
			else
                TriggerEvent('DoLongHudText', 'Might want to try again you do not have that in your pockets', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
	end
end
    

RegisterNetEvent('sell2ctchain')
AddEventHandler('sell2ctchain', function()
    doSell("stolen2ctchain", math.random(120,210))
end)


RegisterNetEvent('sell5ctchain')
AddEventHandler('sell5ctchain', function()
    doSell("stolen5ctchain", math.random(120,275))
end)

RegisterNetEvent('sell8ctchain')
AddEventHandler('sell8ctchain', function()
    doSell("stolen8ctchain", math.random(220,350))
end)
RegisterNetEvent('sellstolengameboy')
AddEventHandler('sellstolengameboy', function()
    doSell("stolengameboy", math.random(20,125))
end)

RegisterNetEvent('sellstolenoakleys')
AddEventHandler('sellstolenoakleys', function()
    doSell("stolenoakleys", math.random(50,150))
end)

RegisterNetEvent('sellstolenpsp')
AddEventHandler('sellstolenpsp', function()
    doSell("stolenpsp", math.random(100,175))
end)

RegisterNetEvent('sellstolencasiowatch')
AddEventHandler('sellstolencasiowatch', function()
    doSell("stolencasiowatch", math.random(25,125))
end)

RegisterNetEvent('sellrolex')
AddEventHandler('sellrolex', function()
    doSell("rolexwatch", math.random(200,400))
end)

RegisterNetEvent('selloxy')
AddEventHandler('selloxy', function()
    doSell("oxy", math.random(40, 55))
end)

--#########--
--# Fence #--

--#########--

RegisterNetEvent("fenceguy:menu")
AddEventHandler("fenceguy:menu", function()
	TriggerEvent('drp-context:sendMenu', {
        {
			id = "1",
			header = "Sell your goods!",
            txt = ""
		},
		{
			id = "2",
			header = "Sell 2ct Chain",
			txt = "",
			params = {
				event = "sell2ctchain",
			}
		},
        {
			id = "3",
			header = "Sell 5ct Chain",
			txt = "",
			params = {
				event = "sell5ctchain",
			}
		},
        {
			id = "4",
			header = "Sell 8ct Chain",
			txt = "",
			params = {
				event = "sell8ctchain",
			}
		},
        {
			id = "5",
			header = "Sell Gameboy",
			txt = "",
			params = {
				event = "sellstolengameboy",
			}
		},
        {
			id = "6",
			header = "Sell Oakleys",
			txt = "",
			params = {
				event = "sellstolenoakleys",
			}
		},
        {
			id = "7",
			header = "Sell PSP",
			txt = "",
			params = {
				event = "sellstolenpsp",
			}
		},
        {
			id = "8",
			header = "Sell Casio Watch",
			txt = "",
			params = {
				event = "sellstolencasiowatch",
			}
		},
        {
			id = "9",
			header = "Sell Rolex",
			txt = "",
			params = {
				event = "sellrolex",
			}
		},
        {
			id = "10",
			header = "Sell Oxy",
			txt = "",
			params = {
				event = "selloxy",
			}
		},
	})
end)
