extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponenet

func damage(attack : Attack):
	if health_component:
		health_component.damage(attack)
	
	for child in get_parent().get_children():
		if child is StateManager:
			if get_parent().has_method("got_hurt"):
				get_parent().got_hurt(attack)
			else:
				print(get_parent().name, " has no method 'got_hurt'.")
