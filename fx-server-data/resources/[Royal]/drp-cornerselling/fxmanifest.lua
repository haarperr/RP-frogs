fx_version "cerulean"

games {"gta5"}

author "Kalxie"
description "A simple drug selling system made for IconicRP"
version "1.0.0"

server_script '/server/sv_main.lua'
client_script '/client/cl_main.lua'


client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

