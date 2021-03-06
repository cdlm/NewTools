Class {
	#name : #AbandonPreDebugCommand,
	#superclass : #PreDebugCommand,
	#category : #'NewTools-Debugger-Commands'
}

{ #category : #default }
AbandonPreDebugCommand class >> defaultDescription [
	^ 'Close the debugger and ignore the exception'
]

{ #category : #initialization }
AbandonPreDebugCommand class >> defaultIconName [
	^  #delete
]

{ #category : #default }
AbandonPreDebugCommand class >> defaultName [
	<PreDebugCommand>
	^ 'Abandon'
]

{ #category : #initialization }
AbandonPreDebugCommand class >> defaultShortcut [
	^ nil
]

{ #category : #hooks }
AbandonPreDebugCommand >> execute [
	self preDebugWindow close
]
