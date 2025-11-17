extends Node2D

const TOGGLE_KEY = KEY_M

@onready var pause_menu = $PauseMenu
@onready var status_label = $PauseMenu/Panel/ContentVBox/StatusLabel
@onready var resume_button = $PauseMenu/Panel/ContentVBox/ButtonRow/ResumeButton
@onready var settings_button = $PauseMenu/Panel/ContentVBox/ButtonRow/SettingsButton
@onready var exit_button = $PauseMenu/Panel/ContentVBox/ButtonRow/ExitButton

var menu_visible = false


func _ready():
	pause_menu.visible = false
	resume_button.pressed.connect(_on_resume_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	_update_pause_status()


func _input(event):
	if event is InputEventKey and event.pressed and not event.is_echo() and event.keycode == TOGGLE_KEY:
		_toggle_pause_menu()


func _toggle_pause_menu():
	menu_visible = not menu_visible
	pause_menu.visible = menu_visible
	get_tree().paused = menu_visible
	if menu_visible:
		_update_pause_status()


func _update_pause_status():
	status_label.bbcode_text = "[center][b]SYSTEM STATUS[/b]\n[color=ffffff]Enemies active:[/color] %d\n[color=ffffff]Next wave in:[/color] %.1f s\n[color=ffffff]Performance:[/color] %.1f fps[/center]" % [get_child_count(), 0.3, Engine.get_frames_per_second()]


func _on_resume_pressed():
	if menu_visible:
		_toggle_pause_menu()


func _on_settings_pressed():
	status_label.bbcode_text = "[center][b]SETTINGS PREVIEW[/b]\n[font=bold]Audio[/font]: Dynamic mix\n[font=bold]Graphics[/font]: Chromatic bloom + LUT\n[font=bold]Controls[/font]: WASD + Aim\n\nUse this space to highlight upcoming features.[/center]"


func _on_exit_pressed():
	status_label.bbcode_text = "[center][b]EXIT PLACEHOLDER[/b]\n\nThis would normally quit to main menu or exit the game.\n\nFor now, it just updates this status text.[/center]"


func spawn_mob():
	%PathFollow2D.progress_ratio = randf()
	var new_mob = preload("res://mob.tscn").instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.show()
	get_tree().paused = true
