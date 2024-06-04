Instance creation
fromCompactString: aString

	| parts instance decodedHeader decodedPayload |
	parts := aString subStrings: $..
	(parts size between: 2 and: 3) ifFalse:[self error signal: 'Invalid token format'].

	[ decodedHeader := (Base64UrlCodec decodeIntoString: (parts at: 1)) decodeFromUTF8 ]
		on: Error do: [ self error: 'decoding of header failed' ].

	[ decodedPayload := Base64UrlCodec decodeIntoString: (parts at: 2) ]
		on: Error do: [ self error: 'decoding of payload failed' ].
	
	(instance := self new initialize)
		rawHeaderDotPayload: (String new addAll: (parts at: 1); add: $.; addAll: (parts at: 2); yourself);
		protectedHeader: (JoseHeader fromString: decodedHeader);
		payload: (JwtClaimsSet fromString: decodedPayload).

	parts size == 3
		ifTrue:
			[ | decodedSignature |
			[ decodedSignature := Base64UrlCodec decode: (parts at: 3) ]
				on: Error do: [ self error: 'decoding of signature failed' ].
			instance signature: decodedSignature ].

	^ instance
