#quadro_node.gd

extends Node

func _on_quadro_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		balancar()

func balancar():
	$quadroAnimation.play("balancar")
