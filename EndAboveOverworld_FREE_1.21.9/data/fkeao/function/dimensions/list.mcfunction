#  List your worlds here, duplicating existing lines and modify them to your needs
#
# You can add your own worlds here, duplicating a line below
# 1. change "namespace:thisworldname" by the registered dimension name
# 2. change "mycustomworld1" to the name of the file wich manage this world (see files in this directory)

execute as @a[nbt={Dimension:"namespace:thisworldname"}] run function fkeao:dimensions/mycustomworld1
