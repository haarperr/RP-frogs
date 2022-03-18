fx_version 'adamant'

games {'gta5'}

ui_page('ui/index.html')

client_scripts {
   '@drp-remotecalls/client/cl_main.lua',
  'client/client.lua'
}

server_scripts {
  '@drp-remotecalls/server/sv_main.lua',
  'server/server.lua'
}

files({
    'ui/index.html',
    'ui/app.js',
    'ui/style.css',
})