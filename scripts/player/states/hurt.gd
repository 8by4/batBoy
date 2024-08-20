extends BaseStatePlayer

var current_attack : Attack
var done : bool

func enter():
	super.enter()
	
	entity.health -= entity.incoming_attack.attack_damage
	entity.knockback()

func physics_update(delta):
	entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
	
	entity.move_and_slide()
	
	if abs(entity.velocity.length()) < 12:
		return entity.idle
