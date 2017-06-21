--###################
--################### SILVERFISH
--###################

mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
	passive = false,
	group_attack = true,
	reach = 1,
	hp_min = 8,
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.44, 0.4},
	rotate = -180,
	visual = "mesh",
	mesh = "silverfish.b3d",
	textures = {
		{"silverfish.png"},
	},
	pathfinding = 1,
	visual_size = {x=3, y=3},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	replace_what = {
		{"default:stone", "mobs_mc:monster_egg_stone", -1},
		{"default:cobble", "mobs_mc:monster_egg_cobble", -1},
		{"default:mossycobble", "mobs_mc:monster_egg_mossycobble", -1},
		{"default:stonebrick", "mobs_mc:monster_egg_stonebrick", -1},
		{"default:stone_block", "mobs_mc:monster_egg_stone_block", -1},
	},
	replace_rate = 2,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	view_range = 16,
	attack_type = "dogfight",
	damage = 1,
})

mobs:register_egg("mobs_mc:silverfish", "Silverfish", "silverfish_inv.png", 0)

-- Monster egg blocks (Minetest Game)
if minetest.get_modpath("default") then
	local spawn_silverfish = function(pos, oldnode, oldmetadata, digger)
		if not minetest.setting_getbool("creative_mode") then
			minetest.add_entity(pos, "mobs_mc:silverfish")
		end
	end
	minetest.register_node("mobs_mc:monster_egg_stone", {
		description = "Stone Monster Egg",
		tiles = {"default_stone.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_node("mobs_mc:monster_egg_cobble", {
		description = "Cobblestone Monster Egg",
		tiles = {"default_cobble.png"},
		is_ground_content = false,
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_node("mobs_mc:monster_egg_mossycobble", {
		description = "Mossy Cobblestone Monster Egg",
		tiles = {"default_mossycobble.png"},
		is_ground_content = false,
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_node("mobs_mc:monster_egg_stonebrick", {
		description = "Stone Brick Monster Egg",
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"default_stone_brick.png"},
		is_ground_content = false,
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_node("mobs_mc:monster_egg_stone_block", {
		description = "Stone Block Monster Egg",
		tiles = {"default_stone_block.png"},
		is_ground_content = false,
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	-- Randomly spawn stone monster eggs in the world
	local mg_name = minetest.get_mapgen_setting("mg_name")
	local scarcity
	if mg_name == "v6" then
		scarcity = 28 * 28 * 28
	else
		scarcity = 22 * 22 * 22
	end
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_stone",
		wherein        = "default:stone",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
		biomes         = { "grassland" },
	})

end