fx_version "bodacious"

author "Rio358, thelindat, DRKM43"
description "Hunting activity independant of any outside influence, see animal, murder animal, profit."
version "1.0.0.3"

game "gta5"
lua54 "yes"

shared_scripts {
  '@es_extended/imports.lua',
  'config.lua'
}

dependencies {
  'PolyZone',
  'qtarget',
  'mythic_progbar',
  'mythic_notify',
}

server_scripts {
  'server/*.lua'
}

client_scripts {
  'client/*.lua',

}
