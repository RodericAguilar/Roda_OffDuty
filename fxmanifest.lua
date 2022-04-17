fx_version 'cerulean'

game 'gta5'

author 'Roderic#0001'
description 'Example'

--Client Scripts-- 
client_scripts {
 'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
    'Server/*.lua'
}

shared_scripts {
    'Shared.lua'
}

--UI Part-- 
ui_page {
 'html/index.html', 
}

--File Part-- 
files {
 'html/index.html',
 'html/app.js', 
 'html/style.css'
} 