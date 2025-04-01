extends Node2D
@onready var card_name = $ColorRect/TextEdit
@onready var card_func = $ColorRect/TextEdit2
var card_type = "_"  #"place", "Electors", "action"
var card_Number = 1
var card_X = 0
var card_Y = 0
var is_dragging = false
var offset = Vector2.ZERO  # 記錄初始相對位置

func _on_button_pressed() -> void:
	if is_dragging == true:
		is_dragging = false
		card_X = int(round((position.x - 522) / 231))
		if position.y < 421:
			card_Y = int(round((position.y - 76) / 200))
			if card_Y >= 2:
				card_Y = 1
			position = Vector2(522+(231*card_X), 76+(200*card_Y))
		else:
			card_Y = int(round((position.y - 134) / 200))
			if card_Y < 2:
				card_Y = 2
			position = Vector2(522+(231*card_X), 134+(200*card_Y))
	else:
		is_dragging = true
	offset = get_global_mouse_position() - global_position  # 記錄物件與滑鼠的相對位置
# 當滑鼠按鍵釋放時
func _ready() -> void:
	if card_type == "place":
		card_name.text = "荒地"
		card_func.text = "無"
		var if_used = false
	if card_type == "Electors":
		card_name.text = "翠葛絲"
		card_func.text = "（黨魁)（工會）/10$/8點/革命之火：進場時所有其他友方選舉人+1點"
	if card_type == "action":
		card_name.text = "遠見"
		card_func.text = "抽三張牌"
	if card_Y < 2:
		position = Vector2(522+(231*card_X), 76+(200*card_Y))
	if card_Y >= 2:
		position = Vector2(522+(231*card_X), 134+(200*card_Y))

# 每幀更新位置
func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position() - offset
