class_name DialogueLine
extends Resource

@export var speaker: Character
@export_multiline var line: String

@export_group("Callback")
@export var use_callback: bool
@export var callback_id: String

func _init() -> void:
    if use_callback and callback_id.is_empty():
        push_error("This DialogueLine is set to use a callback but no Callback ID is specified!")
