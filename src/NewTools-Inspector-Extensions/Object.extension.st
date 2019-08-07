Extension { #name : #Object }

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> allInspectorNodes [
	"Answer a list of attributes as nodes"
	
	^ { StInspectorSelfNode hostObject: self }, 
		self inspectorNodes
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> breakpointInspection [
	<inspectorPresentationOrder: 998 title: 'Breakpoints'>

	^ StBreakpointInspection on: self
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> inspectionPages [
	"This is a utility method that collects all presentations for the current object.
	By default, it simply looks for the #gtInspectorPresentationOrder: pragma.
	The inspector can decice whether or not a presentation should be dispayed.
	Subclasses might want to override it for more special behavior."
	| pragmas |
	
	pragmas := Pragma
		allNamed: StInspector extensionsPragma
		from: self class
		to: ProtoObject
		sortedUsing: [ :x :y | (x argumentAt: 1) < (y argumentAt: 1) ].

	^ (pragmas 
		sorted: [ :a :b | (a argumentAt: 1) < (b argumentAt: 1) ])
		collect: [ :eachPragma | 
			SpNotebookPage 
				title: (eachPragma argumentAt: 2)
				provider: [ self perform: eachPragma methodSelector ] ]
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> inspectorNodes [
	"Answer a list of attributes as nodes"
	
	^ (StNodeCollector for: self) collectNodes
	  
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> metaInspection [
	<inspectorPresentationOrder: 999 title: 'Meta'>

	^ StMetaBrowser on: self
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> rawInspection [
	"This is the most basic presentation showing the state of the object"
	<inspectorPresentationOrder: -1 title: 'Raw'>

	^ StRawInspection on: self
]

{ #category : #'*NewTools-Inspector-Extensions' }
Object >> stInspect [
	"Temporary to experiment, should be replaced by inspect later"

	^ StInspector inspect: self
]