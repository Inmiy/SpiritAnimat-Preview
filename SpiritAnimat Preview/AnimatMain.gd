extends Node2D

onready var labletext_h = $"CountButton/HBoxContainer/Label"
onready var labletext_v = $"CountButton/HBoxContainer2/Label"
onready var labletext_speed = $"CountButton/HBoxContainer3/Label"

var count_h = 1
var count_v = 1

var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	get_tree().connect("files_dropped",self,'drop_files')
	labletext_h.text = str(count_h)
	labletext_v.text = str(count_v)
	labletext_speed.text = str(speed)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Button_pressed() -> void:
	count_h += 1
	labletext_h.text = str(count_h)
	pass # Replace with function body.


func _on_Button2_pressed() -> void:
	if count_h > 1:
		count_h -= 1
		labletext_h.text = str(count_h)
	
	pass # Replace with function body.


func _on_Button_pressed_v() -> void:
	count_v += 1
	labletext_v.text = str(count_v)
	pass # Replace with function body.


func _on_Button2_pressed_v() -> void:
	if count_v > 1:
		count_v -= 1
		labletext_v.text = str(count_v)
	pass # Replace with function body.



