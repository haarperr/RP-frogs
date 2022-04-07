fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
    "html/*.html",
    "html/*.js",
    "html/*.css",
}

shared_scripts {
    "@drp-rpc/shared/sh_util.lua",
    "shared/*"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "@drp-rpc/server/sv_rpc.lua",
    "server/*"
}

client_scripts {
    "@drp-rpc/client/cl_rpc.lua",
    "client/*"
}