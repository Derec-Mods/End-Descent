scoreboard players set OverToEnd fkeao.options 1
scoreboard players set OverLimit fkeao.options 360
scoreboard players set EndSpawnYPos fkeao.options -10
scoreboard players set VisitEndFirst fkeao.options 0
scoreboard players set EndToOver fkeao.options 1
scoreboard players set EndLimit fkeao.options -40
scoreboard players set OverSpawnYPos fkeao.options 340
scoreboard players set AffectEntities fkeao.options 0
scoreboard players set ShowParticules fkeao.options 1
scoreboard players set CustomWorlds fkeao.options 0

tellraw @s ["",{"storage":"fkeao:text","nbt":"project.print","interpret":true},{"text":"Options have been reset","color":"red"}]
