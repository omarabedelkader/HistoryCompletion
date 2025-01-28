"
I am the interface with the System's CompletionEngine, following the API of CompletionContext (entries, entryCount, activateEntryAt:, etc).
I delegate the calculation of the entries completely to a complishon object which is lazily built by a complishon builder.
The complishonBuilder instance can be specialized or replaced to change the search heuristics.
"
Class {
	#name : 'CoCompletionContext',
	#superclass : 'Object',
	#instVars : [
		'engine',
		'source',
		'position',
		'completionTokenStart',
		'completionBuilder',
		'completionClass',
		'completion',
		'completionToken'
	],
	#category : 'HeuristicCompletion-Model-SystemIntegration',
	#package : 'HeuristicCompletion-Model',
	#tag : 'SystemIntegration'
}

{ #category : 'activation' }
CoCompletionContext >> activateEntryAt: anIndex [

	| entry |
	entry := (self entries at: anIndex).
	entry activateOn: self.
	^ entry

]
