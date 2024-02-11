extends Polygon2D
class_name Particle

var speed:Vector2 = Vector2.ONE
var rules:Array[Rule]

func _ready():
	position = Vector2(G.GAME_SIZE.x*randf(),G.GAME_SIZE.y*randf())
	speed = G.GAME_SIZE-Vector2(G.GAME_SIZE.x*randf(),G.GAME_SIZE.y*randf())*2

func _process(delta):
	for r in rules: rule(r.target_group, r.g)
	
	if (position.x < 0): speed.x = abs(speed.x)
	elif (position.x > G.GAME_SIZE.x): speed.x = abs(speed.x)*-1
	
	if (position.y < 0): speed.y = abs(speed.y)
	elif (position.y > G.GAME_SIZE.y): speed.y = abs(speed.y)*-1
	
	position += speed*delta

func rule(target_group:String, g:float):
	var force:Vector2 = Vector2.ZERO
	for j in get_tree().get_nodes_in_group(target_group):
		j = j as Particle
		
		var distance:float = position.distance_to(j.position)
		if (distance > 0 and distance < 80):
			var F = g/distance
			var pos_diff:Vector2 = position-j.position
			force += F*pos_diff
	speed = (speed+force)/2
