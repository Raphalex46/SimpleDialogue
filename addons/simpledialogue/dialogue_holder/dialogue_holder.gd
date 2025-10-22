class_name DialogueHolder
extends Node

@export var autoplay: bool = false
@export var lines: Array[DialogueLine]
@export var dialogue_display: DialogueDisplay

signal dialogue_callback(String)

func _ready() -> void:
	if not DialogueDisplay:
		push_error("DialogueHolder has no DialogueDisplay specified!")
	dialogue_display.dialogue_finished.connect(_on_dialogue_finished)
	if autoplay:
		play_next_line()

func play_next_line() -> void:
	if not lines.is_empty():
		dialogue_display.display(lines.front())

func _on_dialogue_finished() -> void:
	if not lines.is_empty():
		var old_line = lines.pop_front()
		if old_line.use_callback:
			dialogue_callback.emit(old_line.callback_id)
		play_next_line()
