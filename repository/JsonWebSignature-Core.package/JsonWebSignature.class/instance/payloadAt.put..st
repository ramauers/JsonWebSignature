public
payloadAt: aName put: aValue

	payload class == JwtClaimsSet ifFalse:[ self error: 'method requires a JWT'].
	payload at: aName put: aValue
