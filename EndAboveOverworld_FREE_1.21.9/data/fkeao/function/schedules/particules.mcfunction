execute at @a[tag=fkeao.particules] run particle minecraft:cloud ~ ~0.1 ~ 0 0 0 0.001 1

execute if entity @p[tag=fkeao.particules] run schedule function fkeao:schedules/particules 1t
