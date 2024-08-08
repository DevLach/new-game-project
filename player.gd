extends CharacterBody2D
@export var speed = 5
@onready var gun_01: Sprite2D = $PlayerShip1Blue/Gun01
@onready var pivot: Node2D = $"Player Sprite/Pivot"
@export var bullet_scene: PackedScene
@onready var marker_2d: Marker2D = $"Player Sprite/Pivot/Marker2D"
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass






# dot operator = call a function in a variable or get a value thats in the variaable  
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pivot.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = bullet_scene.instantiate()
		new_bullet.global_position = marker_2d.global_position
		new_bullet.global_rotation = marker_2d.global_rotation
		owner.add_child(new_bullet)
		
		

#called 60 times per second.
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right","move_up", "move_down") 
	# velocity = moving in a direction
	velocity = direction.normalized() * speed
	#makes move and collisions
	move_and_slide() 
