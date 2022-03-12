extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# stats

var score : int = 0;

# Physics

var speed : int = 200;

var jumpForce : int = 600;

var gravity : int = 800;

var vel : Vector2 = Vector2();

var grounded : bool = false;

onready var sprite = $Sprite

func _process(delta):
	if Input.is_action_pressed("move_right") and is_on_floor():
		sprite.play("run");
	elif Input.is_action_pressed("move_left") and is_on_floor():
		sprite.flip_h = true;
		sprite.play("run");
	elif not is_on_floor():
		sprite.stop();
		sprite.play("jump");
	elif sprite.is_playing():
		sprite.stop()				
		sprite.play("idle");

func _physics_process(delta):
	vel.x = 0;
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed;
	if Input.is_action_pressed("move_right"):
		vel.x += speed;
	vel = move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce;
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
	


func die():
	get_tree().change_scene("res://GameOver.tscn")
	

onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

func collect_coin(value):
	score += value
	ui.set_score_text(score)

	
	