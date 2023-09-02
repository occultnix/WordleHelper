extends MarginContainer

onready var wordlist_manager = $"../PossibleWords/WordList"


func _ready():
	# We're on the first page, so disable the Last Page button
	buttondisabledcheck()


# Disable Last or Next page buttons if we can't go further
func buttondisabledcheck():
	# Disable the "Last Page" button if we're on the first page
	if wordlist_manager.counter == 0:
		$PagesOrganizer/LastPage.disabled = true
	else:
		$PagesOrganizer/LastPage.disabled = false
	# Disable the "Next Page" button if we're on the last page
	if wordlist_manager.counter == wordlist_manager.numpages:
		$PagesOrganizer/NextPage.disabled = true
	else:
		$PagesOrganizer/NextPage.disabled = false


# Update the label to display the correct page
func updatepagelabel():
	$PagesOrganizer/Pages.text = "Page " + str($"../PossibleWords/WordList".counter) + " / " + str($"../PossibleWords/WordList".numpages)


# Advance a page and update variables to track that
func _on_NextPage_pressed():
	wordlist_manager.emptypage()
	wordlist_manager.counter += 1
	wordlist_manager.steps -= 1
	wordlist_manager.updatepagelabel()
	wordlist_manager.fillpage()
	buttondisabledcheck()

# Regress a page and update variables to track that
func _on_LastPage_pressed():
	wordlist_manager.emptypage()
	wordlist_manager.counter -= 1
	wordlist_manager.steps += 1
	wordlist_manager.updatepagelabel()
	wordlist_manager.fillpage()
	buttondisabledcheck()
