fx_version "bodacious"

author "Rio"
description "Hunting activity independant of any outside influence, see animal, murder animal, profit."
version "1.0.0.2"

game "gta5"

dependencies {
  'PolyZone',
  'bt-target'
}

server_scripts {
  'server/main.lua'
}

client_scripts {
  'client/main.lua',
}
