fx_version 'adamant'
game 'gta5'

dependency "drp-base"
dependency "ghmattimysql"

ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/script.js",
    "ui/main.css",
    "ui/img/logo.png",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server.lua"
}

client_script "client.lua"
