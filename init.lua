-- condensed_cobble/init.lua
-- VERY CONDENSED version of cobblestone
--[[
    Copyright © 2011-2024 Hugo Locurcio and contributors.
    Licensed under the zlib license. See LICENSE.md for more information.
]]

local S = minetest.get_translator("condensed_cobble")

minetest.register_node("condensed_cobble:condensed_cobble", {
    description = S("Condensed Cobblestone"),
    _doc_items_longdesc = S("A highly-compressed version of cobblestone containing 81 normal cobblestones."),
    _doc_items_usagehelp =
        S("9 compressed cobblestones can be placed into the crafting grid to form one condensed. " ..
            "One condensed can be crafted back to 9 compressed by placing it into the crafting grid."),
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
local CONDENSED  = "condensed_cobble:condensed_cobble"

minetest.register_craft({
    output = "moreblocks:stone_tile 324",
    recipe = {
        { CONDENSED, CONDENSED },
        { CONDENSED, CONDENSED },
    }
})

minetest.register_craft({
    output = CONDENSED,
    recipe = {
        { COMPRESSED, COMPRESSED, COMPRESSED },
        { COMPRESSED, COMPRESSED, COMPRESSED },
        { COMPRESSED, COMPRESSED, COMPRESSED }
    }
})

minetest.register_craft({
    type = "shapeless",
    output = COMPRESSED .. " 9",
    recipe = { CONDENSED }
})

minetest.register_craft({
    type = "cooking",
    cooktime = 3 * 8,
    output = "default:stone 81",
    recipe = "condensed_cobble:condensed_cobble"
})

if minetest.get_modpath("technic") and technic.register_grinder_recipe then
    technic.register_grinder_recipe({
        input = { "condensed_cobble:condensed_cobble" },
        time = 3 * 8,
        output = "default:gravel 81"
    })
end
