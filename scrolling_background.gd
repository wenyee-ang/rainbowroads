extends Node

export(float) var scroll_speed = 0.4

# Called when the node enters the scene tree for the first time.
func _ready():
	self.material.set_shader_param("scroll_speed", scroll_speed)
