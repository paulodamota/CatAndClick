#gato_node.gd

extends Node2D

enum Estado { IDLE, COCEIRA, RAIVA}
var estado_atual : Estado = Estado.IDLE

@onready var gatoAnimation = $gatoAnimation
@export var vasoNode: Node


func _ready():
	idle()

func idle():
	gatoAnimation.play("idle")
	estado_atual = Estado.IDLE

func coceira():
	if estado_atual == Estado.IDLE:
		estado_atual = Estado.COCEIRA
		gatoAnimation.play("coceira")
		
	
func atacar():
	gatoAnimation.play("atacar")
	await gatoAnimation.animation_finished
	$animationTimer.start(0.2)
	await $animationTimer.is_stopped()
	vasoNode.derrubar()


func raiva():
	if estado_atual == Estado.IDLE:
		estado_atual = Estado.RAIVA
		gatoAnimation.play("raiva")
		await gatoAnimation.animation_finished
		if vasoNode.caiu == false:
			atacar()
			await gatoAnimation.animation_finished
			idle()
		else:
			idle()
		



func _on_gato_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		idle()
			
