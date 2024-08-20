class_name HealthComponenet
extends Node2D

@export var max_health : int
var health : int

func _ready():
	health = max_health

func damage(attack : Attack):
	health -= attack.attack_damage
#	print(get_parent().name, "'s health: ", health)
	
	if health <= 0:
		get_parent().call_deferred("free")
	
	if get_parent().has_method("knockback"):
		get_parent().knockback(attack)
