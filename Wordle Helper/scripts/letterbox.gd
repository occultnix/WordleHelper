extends TextureButton

export var letter: String
onready var label = $CenterContainer/Label

var state

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = letter
	state = "neutral"


# Toggle between states
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


# When clicked, toggle between states and call for wordlist update
func _on_Panel_pressed():
	advance_state()
	$"../../../../..".update_letter_activity()
	$"../../../../../../Right/PossibleWords/WordList".update_possible_words()
