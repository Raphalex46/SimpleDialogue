class_name DialogueHolder
extends Node

## Play dialogue when the node is ready.
@export var autoplay: bool = false
## List of dialogue lines.
@export var lines: Array[DialogueLine]
## Which dialogue display to send the lines to.
@export var dialogue_display: DialogueDisplay

## Emitted when a dialogue line should trigger a callback.
signal dialogue_callback(String)

func _ready() -> void:
	if not DialogueDisplay:
		push_error("DialogueHolder has no DialogueDisplay specified!")
	dialogue_display.dialogue_finished.connect(_on_dialogue_finished)
	if autoplay:
		play()

# Play this `DialogueHolder`'s lines.
func play() -> void:
	if not lines.is_empty():
		dialogue_display.display(lines.front())

func _on_dialogue_finished() -> void:
	if not lines.is_empty():
		var old_line = lines.pop_front()
		if old_line.use_callback:
			dialogue_callback.emit(old_line.callback_id)
		play()
