@tool
extends EditorPlugin


func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	add_custom_type("DialogueHolder", "Node",
	preload("dialogue_holder/dialogue_holder.gd"), preload("dialogue_holder/icon.svg"))
	add_custom_type("DialogueDisplay", "RichTextLabel",
	preload("dialogue_display/dialogue_display.gd"), preload("dialogue_display/icon.svg"))

func _exit_tree() -> void:
	remove_custom_type("DialogueHolder")
	pass
