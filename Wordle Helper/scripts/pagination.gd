extends HBoxContainer

onready var wordlist = $"../../PossibleWords/WordList"


func _ready():
	buttondisabled()


func buttondisabled():
	# Disable the "Last Page" button if we're on the first page
	if wordlist.counter == 0:
		$LastPage.disabled = true
	else:
		$LastPage.disabled = false
	# Disable the "Next Page" button if we're on the last page
	if wordlist.counter == wordlist.numpages:
		$NextPage.disabled = true
	else:
		$NextPage.disabled = false


# Advance a page and update variables to track that
func _on_NextPage_pressed():
	wordlist.emptypage()
	wordlist.counter += 1
	wordlist.steps -= 1
	wordlist.updatepagelabel()
	wordlist.fillpage()
	buttondisabled()

# Regress a page and update variables to track that
func _on_LastPage_pressed():
	wordlist.emptypage()
	wordlist.counter -= 1
	wordlist.steps += 1
	wordlist.updatepagelabel()
	wordlist.fillpage()
	buttondisabled()
