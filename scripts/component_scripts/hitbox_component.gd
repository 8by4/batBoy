extends Area2D
class_name HitboxComponent

@export var target_position_child : NodePath
@export var parent_hurtbox : HurtboxComponent

@export var attack_damage : int
@export var knockback_force : float

func _on_area_entered(area):
	print("attacked")
	if area is HurtboxComponent and area != parent_hurtbox:
		
		var hurtbox : HurtboxComponent = area
		
		var attack = Attack.new()
		
		if get_node_or_null(target_position_child) != null:
			attack.attack_position = get_node(target_position_child).get_parent().global_position
		else:
			attack.attack_position = global_position
		
		attack.attack_damage = attack_damage
		attack.knockback_force = knockback_force
		
		hurtbox.damage(attack)
