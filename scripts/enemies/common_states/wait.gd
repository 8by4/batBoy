extends BaseStateEnemy

@export var wait_time = .5

var end : bool

func enter():
	end = false
	await get_tree().create_timer(wait_time).timeout
	end = true

func physics_update(delta):
	super.physics_update(delta)
	
	if entity.velocity != Vector2.ZERO:
		entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
	
	var collision_info = entity.move_and_collide(entity.velocity * delta)
	if collision_info:
		if collision_info.get_collider() is Enemy:
			collision_info.get_collider().velocity = entity.velocity
		
		entity.velocity = entity.velocity.bounce(collision_info.get_normal())
	
	if end == true:
		return entity.idle
