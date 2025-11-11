effect give @s minecraft:slow_falling 1 0 true
effect give @s minecraft:blindness 1 0 true
playsound minecraft:item.elytra.flying ambient @s ~ ~ ~ 0.05 2

# particules
tag @s add fkeao.particules
function fkeao:schedules/particules
schedule function fkeao:systems/particules 3s append
