extends HFlowContainer

onready var pageslabel = $"../../Pagination/PagesOrganizer/Pages"

var possible_words

var steps = 0
var counter = 0
var numpages

func _ready():
	possible_words = $"../../../..".wordlist
	update_possible_words()


# Updates our list of potential solutions
func update_possible_words():
	var active_letters = $"../../../Left".active_letters
	var inactive_letters = $"../../../Left".inactive_letters
	var words_to_cut = []
	
	# Reset the wordlist
	possible_words = $"../../../..".wordlist
	
	# Find words that have inactive letters
	for word in possible_words:
		for letter in word:
			# If word has an inactive letter, set for erasing
			for item in inactive_letters:
				if letter == item.to_lower():
					words_to_cut.append(word)
			# If word does NOT have an active letter, set for erasing
			for item in active_letters:
				if not item.to_lower() in word:
					words_to_cut.append(word)
	
	# Remove words marked for removal
	for word in words_to_cut:
		possible_words.erase(word)
	
	# Update the on-screen word list
	$".".update_words()


func resize_possible_words(word):
	var size = possible_words.size()
	possible_words.remove(word)
	possible_words.resize(size-1)
	update_possible_words()


func update_words():
	emptypage()
	if possible_words.size() < 100:
		for word in possible_words:
			create_wordbox(word)
	else:
		pagination(possible_words)


func create_wordbox(word):
	var new_wordbox = load("res://scenes/wordbox.tscn")
	var wordbox = new_wordbox.instance()
	wordbox.update_word(word)
	$".".add_child(wordbox)


func pagination(words):
	steps = words.size() / 100
	numpages = steps
	$"../../Pagination".updatepagelabel()
	fillpage()


func emptypage():
	var children = $".".get_children()
	for child in children:
		child.queue_free()


func fillpage():
	for word in possible_words.slice((counter * 100),((counter + 1) * 100)):
		create_wordbox(word)

