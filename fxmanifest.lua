fx_version "adamant"
games {"rdr3"}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	"@frp_lib/library/linker.lua",
	"@frp_lib/lib/dataview.lua",

	"new.lua",
	"client.lua",
	"events.lua",
	"exports.lua",
}

files {
	"ui/*",	
	"ui/fonts/*",	
	"ui/img/*",	
}

ui_page {
	"ui/index.html"
}
