# set / reset
execute unless entity @n[type=minecraft:marker,tag=fktool.systime] run schedule function fkeaotool:systime/install 1t
execute at @n[type=minecraft:marker,tag=fktool.systime] unless block ~ ~ ~ repeating_command_block run schedule function fkeaotool:systime/install 1t

# get
execute if score McVersion fktool matches 12003.. as @n[type=minecraft:marker,tag=fktool.systime] at @s run function fkeaotool:systime/read_1.20
execute if score McVersion fktool matches 11904..12002 as @n[type=minecraft:marker,tag=fktool.systime] at @s run function fkeaotool:systime/read_1.19
