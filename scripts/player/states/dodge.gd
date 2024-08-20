extends BaseStatePlayer

@export var dodge_speed := 120
@export var dodge_length := 0.15 # in seconds

var end : bool

func enter():
	super.enter()
	end = false
	await get_tree().create_timer(dodge_length).timeout
	end = true
	
#	entity.velocity = entity.move_dir * dodge_speed

func physics_update(delta):
	# Different implementation based on friction
#	entity.velocity = lerp(entity.velocity, Vector2.ZERO, entity.friction * delta)
#	if abs(entity.velocity.length()) < 6:
#		return entity.idle
	
	entity.velocity = entity.move_dir * dodge_speed
	entity.move_and_slide()
	
	if end == true:
		return entity.idle
