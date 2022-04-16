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
    PerformHttpRequest('https://canary.discord.com/api/webhooks/961639588470857779/9ZV7V3-h1Vbvv5jSgxVM-nhh9oCLrnsmin5pzuHn3Sn4MLdQzipYHs0TD1dEvzPfJBw4", { ['Content-Type'] = 'application/json' })
end

-- it must be saving into a file with io.open("test.lua", "r")
