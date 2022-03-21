Citizen.CreateThread(function()
    while not exports or not exports['hypnonema'] do Wait(1) end
    local URLTOPLAY = 'https://twitch.tv/xqcow'
    local screens = json.decode(exports.hypnonema:getScreenList())
    for k, v in pairs(screens) do
        if v.Name ~= nil then
            exports.hypnonema:play(v.Name, URLTOPLAY)
        end
    end
end)