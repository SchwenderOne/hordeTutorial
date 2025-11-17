extends Node2D

@onready var orc_sprite = $OrcSprite


func _ready():
	orc_sprite.play("idle")


func play_walk():
	orc_sprite.play("walk")


func play_hurt():
	orc_sprite.play("hurt")
