extends AnimatedSprite

onready var  cb = $".."
onready var panel_texture = $"../HBoxContainer/Panel2/TextureRect"

var tex 
var path_s = ''

var frm = SpriteFrames.new()
var img_frames = []

var sizex
var sizey

var rect_x = 0
var rect_y = 0
var rect_w = 0
var rect_h = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	print('图像大小：%s' % [tex.get_size()])
#	panel_texture.texture = tex
	get_tree().connect("files_dropped",self,'drop_files')
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func pre_set():
	tex = load_ex_img(path_s)
	sizex = tex.get_size().x
	sizey = tex.get_size().y
	rect_w = sizex
	rect_h = sizey
	pass

func load_ex_img(path_file):
	if path_file:
		var f_handle = File.new()
		f_handle.open(path_file,File.READ)
		var buffer = f_handle.get_buffer(f_handle.get_len())
		f_handle.close()
		
		var img_handle = Image.new()
		if img_handle.load_png_from_buffer(buffer) != 0:
			print('图片加载错误')
		var texture_png = ImageTexture.new()
		texture_png.create_from_image(img_handle)
		return texture_png
	pass

func start_play():
	remake()
	for x in img_frames:
		make_animate(x)
	play('default')
	pass
	
func remake():
	var num = cb.count_h * cb.count_v
	var count_num = 0
	
	img_frames.clear()
	rect_x = 0
	rect_y = 0
	
	rect_w = sizex / cb.count_h
	rect_h = sizey / cb.count_v

	for v in range(cb.count_v):
		for h in range(cb.count_h):
			var rec = Rect2 (rect_x, rect_y, rect_w, rect_h)
			img_frames.append(rec)
			rect_x += rect_w
		rect_y += rect_h
	pass


func make_animate(im):
	var at = AtlasTexture.new()
	at.atlas = tex
	at.region =  im
	frm.add_frame('default',at)
	self.frames = frm
	pass


func _on_ButtonPlay_pressed() -> void:
	start_play()
	panel_texture.visible = false
	pass # Replace with function body.


func _on_ButtonStop_pressed() -> void:
	frm.clear('default')
	panel_texture.visible = true
	pass # Replace with function body.

func _on_Button_speed_pressed() -> void:
	print('加速')
	cb.speed += 0.1
	cb.labletext_speed.text = str(cb.speed)
	speed_scale = cb.speed
	pass # Replace with function body.


func _on_Button2_speed_pressed() -> void:
	print('减速')
	if cb.speed > 0.2:
		cb.speed -= 0.1
		cb.labletext_speed.text = str(cb.speed)
		speed_scale = cb.speed
	pass # Replace with function body.

func drop_files(files,screen):
	frm.clear('default')
	panel_texture.visible = true
	
	path_s = files[0]
	pre_set()
	panel_texture.texture = tex
#	print(path_s)
	pass


