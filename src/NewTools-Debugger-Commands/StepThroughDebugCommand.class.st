Class {
	#name : #StepThroughDebugCommand,
	#superclass : #StDebugCommand,
	#category : #'NewTools-Debugger-Commands'
}

{ #category : #default }
StepThroughDebugCommand class >> defaultDescription [
	^ 'Step over the highlighted message, i.e. do not follow the sent message, taking debugger control after the method invoked returns or whenever execution should return inside a block used as an argument before that.'
]

{ #category : #initialization }
StepThroughDebugCommand class >> defaultIconName [
	^ #glamorousThrough 
]

{ #category : #default }
StepThroughDebugCommand class >> defaultName [
	<toolbarDebugCommand: 30>

	^ 'Through'
]

{ #category : #initialization }
StepThroughDebugCommand class >> defaultShortcut [
	^ PharoShortcuts current stepThroughShortcut
]

{ #category : #hooks }
StepThroughDebugCommand >> execute [
	self session stepThrough: self currentContext
]
