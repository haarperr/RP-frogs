fx_version "cerulean"
game "gta5"

lua54 'yes'

name "NUI Context Menu"

ui_page "./ui/index.html"

files{
    "./ui/index.html",
    "./ui/main.css",
    "./ui/main.js",
}

client_script "client.lua"
client_script "main.lua"