-- condensed_cobble/init.lua
-- VERY CONDENSED version of cobblestone
--[[
    Copyright © 2011-2024 Hugo Locurcio and contributors.
    Licensed under the zlib license. See LICENSE.md for more information.
]]

local S = minetest.get_translator("condensed_cobble")

minetest.register_node("condensed_cobble:condensed_cobble", {
    description = S("Condensed Cobblestone"),
    tiles = { "moreblocks_cobble_compressed.png^[colorize:black:255]" },
    is_ground_content = false,
    groups = { cracky = 1, stone = 2 },
    stack_max = 999,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_alias("moreblocks:condensed_cobble", "condensed_cobble:condensed_cobble")

stairsplus:register_all("condensed_cobble", "condensed_cobble", "condensed_cobble:condensed_cobble", {
    description = S("Condensed Cobblestone"),
    groups = { cracky = 1, stone = 2 },
    tiles = { "moreblocks_cobble_compressed.png^[colorize:black:255]" },
    sunlight_propagates = true,
    sounds = default.node_sound_stone_defaults(),
})

local COMPRESSED = "moreblocks:cobble_compressed"

minetest.register_craft({
    output = "moreblocks:stone_tile 324",
    recipe = {
        { COMPRESSED, COMPRESSED },
        { COMPRESSED, COMPRESSED },
    }
})

minetest.register_craft({
    output = COMPRESSED,
    recipe = {
        { COMPRESSED, COMPRESSED, COMPRESSED },
        { COMPRESSED, COMPRESSED, COMPRESSED },
        { COMPRESSED, COMPRESSED, COMPRESSED }
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "moreblocks:cobble_compressed 9",
    recipe = { COMPRESSED }
})

minetest.register_craft({
    type = "cooking",
    cooktime = 45, -- 5*9
    output = "default:stone 81",
    recipe = "moreblocks:cobble_condensed"
})

if minetest.get_modpath("technic") then
    technic.register_grinder_recipe({
        input = { "moreblocks:cobble_condensed" },
        output = "default:cobble 81"
    })
end
