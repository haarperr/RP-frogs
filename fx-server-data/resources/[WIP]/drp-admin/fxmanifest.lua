fx_version 'adamant'
game 'gta5'

ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/script.js",
    "ui/main.css",
    "ui/img/logo.png",
}

server_scripts {
    "@drp-lib/server/sv_rpc.lua",
    "server/sv_*.lua"
}

client_script {
    "@drp-lib/client/cl_ui.lua",
    "@drp-lib/client/cl_rpc.lua",
    "client/cl_*.lua",
}

