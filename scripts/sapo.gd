extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D

var speed = 100

func _process(_delta):
	if velocity != Vector2.ZERO:
		_animated_sprite.play("jump_up")
	else:
		_animated_sprite.stop()

func _physics_process(delta: float) -> void:
	var Direction: Vector2 = global_position.direction_to(Global.player.global_position)
	velocity = Direction.normalized() * speed
	move_and_slide()
	

	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
		look_at(Global.player.global_position)
		
		
	
