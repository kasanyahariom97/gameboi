extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _gui_input(event):
   if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
	   Input.action_press("jump");
	
func _input(event):
	if event is InputEventMouseButton:
		if event.doubleclick:
			Input.action_press("jump");
		else:
			Input.action_release("jump");
		  
