# Your Custom World
# 
# MANUAL
# - Rename the scoreboard "ThisWorld_TopLimit" to a uniq name representing this world, and set its value to the up Y limit
# - Replace "namespace:worldname_to_go_up" by the world you want to go if you are above ThisWorld_TopLimit
# - Set the destination TP position at the end of the command "~ -1 ~"
#
# - Rename the scoreboard "ThisWorld_BottomLimit" to a uniq name representing this world, and set its value to the up Y limit
# - Replace "namespace:worldname_to_go_down" by the world you want to go if you are below ThisWorld_BottomLimit
# - Set the destination TP position at the end of the command "~ 320 ~"
#
# - Use /reload in game

# Top limit
scoreboard players set ThisWorld_TopLimit fkeao.pos.y 350
# If above the top limit, the player will go in...
execute if score @s fkeao.pos.y > ThisWorld_TopLimit fkeao.pos.y at @s in namespace:worldname_to_go_up run tp @s ~ -1 ~

# Bottom limit
scoreboard players set ThisWorld_BottomLimit fkeao.pos.y -50
# If under the bottom limit, the player will go in...
execute if score @s fkeao.pos.y < ThisWorld_BottomLimit fkeao.pos.y at @s in namespace:worldname_to_go_down run tp @s ~ 320 ~
