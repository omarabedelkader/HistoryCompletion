"
I implement a completion context for benchmark purposes.
I contain an AST and provide information for the autocompletion based on it.
See CoStaticBenchmarks.
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
