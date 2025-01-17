function amethysttravelling:platform/check

execute at @e[tag=fast_travel_point,scores={AT.isIntact=..8}] run particle minecraft:falling_obsidian_tear ~ ~ ~ 0.5 1.5 0.5 0.02 500 force
execute at @e[tag=fast_travel_point,scores={AT.isIntact=..8}] run playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 1 1.3
execute at @e[tag=fast_travel_point,scores={AT.isIntact=..8}] run playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 1 1.5

# message
execute at @e[tag=fast_travel_point,scores={AT.isIntact=-1}] run tellraw @p [{"translate":"§5นี้เป็น §dจุดวาร์ประดับ 1§5 ไม่สามารถเปิดใช้งานที่่นี้ได้!"}]
execute at @e[tag=fast_travel_point,scores={AT.isIntact=0..8}] run tellraw @a [{"translate":"%1$s §5ได้ทำลาย §dจุดวาร์ป§5!","ด้วย":[{"selector":"@p","color":"dark_purple"}]}]

# give advancement
execute at @e[tag=fast_travel_point,scores={AT.isIntact=-1}] as @p[distance=..5] run advancement grant @s only amethysttravelling:build_failed
execute at @e[tag=fast_travel_point,scores={AT.isIntact=0..8}] as @p[distance=..5] run advancement grant @s only amethysttravelling:destroy

# remove
execute as @e[tag=fast_travel_point,scores={AT.isIntact=..8}] at @s run function amethysttravelling:platform/remove

schedule function amethysttravelling:platform/destroy 1s