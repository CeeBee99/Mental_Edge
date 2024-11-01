extends Area2D

# Define grid bounds: a grid of 462x101 starting at position (0, 0)
var grid_bounds = Rect2(Vector2(0, 0), Vector2(462, 101))

# Tile size for movement snapping
var tile_size = 32

# Movement directions mapped to Vector2 values
var inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

# RayCast2D (optional) for checking collisions or other logic
@onready var ray = $RayCast2d

func _ready():
	# Snap the player's starting position to the grid
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2
	
# Handle input for player movement
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

# Function to move the player and ensure they stay within bounds
func move(dir):
	# Calculate the potential new position
	var new_position = position + inputs[dir] * tile_size
	
	# Check if the new position is within the grid bounds
	if is_within_bounds(new_position):
		# If within bounds, move the player
		position = new_position

# Function to check if the new position is within grid bounds
func is_within_bounds(new_pos: Vector2) -> bool:
	return new_pos.x >= grid_bounds.position.x and new_pos.x <= (grid_bounds.position.x + grid_bounds.size.x - tile_size) \
		and new_pos.y >= grid_bounds.position.y and new_pos.y <= (grid_bounds.position.y + grid_bounds.size.y - tile_size)

	
