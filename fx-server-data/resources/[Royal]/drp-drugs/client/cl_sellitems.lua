RegisterNetEvent('sell2ctchain')
AddEventHandler('sell2ctchain', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolen2ctchain",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling 2CT Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen2ctchain', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(120,210))
            TriggerEvent('DoLongHudText', 'You successfully sold a 2ct chain.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)
RegisterNetEvent('sell5ctchain')
AddEventHandler('sell5ctchain', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolen5ctchain",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling 5CT Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen5ctchain', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(120,310))
            TriggerEvent('DoLongHudText', 'You successfully sold a 5ct chain.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)
RegisterNetEvent('sell8ctchain')
AddEventHandler('sell8ctchain', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolen8ctchain",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling 8CT Chain")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolen8ctchain', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(320,510))
            TriggerEvent('DoLongHudText', 'You successfully sold a 8ct chain.', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)
RegisterNetEvent('sellstolengameboy')
AddEventHandler('sellstolengameboy', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolengameboy",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling Gameboy")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolengameboy', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(20,100))
            TriggerEvent('DoLongHudText', 'You successfully sold a Gameboy', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)
RegisterNetEvent('sellstolenoakleys')
AddEventHandler('sellstolenoakleys', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolenoakleys",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling Oakleys")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolenoakleys', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(50,150))
            TriggerEvent('DoLongHudText', 'You successfully sold some Oakleys', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)

RegisterNetEvent('sellstolenpsp')
AddEventHandler('sellstolenpsp', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolenpsp",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling PSP")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolenpsp', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(10,150))
            TriggerEvent('DoLongHudText', 'You successfully sold a PSP', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)
RegisterNetEvent('sellstolencasiowatch')
AddEventHandler('sellstolencasiowatch', function()
    if exports["drp-inventory"]:hasEnoughOfItem("stolencasiowatch",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Selling Casio Watch")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'stolencasiowatch', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(10,150))
            TriggerEvent('DoLongHudText', 'You successfully sold a Casio Watch', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
end)

RegisterNetEvent('sellrolex')
AddEventHandler('sellrolex', function()
    if exports["drp-inventory"]:hasEnoughOfItem("rolexwatch",1,false) then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Selling Rolex")
        if finished == 100 then
            TriggerEvent('inventory:removeItem', 'rolexwatch', 1)
            TriggerServerEvent( 'sk1c2:payout', math.random(300,450))
            TriggerEvent('DoLongHudText', 'You successfully sold a Rolex', 1)
        else
            TriggerEvent('DoLongHudText', 'Cancelled', 2)
        end

    else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
    end
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
	})
end)
