extends BaseStateEnemy

var player_direction : Vector2

func physics_update(delta):
	if entity.player != null:
		player_direction = (entity.player.global_position - entity.global_position).normalized()
	
	entity.velocity = player_direction * entity.speed * delta
	
	var collision_info = entity.move_and_collide(entity.velocity * delta)
	if collision_info:
		if collision_info.get_collider() is Enemy:
			collision_info.get_collider().velocity = entity.velocity

		entity.velocity = entity.velocity.bounce(collision_info.get_normal())
	
	if entity.player == null:
		return entity.idle
