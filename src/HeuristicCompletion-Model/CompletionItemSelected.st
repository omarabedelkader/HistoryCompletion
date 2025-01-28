"
I'm a class that launch an annucement at each modification of a method 
"
Class {
	#name : 'CompletionItemSelected',
	#superclass : 'Announcement',
	#instVars : [
		'item',
	],
	#category : 'HeuristicCompletion-Model-SessionHeuristic',
	#package : 'HeuristicCompletion-Model-SessionHeuristic'
}


{ #category : 'accessing' }
CompletionItemSelected >> selectedItem: anItem [

	item := anItem
]

CompletionItemSelected >> selectedItem [

	^ item
]
