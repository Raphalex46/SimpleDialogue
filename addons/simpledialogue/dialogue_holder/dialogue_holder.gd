extends Node

@export var autoplay: bool = false
@export var lines: Array[DialogueLine]
@export var dialogue_display: DialogueDisplay

func _ready() -> void:
	if not DialogueDisplay:
		push_error("DialogueHolder has no DialogueDisplay specified!")
	if autoplay:
		play()

func play() -> void:
	for l in lines:
		dialogue_display.display(l)
