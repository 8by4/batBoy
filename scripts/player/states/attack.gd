extends BaseStatePlayer

var end : bool

func enter():
	print("attacking")
	end = false
	
	# Check for an equipped weapon
	if entity.equipped_weapon:
		entity.equipped_weapon.use()
		await get_tree().create_timer(entity.equipped_weapon.attack_length).timeout
		end = true
	else:
		print(self, " has no equipped_weapon.")
		end = true

func physics_update(delta):
	entity.velocity = entity.move_dir * entity.speed * delta
	entity.movement_input()
	entity.move_and_slide()
	
	if end == true:
		return entity.idle
