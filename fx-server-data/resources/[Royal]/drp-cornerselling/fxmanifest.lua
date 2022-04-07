fx_version "cerulean"

games {"gta5"}

author "Kalxie"
description "A simple drug selling system made for IconicRP"
version "1.0.0"

server_script '@iconic-remotecalls/server/sv_main.lua'
client_script '@iconic-remotecalls/client/cl_main.lua'


client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

