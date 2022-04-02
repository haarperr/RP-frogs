--[[
    Functions
]]

function getDocuments(type, data)
    if not type or not data then return {} end

    local documents = exports.ghmattimysql:execute([[
        SELECT *
        FROM documents
        WHERE ?? = ?
    ]],
    { type, data })

    for i, v in ipairs(documents) do
        v["data"] = json.decode(v["data"])
    end

    return documents
end

function submitDocument(data, cid, group)
    if not data or (not cid and not group) then return end

    MySQL.insert.await([[
        INSERT INTO documents (cid, data)
        VALUES (?, ?)
    ]],
    { cid, json.encode(data) })

    if group then
        MySQL.insert.await([[
            INSERT INTO documents (documents.group, data)
            VALUES (?, ?)
        ]],
        { group, json.encode(data) })
    end

    return true
end

function deleteDocument(id)
    if not id then return end

    MySQL.update.await([[
        DELETE FROM documents
        WHERE id = ?
    ]],
    { id })

    return true
end

--[[
    Events
]]

RegisterNetEvent("drp-documents:showDocument")
AddEventHandler("drp-documents:showDocument", function(player, document)
    local src = source

    TriggerClientEvent("drp-documents:ViewDocument", player, document)
end)

RegisterNetEvent("drp-documents:copyDocument")
AddEventHandler("drp-documents:copyDocument", function(player, document)
    local src = source

    local cid = exports["isPed"]:isPed(player, "cid")
    if not cid then return end

    submitDocument(document, cid)

    TriggerClientEvent("DoLongHudText", player, "Youve received a document")
end)


--[[
    RPCs
]]

RPC.register("drp-documents:getDocuments", function(src, type, data)
    return getDocuments(type, data)
end)

RPC.register("drp-documents:submitDocument", function(src, data, cid, group)
    return submitDocument(data, cid, group)
end)

RPC.register("drp-documents:deleteDocument", function(src, id)
    return deleteDocument(id)
end)

