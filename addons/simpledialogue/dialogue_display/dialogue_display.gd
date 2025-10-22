class_name DialogueDisplay
extends RichTextLabel

signal dialogue_finished

func display(line: DialogueLine) -> void:
	text = line.speaker.name + "\n" + line.line

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_handle_dialogue_finished()

func _enter_tree() -> void:
	_reset()

func _reset() -> void:
	text = ""

func _handle_dialogue_finished():
	text = ""
	dialogue_finished.emit()
