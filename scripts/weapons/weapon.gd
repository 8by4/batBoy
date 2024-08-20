extends Node2D
class_name Weapon

var attack_length

func _ready():
	$HitboxComponent/CollisionShape2D.disabled = true
	
	attack_length = $Animator.get_animation("Attack").length

func use():
	$Animator.play("Attack")
	
	
