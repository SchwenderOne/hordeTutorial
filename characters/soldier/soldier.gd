extends Node2D

@onready var soldier_sprite = $SoldierSprite


func _ready():
	soldier_sprite.play("idle")


func play_idle_animation():
	soldier_sprite.play("idle")


func play_walk_animation():
	soldier_sprite.play("walk")
