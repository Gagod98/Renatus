extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var max_speed = 250
@export var acceleration = 600
@export var friction = 3000

func _ready() -> void:
	Global.player = self

func _process(_delta):
	if Input.is_action_pressed("Left"):
		_animated_sprite.play("RunLeft")
	elif Input.is_action_pressed("Right"):
		_animated_sprite.play("RunRight")
	elif Input.is_action_pressed("Down"):
		_animated_sprite.play("RunDown")
	elif Input.is_action_pressed("Up"):
		_animated_sprite.play("RunUp")
	else:
		_animated_sprite.stop()
	if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
		_animated_sprite.play("RunDown")
	if Input.is_action_pressed("Shift"):
		max_speed = 500
	else:
		max_speed = 250
		
func _physics_process(delta):
	z_index = int(global_position.y)
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * max_speed , acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()
	
	

	
	
		
		
		
		
	



	
 
