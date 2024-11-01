extends CharacterBody2D

# Player/Enemy Attributes
var total_health : int
var current_health : int
var attack : int
var defense : int
var psychic_attack : int
var psychic_defense : int
var speed : int

# List of usable actions (e.g., attacks, spells, items)
var useable_actions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize some sample attributes
	initialize_attributes()

	# Display stats to debug console
	print_stats()

func initialize_attributes():
	# Example stats for a player or enemy
	total_health = 100
	current_health = 100
	attack = 20
	defense = 10
	psychic_attack = 15
	psychic_defense = 12
	speed = 5
	
	# Define a list of actions (could be spells, attacks, items, etc.)
	useable_actions = ["Punch", "Psychic Blast", "Defend", "Heal"]

func print_stats():
	# Print out the current attributes (for debugging purposes)
	print("Total Health: ", total_health)
	print("Current Health: ", current_health)
	print("Attack: ", attack)
	print("Defense: ", defense)
	print("Psychic Attack: ", psychic_attack)
	print("Psychic Defense: ", psychic_defense)
	print("Speed: ", speed)
	print("Usable Actions: ", useable_actions)

# You can now define methods for combat, damage calculation, etc.
func take_damage(amount: int):
	# Reduce current health based on the damage taken
	current_health -= amount
	current_health = clamp(current_health, 0, total_health)  # Ensure health doesn't go below 0 or above max health
	print("Current Health after damage: ", current_health)

func perform_action(action: String):
	# Example method for performing an action
	if action in useable_actions:
		print("Performing action: ", action)
		# Implement combat logic or abilities here
	else:
		print("Invalid action selected")

