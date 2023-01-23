fx_version "cerulean"
game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


client_script "client/main.lua"
files {'html/index.html', 'html/assets/*.js', 'html/assets/*.css'}
 ui_page "html/index.html"
-- ui_page "http://localhost:5173"