public
validate

	(self at: 'alg') isEmptyOrNil
		ifTrue:[ self error: 'missing algorithm' ]
