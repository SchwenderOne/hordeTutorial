extends CharacterBody2D

signal health_depleted

var health = 100.0
@onready var health_bar = get_node("/root/Game/HUD/HealthBar")


func _physics_process(delta):
	const SPEED = 600.0
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	move_and_slide()
	
	if velocity.length() > 0.0:
		%Soldier.play_walk_animation()
	else:
		%Soldier.play_idle_animation()
	
	# Taking damage
	const DAMAGE_RATE = 6.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		health_bar.value = health
		if health <= 0.0:
			health_depleted.emit()
