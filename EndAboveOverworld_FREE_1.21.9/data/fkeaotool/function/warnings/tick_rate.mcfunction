# "tick" function is broken when triggered by a datapack (1.20.5). Check when 1.21.
scoreboard players set TickRate fktool 20
#execute store result score TickRate fktool run tick query

execute unless score TickRate fktool matches 20 run tellraw @a[tag=fkdev] [{"text":"[fktool] Warning: modified tick_rate (","color":"red"},{"score":{"name":"TickRate","objective":"fktool"},"color":"white"},{"text":")","color":"red"}]