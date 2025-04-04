extends Node2D
var card = preload("res://card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var a = card.instantiate()
	Global.player1_place_map[0] = a
	a.card_type = "place"
	a.card_X = 0
	a.card_Y = 0
	add_child(a)
	var b = card.instantiate()
	Global.player1_place_map[1] = b
	b.card_type = "place"
	b.card_X = 1
	b.card_Y = 0
	add_child(b)
	var c = card.instantiate()
	Global.player1_place_map[2] = c
	c.card_type = "place"
	c.card_X = 2
	c.card_Y = 0
	add_child(c)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
