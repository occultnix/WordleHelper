extends HFlowContainer

onready var pageslabel = $"../../Pagination/PagesOrganizer/Pages"

var steps = 0
var counter = 0
var numpages
var wordlist


func update_words(words):
	wordlist = words
	if wordlist.size() < 100:
		for word in wordlist:
			create_wordbox(word)
	else:
		pagination(wordlist)


func create_wordbox(word):
	var new_wordbox = load("res://scenes/wordbox.tscn")
	var wordbox = new_wordbox.instance()
	wordbox.update_word(word)
	$".".add_child(wordbox)


func pagination(wordlist):
	steps = wordlist.size() / 100
	numpages = steps
	updatepagelabel()
	fillpage()


func emptypage():
	var children = $".".get_children()
	for child in children:
		child.queue_free()


func fillpage():
	for word in wordlist.slice((counter * 100),((counter + 1) * 100)):
		create_wordbox(word)


func updatepagelabel():
	pageslabel.text = "Page " + str(counter) + " / " + str(numpages)
