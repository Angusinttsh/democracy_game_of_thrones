extends Area2D



func _on_area_entered(area):
	if Global.card_is_dragging == area:
		Global.cards_in_area.append(self)


func _on_area_exited(area):
	if Global.card_is_dragging == area:
		Global.cards_in_area.erase(self)
