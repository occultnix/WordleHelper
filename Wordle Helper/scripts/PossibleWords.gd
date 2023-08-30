extends MarginContainer


var possible_words = []


# Called when the node enters the scene tree for the first time.
func _ready():
	possible_words = Wordlist.wordlist
	update_possible_words()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# TODO: Detect when a change has happened in Known Data
	# TODO: If so, direct to update_possible_words()
	pass

# Updates our list of potential solutions
func update_possible_words():
	# TODO: Update possible words
	$WordList.update_words(possible_words.slice(0,500))
