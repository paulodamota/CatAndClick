#caixa_node.gd

extends Node

@export var vasoNode: Node

func _on_caixa_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		$caixaAberta.visible = true
		if vasoNode.caiu == false:
			vasoNode.derrubar()

func _on_caixa_aberta_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		$caixaAberta.visible = false
		$caixaNormal.visible = true
