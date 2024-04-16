extends CharacterBody2D

@onready var anims = $AnimationPlayer
@onready var sprite = $Sprite2D
var isShooting = false


func _physics_process(delta):
	move(delta)
	animsCtrl()
	shoot()

func move(delta,speed = 2500 * 2):
	velocity = Input.get_vector("left","right","up","down") * speed * delta
	print(velocity)
	move_and_slide()

func animsCtrl():
	if isShooting: return
	if velocity.length() != 0:
		anims.play("walk")
		if velocity.x != 0:
			sprite.flip_h = velocity.x < 0
	else:
		anims.play("idle")

func shoot():
	if Input.is_action_just_pressed("shoot"):
		anims.play("shoot")
		isShooting = true
		await anims.animation_finished
		isShooting = false





