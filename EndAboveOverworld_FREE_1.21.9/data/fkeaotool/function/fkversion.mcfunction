## check fktool versions 
# only update if this version is the most recent one, dealing with multiple fktool folders

# undefined version
execute unless score #FktoolVersion fktool matches 0.. run tellraw @a[tag=fkdev] [{"text":"[fktool] exit: undefined score #FktoolVersion","color":"red"}]
execute unless score #FktoolVersion fktool matches 0.. run return fail

# incorrect version
execute if score #FktoolVersion fktool matches ..11299 run tellraw @a[tag=fkdev] [{"text":"[fktool] exit: incorrect score #FktoolVersion","color":"red"}]
execute if score #FktoolVersion fktool matches ..11299 run return fail

# newer version already applied
execute if score FktoolVersion fktool > #FktoolVersion fktool run tellraw @a[tag=fkdev] [{"text":"[fktool] exit: a newer Fktool is already applied","color":"red"}]
execute if score FktoolVersion fktool > #FktoolVersion fktool run return fail

# up to date
execute if score FktoolVersion fktool = #FktoolVersion fktool run tellraw @a[tag=fkdev] [{"text":"[fktool] using up-to-date version ","color":"red"},{"score":{"name":"#FktoolVersion","objective":"fktool"},"color":"white"}]

# need update
execute if score FktoolVersion fktool < #FktoolVersion fktool run tellraw @a[tag=fkdev] [{"text":"[fktool] updating with version ","color":"red"},{"score":{"name":"#FktoolVersion","objective":"fktool"},"color":"white"}]

# continue
scoreboard players operation FktoolVersion fktool = #FktoolVersion fktool
return 1
