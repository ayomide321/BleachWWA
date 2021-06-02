

var/suggestions



mob
	verb
		submitsuggestion()
			set category = "Commands"
			set desc = "Submit a suggestion to help make the game better."
			var/c = input("What is your suggestion?","Submit Suggestion")as null|message
			if(!c||c==""||c=="  "||c=="   ")return //if it's null return
			suggestions += "<b> [time2text(world.realtime)] [usr.name]([usr.key]):</b><br>[c]<br><br>"
			usr << "Thank you for your suggestion!"


mob
	GM1
		verb
			View_Suggestions()
				set category = "Suggestions"
				usr<<browse("<head><title>Suggestions</title></head>"+suggestions,"window=suggestions")

			Clear_Suggestions()
				set category = "Suggestions"
				suggestions = ""
				suggestions = null
				usr <<"Suggestions cleared."

			TextSuggestions()
				set category = "Suggestions"
				usr << "The suggestions are as follows:"
				usr << suggestions