Class {
	#name : #StHaltAndBreakpointControlTest,
	#superclass : #TestCase,
	#instVars : [
		'cache'
	],
	#category : #'NewTools-Debugger-Tests-tools - to move'
}

{ #category : #helpers }
StHaltAndBreakpointControlTest >> compileMethodsWithHalts [
	self methodWithHaltSources
		do: [ :source | self testClass compile: source ]
]

{ #category : #helpers }
StHaltAndBreakpointControlTest >> methodWithHaltSources [
	| sources |
	sources := OrderedCollection new.
	sources add: 'mHalt self halt'.
	sources add: 'mHaltIf self haltIf: [true]'.
	sources add: 'mHalt: arg self halt: arg'.
	sources add: 'mHaltOnce self haltOnce'.
	sources add: 'mHaltOnCount: n self haltOnCount: n'.
	sources add: 'mHaltIfNil self haltIfNil'.
	sources add: 'mNoHalt ^self printString'.
	^sources
]

{ #category : #helpers }
StHaltAndBreakpointControlTest >> removeMethodsWithHalts [
	self testClass methods
		do: [ :method | self testClass removeSelector: method selector]
]

{ #category : #running }
StHaltAndBreakpointControlTest >> setUp [
	super setUp.
	StHaltCache defaultCache removeSubscriptions.	
	cache := StHaltCache new.
	self compileMethodsWithHalts.
]

{ #category : #running }
StHaltAndBreakpointControlTest >> tearDown [
	StHaltCache defaultCache registerSubscriptions.
	cache := nil.
	self removeMethodsWithHalts.
	super tearDown
]

{ #category : #accessors }
StHaltAndBreakpointControlTest >> testClass [
	^ StDummyTestClassWithHalts
]
