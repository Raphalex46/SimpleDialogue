class_name DialogueDisplay
extends RichTextLabel

@export_group("Progressive Display")
@export var progressive_display: bool = false
@export var allow_skipping: bool = true
@export var chars_per_second: float = 30.0

var elapsed_time: float = 0.0
var display_done: bool = false

signal dialogue_finished

func display(line: DialogueLine) -> void:
	text = line.speaker.name + "\n" + line.line
	if progressive_display:
		visible_characters = line.speaker.name.length()
	else:
		display_done = true

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if display_done:
			_handle_dialogue_finished()
		elif progressive_display:
			_skip_progressive_display()


func _process(delta: float) -> void:
	if progressive_display and not display_done:
		_update_display(delta)

func _enter_tree() -> void:
	_reset()

func _reset() -> void:
	text = ""
	display_done = false
	if progressive_display:
		_reset_progressive_display()

func _handle_dialogue_finished() -> void:
	_reset()
	dialogue_finished.emit()

func _update_display(delta: float) -> void:
	elapsed_time += delta
	var char_interval: float = 1/chars_per_second
	while elapsed_time >= char_interval and visible_characters < text.length():
		elapsed_time -= char_interval
		visible_characters += 1
	if visible_characters >= text.length():
		display_done = true

func _reset_progressive_display() -> void:
	elapsed_time = 0
	visible_characters = 0

func _skip_progressive_display() -> void:
	visible_characters = -1
	display_done = true
