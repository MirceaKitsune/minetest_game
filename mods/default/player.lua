-- Minetest 0.4 mod: player
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into doc/lua_api.txt

-- Set mesh for all players
function switch_player_visual()
	local modpath = minetest.get_modpath("default")
	prop = {
		mesh=modpath.."/models/player.obj",
		textures = {modpath.."/models/player.png", },
		visual="mesh",
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
