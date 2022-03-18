fx_version 'adamant'

games {'gta5'}

lua54 'yes'

ui_page('ui/index.html')

client_scripts {
    '@drp-remotecalls/client/cl_main.lua',
    "client/cl_*.lua"
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@drp-remotecalls/server/sv_main.lua',
    "server/sv_*.lua"
}

files({
    'ui/index.html',
    'ui/app.js',
    'ui/style.css',
    'ui/imgs/*.png',
})
