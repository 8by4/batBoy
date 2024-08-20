extends BaseStateEnemy

func physics_update(delta):
	super.physics_update(delta)
	
	if entity.velocity != Vector2.ZERO:
		entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
	
	var collision_info = entity.move_and_collide(entity.velocity * delta)
	if collision_info:
		if collision_info.get_collider() is Enemy:
			collision_info.get_collider().velocity = entity.velocity
		
		entity.velocity = entity.velocity.bounce(collision_info.get_normal())
	
	if entity.player != null:
		return entity.pursue
