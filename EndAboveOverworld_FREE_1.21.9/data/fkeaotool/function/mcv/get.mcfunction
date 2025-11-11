# get
execute store result score DataVersion fktool run data get entity @p DataVersion

# default McVersion
scoreboard players set #McVersionDefault fktool 12109

# previous McVersion
execute if score McVersion fktool matches 1.. run scoreboard players operation #McVersionPrevious fktool = McVersion fktool

# set McVersion
scoreboard players set McVersion fktool 0
execute if score DataVersion fktool matches 4554.. run scoreboard players set McVersion fktool 12109
execute if score DataVersion fktool matches 4440..4553 run scoreboard players set McVersion fktool 12108
execute if score DataVersion fktool matches 4438..4439 run scoreboard players set McVersion fktool 12107
execute if score DataVersion fktool matches 4435..4437 run scoreboard players set McVersion fktool 12106
execute if score DataVersion fktool matches 4325..4434 run scoreboard players set McVersion fktool 12105
execute if score DataVersion fktool matches 4189..4324 run scoreboard players set McVersion fktool 12104
execute if score DataVersion fktool matches 4080..4188 run scoreboard players set McVersion fktool 12102
execute if score DataVersion fktool matches 3953..4079 run scoreboard players set McVersion fktool 12100
execute if score DataVersion fktool matches 3839..3952 run scoreboard players set McVersion fktool 12006
execute if score DataVersion fktool matches 3837..3838 run scoreboard players set McVersion fktool 12005
execute if score DataVersion fktool matches 3700..3836 run scoreboard players set McVersion fktool 12004
execute if score DataVersion fktool matches 3579..3699 run scoreboard players set McVersion fktool 12003
execute if score DataVersion fktool matches 3567..3578 run scoreboard players set McVersion fktool 12002
execute if score DataVersion fktool matches 3442..3465 run scoreboard players set McVersion fktool 12000
execute if score DataVersion fktool matches 3320..3337 run scoreboard players set McVersion fktool 11904
execute if score DataVersion fktool matches 3205..3218 run scoreboard players set McVersion fktool 11903
execute if score DataVersion fktool matches 3066..3120 run scoreboard players set McVersion fktool 11900
execute if score DataVersion fktool matches 2966..2975 run scoreboard players set McVersion fktool 11802
execute if score DataVersion fktool matches 2825..2865 run scoreboard players set McVersion fktool 11800
execute if score DataVersion fktool matches 2701..2730 run scoreboard players set McVersion fktool 11700
execute if score DataVersion fktool matches 2569..2586 run scoreboard players set McVersion fktool 11602
execute if score DataVersion fktool matches 2320..2567 run scoreboard players set McVersion fktool 11600
execute if score DataVersion fktool matches 2067..2230 run scoreboard players set McVersion fktool 11500
execute if score DataVersion fktool matches 1901..1976 run scoreboard players set McVersion fktool 11400
execute if score DataVersion fktool matches 1444..1631 run scoreboard players set McVersion fktool 11300
execute if score DataVersion fktool matches 1..1343 run scoreboard players set McVersion fktool 11200

# error
execute unless score DataVersion fktool matches 1.. run scoreboard players set DataVersion fktool -1

# define with default value
execute if score DataVersion fktool matches -1 unless score #McVersionPrevious fktool matches 1.. run scoreboard players operation McVersion fktool = #McVersionDefault fktool
execute if score DataVersion fktool matches -1 unless score #McVersionPrevious fktool matches 1.. run tellraw @a[tag=fkdev] [{"text":"[fktool] Default McVersion applied: ","color":"red"},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"}]

# keep the previous value
execute if score DataVersion fktool matches -1 if score #McVersionPrevious fktool matches 1.. run scoreboard players operation McVersion fktool = #McVersionPrevious fktool
execute if score DataVersion fktool matches -1 if score #McVersionPrevious fktool matches 1.. run tellraw @a[tag=fkdev] [{"text":"[fktool] Previous McVersion applied: ","color":"red"},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"}]

# warnings
execute if score DataVersion fktool matches -1 unless entity @p run tellraw @a[tag=fkdev] [{"text":"[fktool] WARNING: a connected player is required to update the Minecraft version. Default setting applied: ","color":"red"},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"},{"text":". Use /reload with a player ingame to update it.","color":"red"}]
execute if score DataVersion fktool matches -1 if entity @p run tellraw @a[tag=fkdev] [{"text":"[fktool] ERROR: DataVersion not recognized. Do you use intensive plugins, mods or optimized server type? Default setting applied: ","color":"red"},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"},{"text":".","color":"red"}]
