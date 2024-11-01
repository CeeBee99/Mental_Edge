
extends Node2D





var player_move = null
var enemy_move = null
var player_selected = false
var enemy_selected = false
	# List to store all possible actions in the game
var actions_list = []


func start_turn():
	player_selected = false
	enemy_selected = false
	player_select_move()
	enemy_select_move()  # Call AI function


# Function for the player to select a move
func player_select_move():
	# Player UI logic to select a move
	# For example, player_move = actions_list[0] (Basic Attack)
	pass

# Function for the enemy to select a move (AI logic)
func enemy_select_move():
	enemy_move = enemy_decide_move()
	enemy_selected = true
	check_moves_ready()

# When the player selects a move
func player_move_selected(move: Action):
	player_move = move
	player_selected = true
	check_moves_ready()

# Check if both player and enemy have selected their moves
func check_moves_ready():
	if player_selected and enemy_selected:
		execute_moves()

# Execute both moves simultaneously
func execute_moves():
	# Logic for executing both player and enemy moves
	await get_tree().create_timer(1.0).timeout

	# Handle damage calculation or effects here, e.g.:
	# apply_damage(player_move, enemy)
	# apply_damage(enemy_move, player)

	resolve_turn()

# Resolve the turn after moves are executed
func resolve_turn():
	# Process results (update HP, apply status effects, etc.)
	player_selected = false
	enemy_selected = false
	start_turn()

# Example of enemy move logic (AI logic)
func enemy_decide_move() -> Action:
	# Simple AI that randomly picks a move from the actions list
	return actions_list[randi() % actions_list.size()]


func _ready():
	# Initialize the list of actions
	initialize_actions()

func initialize_actions():
	# Populate the actions list with different moves
	var basic_attack = Action.new("Punch", 10, "", "attack")
	var psychic_blast = Action.new("Psychic Blast", 15, "", "psychic")
	var heal = Action.new("Heal", 0, "heal", "status")
	
	actions_list.append(basic_attack)
	actions_list.append(psychic_blast)
	actions_list.append(heal)

	print("Actions available: ", actions_list.size())

