### EndAboveOverworld Datapack
###
### Developped by FunkyToc
### With love
### Original concept by franswa


## CONFIG

# Over to End link
# 1: Over-to-End enabled
# 0: Over-to-End disabled
execute unless score OverToEnd fkeao.options matches 0.. run scoreboard players set OverToEnd fkeao.options 1

# Over minimum Y position to TP player into the End
# Default: 360
# Range: 320 - 9999
execute unless score OverLimit fkeao.options matches 0.. run scoreboard players set OverLimit fkeao.options 360

# End TP Y position from Over
# Default: -10
# Range: [EndLimit] - -1
execute unless score EndSpawnYPos fkeao.options matches 0.. run scoreboard players set EndSpawnYPos fkeao.options -10

# Visit End first
# 1: Players needs to visit the End first to use the Over-to-End link
# 0: Players doesn't need to visit the End first to use the Over-to-End link
execute unless score VisitEndFirst fkeao.options matches 0.. run scoreboard players set VisitEndFirst fkeao.options 0

# End to Over link
# 1: End-to-Over enabled
# 0: End-to-Over disabled
execute unless score EndToOver fkeao.options matches 0.. run scoreboard players set EndToOver fkeao.options 1

# End maximum Y position to TP player into the End
# Default: -40
# Range: -9999 - -1
execute unless score EndLimit fkeao.options matches ..0 run scoreboard players set EndLimit fkeao.options -40

# Over TP Y position from End
# Default: 340
# Range: 320 - [OverLimit]
execute unless score OverSpawnYPos fkeao.options matches 0.. run scoreboard players set OverSpawnYPos fkeao.options 340

# Affect entities (LAGGY FEATURE)
# Only End-to-Over, in a 32 blocks range of every players in the End
# 1: items and mobs will be teleported as well
# 0: items and mobs won't be teleported in the overworld (they will be killed)
execute unless score AffectEntities fkeao.options matches 0.. run scoreboard players set AffectEntities fkeao.options 0

# Transition particules
# 1: clouds particules on world transition
# 0: no more particules on world transition
execute unless score ShowParticules fkeao.options matches 0.. run scoreboard players set ShowParticules fkeao.options 1

# Custom worlds (see the "dimensions/" folder to add your own)
# 1: enable custom worlds loading
# 0: disable custom worlds loading
execute unless score CustomWorlds fkeao.options matches 0.. run scoreboard players set CustomWorlds fkeao.options 0
