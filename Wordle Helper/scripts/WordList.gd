extends HFlowContainer

var steps = 0
var counter = 0


func update_words(words):
	if words.size() < 100:
		for word in words:
			create_wordbox(word)
	else:
		steps = get_steps(words.size(), 100)
		# TODO: Add a "get more words" button that loads another 100
		for word in words.slice(0,100):
			create_wordbox(word)


func create_wordbox(word):
	var new_wordbox = load("res://scenes/wordbox.tscn")
	var wordbox = new_wordbox.instance()
	wordbox.update_word(word)
	$".".add_child(wordbox)


func get_steps(size, step):
	if size % step == 0:
		return size / step
	else:
		return (size / step) + 1
