#vaso_node.gd

extends Node

var caiu = false

func derrubar():
	caiu = true
	$vasoAnimation.play("derrubar")
	await $vasoAnimation.animation_finished
	$vasoNormal.visible = false
	$vasoCaido.visible = true

func levantar():
	caiu = false
	$vasoAnimation.play("RESET")
	$vasoNormal.visible = true
	$vasoCaido.visible = false

func _on_vaso_caido_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		levantar()
