Class {
	#name : #ProceedPreDebugCommand,
	#superclass : #PreDebugCommand,
	#instVars : [
		'proceedDebugCommand'
	],
	#category : #'NewTools-Debugger-Commands'
}

{ #category : #initialization }
ProceedPreDebugCommand class >> defaultDescription [
	^ ProceedDebugCommand defaultDescription 
]

{ #category : #initialization }
ProceedPreDebugCommand class >> defaultIconName [
	^ ProceedDebugCommand defaultIconName
]

{ #category : #initialization }
ProceedPreDebugCommand class >> defaultName [
	<PreDebugCommand>
	^ ProceedDebugCommand defaultName
]

{ #category : #initialization }
ProceedPreDebugCommand class >> defaultShortcut [
	^ ProceedDebugCommand defaultShortcut 
]

{ #category : #accessing }
ProceedPreDebugCommand >> execute [
	self session
		resume;
		clear.
	self preDebugWindow close
]
