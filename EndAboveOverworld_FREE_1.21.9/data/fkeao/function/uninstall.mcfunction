scoreboard objectives remove fkeao.options
scoreboard objectives remove fkeao.access.end
scoreboard objectives remove fkeao.pos.y
scoreboard objectives remove fkeao.dim

tag @a remove fkeao.transition
tag @a remove fkeao.particules

function fkeaotool:uninstall

tellraw @s ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"text":"Uninstalled.","color":"red"},{"text":" Don't forget to ","color":"red"},{"text":"[disable datapack]","bold":true,"color":"aqua","click_event":{"action":"suggest_command","command":"/datapack disable \"file/EndAboveOverworld"}}]
