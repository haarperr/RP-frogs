RPC.register("drp-music:addMusicEntry", function(src, pData, pGroup)
    exports.ghmattimysql:execute([[
        INSERT INTO musics (title, artist, url)
        VALUES (?, ?, ?)
    ]],
    { pData.title, pData.artist, pData.url})

    TriggerClientEvent("DoLongHudText", src, "Music entry created!")

    return true
end)

RPC.register("drp-music:getSongOptions", function(src, pGroup)
    local musics =  exports.ghmattimysql:execute([[
        SELECT *
        FROM musics
        WHERE musics.group = ?
    ]],
    { pGroup })

    return musics
end)