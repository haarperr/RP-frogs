RegisterServerEvent('error')
AddEventHandler('error',function(resource, args)

    sendToDiscord("```Error in "..resource..'```', args)
end)



function sendToDiscord(name, args, color)
    local connect = {
          {
              ["color"] = 16711680,
              ["title"] = "".. name .."",
              ["description"] = args,
              ["footer"] = {
                  ["text"] = "Error Logger - Made By Vopori",
              },
          }
      }
    PerformHttpRequest('https://discord.com/api/webhooks/956807237010067506/RbZsiM3_qjmXIDN2BJdAnvPdY3xzWEHEtdr6vx4GzgIClMRMox3yL59Ao9eyZT6d21iW", { ['Content-Type'] = 'application/json' })
end

-- it must be saving into a file with io.open("test.lua", "r")
