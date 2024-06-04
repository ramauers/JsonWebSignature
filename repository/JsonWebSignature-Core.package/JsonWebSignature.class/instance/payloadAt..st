public
payloadAt: aName

	payload class == JwtClaimsSet ifFalse:[ self error: 'method requires a JWT'].
	^ payload at: aName
