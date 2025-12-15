extends Control

@export var vasoNode: Node
@export var painel_game_over: Control
@export var painel_Vitoria: Control

# Variáveis
@export var tempo_inicial = 6
var tempo_atual = 0

# Referências aos nós (ajuste os nomes se necessário)
@onready var label_texto = $TempoLabel
@onready var timer = $TempoTimer

func _ready():
	tempo_atual = tempo_inicial
	label_texto.text = str(tempo_atual)
	# Conecta o sinal de "timeout" do Timer ao nosso script
	timer.timeout.connect(_on_tempo_timer_timeout)

func _on_tempo_timer_timeout():
	# Reduz 1 segundo
	tempo_atual -= 1
	
	# Atualiza o texto na tela
	label_texto.text = str(tempo_atual)
	
	# Verifica se o tempo acabou
	if tempo_atual <= 0:
		timer.stop()
		if vasoNode.caiu == true:
			painel_game_over.show()
		else:
			painel_Vitoria.show()
			
