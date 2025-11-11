## DONT RENAME STORAGE NAMESPACE HERE
# use: tellraw @a {"storage":"fkeaotool:info","nbt":"link.pmc","interpret":true}
data modify storage fkeaotool:info author.name set value {"text":"FunkyToc","color":"#8269ff"}
data modify storage fkeaotool:info debug.fktoolversion set value [{"text":"Loaded with McVersion -> ","color":"red"},{"score":{"name":"McVersion","objective":"fktool"},"color":"gray"}]

# links
data modify storage fkeaotool:info link.pmc set value {"text":"PMC","color":"#3366cc","click_event":{"action":"open_url","url":"https://www.planetminecraft.com/member/funkytoc/submissions/"},"hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"link.clickhover","interpret":true}]}}
data modify storage fkeaotool:info link.modrinth set value {"text":"Modrinth","color":"#1bd96a","click_event":{"action":"open_url","url":"https://modrinth.com/user/FunkyToc"},"hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"link.clickhover","interpret":true}]}}
data modify storage fkeaotool:info link.discord set value {"text":"Discord","color":"#1bd96a","click_event":{"action":"open_url","url":"https://discord.gg/eGMrfSQ"},"hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"link.clickhover","interpret":true}]}}
data modify storage fkeaotool:info link.patreon set value {"text":"Patreon","bold":true,"color":"#E47373","click_event":{"action":"open_url","url":"https://www.patreon.com/funkytoc"},"hover_event":{"action":"show_text","value":[{"storage":"fkeaotool:info","nbt":"link.clickhover","interpret":true}]}}

# compose
data modify storage fkeaotool:info link.clickhover set value {"text":"click to get the link"}
data modify storage fkeaotool:info load.enabled set value {"text":"Enabled. "}
data modify storage fkeaotool:info load.options set value {"text":"Modify Options: "}
data modify storage fkeaotool:info load.mcvko set value {"text":"Outdated game version detected."}
data modify storage fkeaotool:info load.update set value {"text":"Please, play with a more recent MC version or download an older version of this datapack."}
data modify storage fkeaotool:info load.devby set value [{"text":"Developed with love by "},{"storage":"fkeaotool:info","nbt":"author.name","interpret":true,"bold":true}]
data modify storage fkeaotool:info load.networks set value [{"text":"See all projects on "},{"storage":"fkeaotool:info","nbt":"link.pmc","interpret":true},{"text":" or "},{"storage":"fkeaotool:info","nbt":"link.modrinth","interpret":true},{"text":"!"}]
data modify storage fkeaotool:info load.free set value [{"text":"You're playing the FREE version. Please, consider supporting me by becoming a "},{"storage":"fkeaotool:info","nbt":"link.patreon","interpret":true},{"text":". I need your support, comments and shares to maintain those projects updated."}]
