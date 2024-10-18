extends Node2D




var player_move = null
var enemy_move = null
var player_selected = false
var enemy_selected = false

func start_turn():
	player_selected = false
	enemy_selected = false
	player_select_move()
	enemy_select_move()  # Call AI function

func player_select_move():
	# Player UI logic to select move goes here

	pass

func enemy_select_move():
	# AI logic to select move
	enemy_move = enemy_decide_move()
	enemy_selected = true
	check_moves_ready()

func player_move_selected(move):
	player_move = move
	player_selected = true
	check_moves_ready()

func check_moves_ready():
	if player_selected and enemy_selected:
		execute_moves()

func execute_moves():
	# Logic to perform both player and enemy moves simultaneously
	# Example: animations, damage calculations, etc.
	await(get_tree().create_timer(1.0), "timeout"))
	# Handle move logic here, like damage, animation, etc.
	resolve_turn()

func resolve_turn():
	# After both moves are completed, process the results (HP, status, etc.)
	start_turn()  # Start the next turn
