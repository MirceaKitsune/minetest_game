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

-- Frame ranges for each animation of each model:
-- player.x:
animation_player_stand_START = 0
animation_player_stand_END = 79
animation_player_walk_forward_START = 81
animation_player_walk_forward_END = 100
animation_player_walk_backward_START = 102
animation_player_walk_backward_END = 121
animation_player_walk_right_START = 123
animation_player_walk_right_END = 142
animation_player_walk_left_START = 144
animation_player_walk_left_END = 163
animation_player_mine_START = 165
animation_player_mine_END = 179
animation_player_death_START = 181
animation_player_death_END = 200

-- Called whenever a player's appearance needs to be updated
function player_update_visuals(player)
	prop = {
		mesh = player_model,
		textures = {player_texture, },
		visual = "mesh",
		visual_size = {x=1, y=1},
	}
	player:set_properties(prop)
	player:set_animation({x=animation_player_death_START, y=animation_player_death_END}, animation_speed, animation_blend)
end

-- Set appearance when the player joins
minetest.register_on_joinplayer(player_update_visuals)

-- END
