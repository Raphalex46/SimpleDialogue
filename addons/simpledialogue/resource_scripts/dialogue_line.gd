class_name DialogueLine
extends Resource

## Who's speaking?
@export var speaker: Character
## Actual dialogue line.
@export_multiline var line: String

@export_group("Callback")
## Trigger a callback when this line is finished.
@export var use_callback: bool
## A string to identify this callback. This can be used to check which callback
## you are reacting to if mulitple callbacks are triggered in the same
## `DialogueHolder`
@export var callback_id: String

func _init() -> void:
    if use_callback and callback_id.is_empty():
        push_error("This DialogueLine is set to use a callback but no Callback ID is specified!")
