fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
    "html/*.html",
    "html/*.js",
    "html/*.css",
}

shared_scripts {
    "@drp-lib/shared/sh_util.lua",
    "shared/*"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "@drp-lib/server/sv_rpc.lua",
    "server/*"
}

client_scripts {
    "@drp-lib/client/cl_rpc.lua",
    "client/*"
}