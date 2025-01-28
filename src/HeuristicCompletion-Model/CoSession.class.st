"
I implement a session that collects execution information.
I collect the last words in modified methods.
"
Class {
	#name : 'CoSession',
	#superclass : 'Object',
	#instVars : [
		'vocabularyCache'
	],
	#classInstVars : [
		'Current'
	],
	#category : 'HeuristicCompletion-Model-SessionHeuristic',
	#package : 'HeuristicCompletion-Model',
	#tag : 'SessionHeuristic'
}

{ #category : 'accessing' }
CoSession class >> current [ 

	^ Current ifNil: [ Current := self new ]
]

{ #category : 'accessing' }
CoSession class >> deinstall [
	<script>
	
	self environment codeChangeAnnouncer unsubscribe: self current.
	CoSession allInstances 
		do: [ :each | self environment codeChangeAnnouncer unsubscribe: each ]
]

{ #category : 'accessing' }
CoSession class >> install [

	<script>
	
	self environment codeChangeAnnouncer
		when: MethodAdded
		send: #addNewMethodInVocabulary: 
		to: self current.
	"
	This does not work for now because we are expecting a node and the menu does not give us a node
	in addition we do not get the."
	"self environment codeChangeAnnouncer
		when: CompletionItemSelected
		send: #addMessageInVocabulary: 
		to: self current."
]

{ #category : 'accessing' }
CoSession class >> reset [
	<script>
	Current ifNotNil: [ 
		self environment codeChangeAnnouncer
			unsubscribe: Current.
	Current := nil ]
]
