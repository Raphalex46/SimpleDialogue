class_name DialogueDisplay
extends RichTextLabel


func display(line: DialogueLine) -> void:
	text = line.speaker.name + "\n" + line.line

func _enter_tree() -> void:
	_reset()

func _reset() -> void:
	text = ""

