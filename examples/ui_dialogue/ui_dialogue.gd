extends Camera2D

@onready var dialogue_holder: DialogueHolder = $DialogueHolder
@onready var explosion: GPUParticles2D = $Explosion

func _ready() -> void:
	dialogue_holder.dialogue_callback.connect(_on_dialogue_callback)

func _on_dialogue_callback(id: String):
	if id == "explosion":
		explosion.restart()
