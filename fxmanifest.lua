fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'RSK CRAFTING By : R S K#6739 || BW TEAM'
author 'R S K#6739'
lua54 'yes'

ui_page 'ui/ui.html'

files {
	'ui/*.*',
	'ui/sounds/*.mp3'
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua',
}

dependency 'qr-core'

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'