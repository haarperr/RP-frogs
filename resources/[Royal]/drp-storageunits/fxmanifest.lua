fx_version "cerulean"
games {"gta5"}

server_script '@drp-rpc/server/sv_main.lua'
client_script '@drp-rpc/client/cl_main.lua'

client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}