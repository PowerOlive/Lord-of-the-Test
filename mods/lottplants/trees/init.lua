-- trunks, and related things

--[[
Young trunk nbs:
1:
	{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}, -- NodeBox1
	{-0.0625, -0.5, -0.1875, 0.0625, 0.5, -0.125}, -- NodeBox2
	{0.125, -0.5, -0.0625, 0.1875, 0.5, 0.0625}, -- NodeBox3
	{-0.0625, -0.5, 0.125, 0.0625, 0.5, 0.1875}, -- NodeBox4
	{-0.1875, -0.5, -0.0625, -0.125, 0.5, 0.0625}, -- NodeBox5
2:
	{-0.125, -0.5, -0.1875, 0.125, 0.5, 0.1875},
	{-0.1875, -0.5, -0.125, 0.1875, 0.5, 0.125},
]]--


-- Oak
minetest.register_node("lottplants:oak_trunk", {
	description = "Oak Trunk",
	tiles = {"lottplants_oak_trunk_top.png", "lottplants_oak_trunk_top.png", "lottplants_oak_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:oak_planks", {
	description = "Oak Planks",
	tiles = {"lottplants_oak_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:oak_leaves", {
	description = "Oak Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_oak_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Apple

minetest.register_node("lottplants:apple_trunk", {
	description = "Apple Trunk",
	tiles = {"lottplants_apple_trunk_top.png", "lottplants_apple_trunk_top.png", "lottplants_apple_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:apple_planks", {
	description = "Apple Planks",
	tiles = {"lottplants_apple_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:apple_leaves", {
	description = "Apple Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_apple_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Beech

minetest.register_node("lottplants:beech_trunk", {
	description = "Beech Trunk",
	tiles = {"lottplants_beech_trunk_top.png", "lottplants_beech_trunk_top.png", "lottplants_beech_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:beech_planks", {
	description = "Beech Planks",
	tiles = {"lottplants_beech_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:beech_leaves", {
	description = "Beech Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_beech_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})
-- Birch

minetest.register_node("lottplants:birch_trunk", {
	description = "Birch Trunk",
	tiles = {"lottplants_birch_trunk_top.png", "lottplants_birch_trunk_top.png", "lottplants_birch_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:birch_planks", {
	description = "Birch Planks",
	tiles = {"lottplants_birch_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:birch_leaves", {
	description = "Birch Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_birch_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Elm

minetest.register_node("lottplants:elm_trunk", {
	description = "Elm Trunk",
	tiles = {"lottplants_elm_trunk_top.png", "lottplants_elm_trunk_top.png", "lottplants_elm_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:elm_planks", {
	description = "Elm Planks",
	tiles = {"lottplants_elm_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:elm_leaves", {
	description = "Elm Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_elm_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Holly

minetest.register_node("lottplants:holly_trunk", {
	description = "Holly Trunk",
	tiles = {"lottplants_holly_trunk_top.png", "lottplants_holly_trunk_top.png", "lottplants_holly_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:holly_planks", {
	description = "Holly Planks",
	tiles = {"lottplants_holly_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:holly_leaves", {
	description = "Holly Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_holly_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Mallorn

minetest.register_node("lottplants:mallorn_trunk", {
	description = "Mallorn Trunk",
	tiles = {"lottplants_mallorn_trunk_top.png", "lottplants_mallorn_trunk_top.png", "lottplants_mallorn_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 4}
})

minetest.register_node("lottplants:young_mallorn_trunk", {
	description = "Young Mallorn Trunk",
	drawtype = "nodebox",
	tiles = {"lottplants_mallorn_trunk_top.png", "lottplants_mallorn_trunk_top.png", "lottplants_mallorn_trunk.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}, -- NodeBox1
			{-0.0625, -0.5, -0.1875, 0.0625, 0.5, -0.125}, -- NodeBox2
			{0.125, -0.5, -0.0625, 0.1875, 0.5, 0.0625}, -- NodeBox3
			{-0.0625, -0.5, 0.125, 0.0625, 0.5, 0.1875}, -- NodeBox4
			{-0.1875, -0.5, -0.0625, -0.125, 0.5, 0.0625}, -- NodeBox5
		},
	},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 4}
})

minetest.register_node("lottplants:mallorn_planks", {
	description = "Mallorn Planks",
	tiles = {"lottplants_mallorn_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:mallorn_leaves", {
	description = "Mallorn Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_mallorn_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Pine

minetest.register_node("lottplants:pine_trunk", {
	description = "Pine Trunk",
	tiles = {"lottplants_pine_trunk_top.png", "lottplants_pine_trunk_top.png", "lottplants_pine_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:pine_planks", {
	description = "Pine Planks",
	tiles = {"lottplants_pine_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:pine_needles", {
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_pine_needles.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})

-- Rowan

minetest.register_node("lottplants:rowan_trunk", {
	description = "Rowan Trunk",
	tiles = {"lottplants_rowan_trunk_top.png", "lottplants_rowan_trunk_top.png", "lottplants_rowan_trunk.png"},
	paramtype2 = "facedir",
	groups = {tree = 1, wood = 1, plant = 1, axe = 1},
})

minetest.register_node("lottplants:rowan_planks", {
	description = "Rowan Planks",
	tiles = {"lottplants_rowan_planks.png"},
	paramtype2 = "facedir",
	groups = {wood = 1, axe = 1},
})

minetest.register_node("lottplants:rowan_leaves", {
	description = "Rowan Leaves",
	drawtype = "allfaces_optional",
	tiles = {"lottplants_rowan_leaves.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {leaves = 1, plant = 1},
})