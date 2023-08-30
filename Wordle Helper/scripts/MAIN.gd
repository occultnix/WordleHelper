extends Control

onready var letters = get_tree().get_nodes_in_group("key")
var active_letters = []
var inactive_letters = []


func _ready():
	update_letter_activity()


func update_letter_activity():
	for letter in letters:
		match letter.state:
			"active":
				# If the letter isn't active, add
				if active_letters.has(letter) == false:
					active_letters.append(letter)
				# If the letter is marked as inactive, remove
				if inactive_letters.has(letter) == true:
					inactive_letters.erase(letter)
			"inactive":
				# If the letter isn't inactive, add
				if inactive_letters.has(letter) == false:
					inactive_letters.append(letter)
				# If the letter is marked as active, remove
				if active_letters.has(letter) == true:
					active_letters.erase(letter)
			"neutral":
				# Remove from both
				if active_letters.has(letter) == true:
					active_letters.erase(letter)
				if inactive_letters.has(letter) == true:
					inactive_letters.erase(letter)
	print(active_letters)
	print(inactive_letters)
