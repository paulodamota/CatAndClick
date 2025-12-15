#mundo.gd

extends Node2D

@export var vasoNode: Node
@export var quadroNode: Node
@export var gatoNode: Node

var eventos = [
	{"acao": func(): vasoNode.derrubar(), "peso": 1},
	{"acao": func(): quadroNode.balancar(), "peso": 2},
	{"acao": func(): gatoNode.coceira(), "peso": 2},
	{"acao": func(): gatoNode.raiva(), "peso": 4},
]


func _ready():
	$eventoTimer.timeout.connect(_on_evento_aleatorio)

func _on_evento_aleatorio():
	var evento_escolhido = escolher_evento_com_peso()
	evento_escolhido.call()

func escolher_evento_com_peso():
	var soma_pesos = 0
	for e in eventos:
		soma_pesos += e.peso
	
	var r = randi() % soma_pesos
	var acumulado = 0
	
	for e in eventos:
		acumulado += e.peso
		if r < acumulado:
			return e.acao


func _on_play_again_button_pressed() -> void:
	get_tree().reload_current_scene()
