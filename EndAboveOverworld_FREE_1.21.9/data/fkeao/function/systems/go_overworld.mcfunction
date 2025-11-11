tellraw @a[tag=fkdev] [{"selector":"@s","color":"red"},{"text":" -> go_overworld","color":"red"}]

# secure

execute if score #360 fkeao.options <= #340 fkeao.options run function fkeao:systems/secure/over_tp
execute store result storage fkeao:tp Over.Pos int 1 run scoreboard players get #340 fkeao.options

# tp
execute in minecraft:overworld run function fkeao:systems/tp with storage fkeao:tp Over
execute as @s[type=minecraft:player] run function fkeao:systems/transition
