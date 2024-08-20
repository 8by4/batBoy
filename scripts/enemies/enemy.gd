extends CharacterBody2D
class_name Enemy

# Required components
@export var states : StateManager
@export var animator : AnimationPlayer
@export var hitbox_comp : HitboxComponent

# Player reference
@onready var player = null

# Required states
@export var hurt : BaseStateEnemy
@export var dead : BaseStateEnemy

# Properties
@export var max_health := 5
@export var friction := 4.0
@export var speed := 1000.0

var health : int
var incoming_attack : Attack
var player_in_range : bool
var can_get_hurt : bool

func _ready():
	states.init(self)
	
	health = max_health
	player_in_range = false
	can_get_hurt = true
	
	hitbox_comp.set_collision_mask_value(4, false)

func _physics_process(delta):
	states.physics_update(delta)

func knockback():
	velocity = (global_position - incoming_attack.attack_position).normalized() * incoming_attack.knockback_force

func got_hurt(attack):
	incoming_attack = attack
	
	if can_get_hurt:
		states.change_state(hurt)

func _on_player_detection_body_entered(body):
	if body is Player:
		player = body

func _on_player_detection_body_exited(body):
	if body is Player:
		player = null
