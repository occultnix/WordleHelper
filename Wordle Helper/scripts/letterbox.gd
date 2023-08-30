extends TextureButton

export var letter: String
onready var label = $CenterContainer/Label

var state

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = letter
	state = "neutral"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func advance_state():
	match state:
		"neutral":
			state = "active"
			$Active.visible = true
		"active":
			state = "inactive"
			$Active.visible = false
			$Inactive.visible = true
		"inactive":
			state = "neutral"
			$Inactive.visible = false


func _on_Panel_pressed():
	advance_state()
	$"../../../../../../..".update_letter_activity()
