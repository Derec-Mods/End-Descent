tellraw @a[tag=fkdev] [{"selector":"@s","color":"red"},{"text":" -> go_end","color":"red"}]

# secure

execute if score #-40 fktool >= #-10 fktool run function fkeao:systems/secure/end_tp
execute store result storage fkeao:tp End.Pos int 1 run scoreboard players get #-10 fktool

# tp
execute in minecraft:the_end run function fkeao:systems/tp with storage fkeao:tp End
function fkeao:systems/transition
