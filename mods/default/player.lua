-- Minetest 0.4 mod: player
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into doc/lua_api.txt

-- Set mesh for all players
function switch_player_visual()
	prop = {
		mesh = "player.x",
		textures = {"player.png", },
		visual = "mesh",
		visual_size = {x=1, y=1},
		animation_frames = {0, 100},
		animation_speed = 50,
		animation_blend = 0,
		animation_bone_position = {"Bone", {x=0, y=0, z=0}},
		animation_bone_rotation = {"Bone", {x=0, y=0, z=0}},
	}
	for _, obj in pairs(minetest.get_connected_players()) do
		obj:set_properties(prop)
	end
	minetest.after(1.0, switch_player_visual)
end
minetest.after(1.0, switch_player_visual)

-- Definitions made by this mod that other mods can use too
default = {}

-- Load other files
dofile(minetest.get_modpath("default").."/mapgen.lua")
dofile(minetest.get_modpath("default").."/leafdecay.lua")

-- END
