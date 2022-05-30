extends Control


onready var bt_add = $HBoxContainer/VBoxContainer/Button
onready var bt_sub = $HBoxContainer/VBoxContainer/Button2

onready var labletext = $HBoxContainer/Label

var count = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labletext.text = str(count)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_pressed() -> void:
	count += 1
	labletext.text = str(count)
	pass # Replace with function body.


func _on_Button2_pressed() -> void:
	if count > 1:
		count -= 1
		labletext.text = str(count)
	
	pass # Replace with function body.
