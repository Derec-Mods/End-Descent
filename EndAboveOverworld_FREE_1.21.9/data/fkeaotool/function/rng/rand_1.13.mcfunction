summon minecraft:area_effect_cloud ~ 1 ~ {Tags:["fktool.rng"]}
execute store result score Random fktool run data get entity @n[type=minecraft:area_effect_cloud,tag=fktool.rng] UUIDMost 0.00000000023283064
scoreboard players operation Random fktool %= #101 fktool
kill @e[type=minecraft:area_effect_cloud,tag=fktool.rng]