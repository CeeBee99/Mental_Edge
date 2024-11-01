# Action.gd (a new script)
extends Node2D

class_name Action

# Action properties
var description: String
var base_damage: int
var secondary_effect: String  # Example: "burn", "stun", etc.
var action_type: String  # Example: "attack", "psychic", "status"

# Constructor
func _init(description: String, base_damage: int, secondary_effect: String, action_type: String):
	self.description = description
	self.base_damage = base_damage
	self.secondary_effect = secondary_effect
	self.action_type = action_type
