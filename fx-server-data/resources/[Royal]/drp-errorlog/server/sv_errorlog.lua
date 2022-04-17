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
    PerformHttpRequest('https://canary.discord.com/api/webhooks/965294258431074374/GNn_Rdszv-RRqYt-4QhvYi4Ni3E8BOgeZLumrb8Ohm2ko3hAhRp-lEwKWNKCvvsjYiQn', function(err, text, headers) end, 'POST', json.encode({username = "Error Logger",embeds = connect}), { ['Content-Type'] = 'application/json' })
end

-- it must be saving into a file with io.open("test.lua", "r")
