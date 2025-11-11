# scores
scoreboard objectives add fktool dummy

# fkversion
scoreboard players set #FktoolVersion fktool 12109
execute store success score #tmp fktool run function fkeaotool:fkversion
scoreboard players reset #FktoolVersion fktool
execute if score #tmp fktool matches 0 run return run tellraw @a[tag=fkdev] [{"text":"[fktool] exit: error during update","color":"red"}]

# init
function fkeaotool:utils/set_constants
function fkeaotool:utils/tellraw
function fkeaotool:difficulty/get
function fkeaotool:mcv/get
function fkeaotool:rng/get
function fkeaotool:warnings/get

# modules
#function fkeaotool:systime/get
