extends Node2D  # Can be used for both player and enemies

var grid_bounds = Rect2(Vector2(0, 0), Vector2(462, 101))
var tile_size = Vector2(261.8, 126.25) 


func move_entity(direction: Vector2):
	# Calculate the new position
	var new_position = position + direction * tile_size
	
	# Check if the new position is within bounds
	if is_within_bounds(new_position):
		# Move the entity by snapping to the new grid position
		position = new_position.snapped(Vector2.ONE * tile_size)

func is_within_bounds(new_pos: Vector2) -> bool:
	return new_pos.x >= grid_bounds.position.x and new_pos.x <= (grid_bounds.position.x + grid_bounds.size.x - tile_size) \
		and new_pos.y >= grid_bounds.position.y and new_pos.y <= (grid_bounds.position.y + grid_bounds.size.y - tile_size)
