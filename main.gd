extends Node2D

const PARTICLE := preload("res://particle.tscn")

@export var setup:Setup
var particles:Array[Polygon2D]

func _ready():
	for s in setup.setup:
		for j in s.number:
			var p := PARTICLE.instantiate()
			p.color = s.color
			p.add_to_group(s.group_name)
			p.rules = s.rules
			particles.append(p)
			add_child(p)

func _on_button_pressed():
	for c in get_children():
		if c is Particle: c.queue_free()
	_ready()
