Algorithm Detection
forAlg: aString

	^ (self subclasses
			detect:[ :each | each implements: aString ]
			ifNone:[ self error: 'unsupported algorithm']
		) new
