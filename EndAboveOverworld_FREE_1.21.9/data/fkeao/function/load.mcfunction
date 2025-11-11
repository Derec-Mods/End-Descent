# project
data modify storage fkeao:text project.name set value "EndAboveOver"
scoreboard players set #fkeao.mcv.ko fktool 12108
scoreboard players set #fkeao.mcv.ok fktool 12109

# scores
scoreboard objectives add fkeao.options dummy {"text":"fkeao.options","color":"light_purple"}
scoreboard objectives add fkeao.access.end dummy {"text":"fkeao.access.end","color":"light_purple"}
scoreboard objectives add fkeao.pos.y dummy {"text":"fkeao.pos.y","color":"light_purple"}
scoreboard objectives add fkeao.dim dummy {"text":"fkeao.dim","color":"light_purple"}

# constants
scoreboard players set #340 fkeao.options 340
scoreboard players set #360 fkeao.options 360

# config
scoreboard players reset @e[type=!minecraft:player] fkeao.pos.y
function fkeao:lang/us
function fkeao:properties
function fkeao:schedules/list

# display
data modify storage fkeao:text project.print set value [{"text":"[","bold":true,"color":"gold","hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"load.devby","interpret":true}]}},{"storage":"fkeao:text","nbt":"project.name","interpret":true,"bold":true,"color":"gold"},{"text":"] ","bold":true,"color":"gold","hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"load.devby","interpret":true}]}}]
tellraw @a ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"storage":"fkeaotool:info","nbt":"load.enabled","interpret":true},{"storage":"fkeaotool:info","nbt":"load.options","interpret":true},{"text":"[click here]","bold":true,"color":"aqua","click_event":{"action":"suggest_command","command":"/function fkeao:options/get"}}]
execute if score McVersion fktool <= #fkeao.mcv.ko fktool run tellraw @a ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"storage":"fkeaotool:info","nbt":"load.mcvko","interpret":true},{"text":" Actual: "},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"},{"text":". Required: "},{"score":{"name":"#fkeao.mcv.ok","objective":"fktool"},"color":"gray"},{"text":". "},{"storage":"fkeaotool:info","nbt":"load.update","interpret":true}]
execute if score McVersion fktool >= #fkeao.mcv.ok fktool run tellraw @a ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"storage":"fkeaotool:info","nbt":"load.networks","interpret":true}]
tellraw @a ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"storage":"fkeaotool:info","nbt":"load.free","interpret":true}]
tellraw @a[tag=fkdev] [{"storage":"fkeaotool:info","nbt":"debug.fktoolversion","interpret":true}]
