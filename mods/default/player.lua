-- Minetest 0.4 mod: player
-- See README.txt for licensing and other information.

-- Default player appearance.
player_model = "character.x"
player_texture = "character.png"

-- Animation speed
animation_speed = 30

-- Animation blending / transitioning amount
-- Note: This is currently broken due to a bug in Irrlicht, leave at 0
animation_blend = 0

-- Frame ranges for each player model
function player_get_animations(model)
	if(model == "character.x") then
		return {
		stand_START = 0,
		stand_END = 79,
		walk_forward_START = 81,
		walk_forward_END = 100,
		walk_backward_START = 102,
		walk_backward_END = 121,
		walk_right_START = 123,
		walk_right_END = 142,
		walk_left_START = 144,
		walk_left_END = 163,
		mine_START = 165,
		mine_END = 179,
		death_START = 181,
		death_END = 200
		}
	end
end

-- Called whenever a player's appearance needs to be updated
function player_update_visuals(player)
	prop = {
		mesh = player_model,
		textures = {player_texture, },
		visual = "mesh",
		visual_size = {x=1, y=1},
	}
	player:set_properties(prop)

	local anim = player_get_animations(player_model)
	player:set_animation({x=anim.stand_START, y=anim.stand_END}, animation_speed, animation_blend)
end

-- Update appearance when the player joins
minetest.register_on_joinplayer(player_update_visuals)

-- END
