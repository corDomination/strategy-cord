extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var cell = preload("res://scenes/cell.tscn")
	var piece = preload("res://scenes/piece.tscn")
	var sprite_width = 32
	var sprite_height = 32
	var height = 8
	var width = 10
	var boardArray = []
	var pieceLocations = [
		[2,4,5,8,10,9,2,4,5,8],
		[3,3,3,4,5,5,4,3,3,3]
	]
	
	for i in height:
		var emptyColumn = []
		for j in width:
			var cell_instance = cell.instantiate()
			cell_instance.position = Vector2(j * sprite_width, i * sprite_height)
			add_child(cell_instance)
			if i < pieceLocations.size():
				emptyColumn.append(pieceLocations[i][j])
				var piece_instance = piece.instantiate()
				cell_instance.add_child(piece_instance)
			elif i >= height - pieceLocations.size():
				emptyColumn.append(pieceLocations[height-i-1][width-j-1])
				var piece_instance = piece.instantiate()
				cell_instance.add_child(piece_instance)
			else:
				emptyColumn.append(0)
		boardArray.append(emptyColumn)
	print_debug(boardArray)
	pass

func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("left_click"):
		print(event)
