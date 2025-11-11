# get y
execute store result score @s fkeao.pos.y run data get entity @s Pos[1]

# get dimension
scoreboard players set @s[predicate=fkeaotool:dimension/in_over] fkeao.dim 0
scoreboard players set @s[predicate=fkeaotool:dimension/in_nether] fkeao.dim -1
scoreboard players set @s[predicate=fkeaotool:dimension/in_end] fkeao.dim 1

# set default access
execute unless score @s fkeao.access.end matches 0.. run scoreboard players set @s fkeao.access.end 0
execute unless score @s fkeao.access.end matches 1 if score @s fkeao.dim matches 1 run scoreboard players set @s fkeao.access.end 1

## tps
# end to over

execute as @s[scores={fkeao.dim=1}] if score @s fkeao.pos.y < #-40 fktool at @s run function fkeao:systems/go_overworld

# over to end


execute as @s[scores={fkeao.dim=0}] if score @s fkeao.pos.y > #360 fkeao.options at @s run function fkeao:systems/go_end

# custom

