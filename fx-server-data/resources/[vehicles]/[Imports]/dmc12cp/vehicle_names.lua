function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('0x76F15B36', 'Delorean')
	AddTextEntry('0xA51DA55F', 'DMC-12 Cyberpunk')
end)