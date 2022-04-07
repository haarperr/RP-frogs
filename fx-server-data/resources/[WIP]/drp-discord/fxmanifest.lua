fx_version "cerulean"
games { "gta5" }

shared_scripts {
    "@drp-lib/shared/sh_util.lua",
    "@drp-lib/shared/sh_ids.lua",
    "shared/*",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/*",
    "server/commands/*",
}

client_scripts {
    "client/*",
}