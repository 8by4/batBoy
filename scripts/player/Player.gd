extends CharacterBody2D
class_name Player

# Nodes
@onready var states = $StateManager
@onready var animator = $Animator
@onready var hurtbox_col = $HurtboxComponent/CollisionShape2D

# States
@onready var idle = $StateManager/Idle
@onready var move = $StateManager/Move
@onready var hurt = $StateManager/Hurt
@onready var attack = $StateManager/Attack
@onready var dodge = $StateManager/Dodge

# Properties
@export var max_health := 5
@export var speed := 4500

@export var friction := 12.0

@export var equipped_weapon : Weapon

var health : int
var move_dir : Vector2
var incoming_attack : Attack
var cursor_dir : float

var input_attack : bool
var input_dodge : bool

func _ready():
	states.init(self)
	
	health = max_health
	
	for child in $Aim.get_children():
		if child is Weapon:
			if child == equipped_weapon:
				child.visible = true
			else:
				child.visible = false

func _physics_process(delta):
	states.physics_update(delta)
	
	input_attack = Input.is_action_just_pressed("attack")
	input_dodge = Input.is_action_just_pressed("dodge")
	
func movement_input():
	move_dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_dir = move_dir.normalized()

func aim():
	$Aim.look_at(get_global_mouse_position())
	if get_global_mouse_position().x - global_position.x < 0:
		$Aim.scale.y = -1
	else:
		$Aim.scale.y = 1
	
	cursor_dir = rad_to_deg(get_angle_to(get_global_mouse_position()))

func knockback():
	velocity = (global_position - incoming_attack.attack_position).normalized() * incoming_attack.knockback_force

func got_hurt(hurt_attack):
	incoming_attack = hurt_attack
	if states.current_state != hurt:
		states.change_state(hurt)
