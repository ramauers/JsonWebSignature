other
verify: aJws

	(aJws key == nil or:[ aJws key isEmpty ]) ifTrue:[ self error: 'no key specified for verification' ].

	[aJws rawHeaderDotPayload
		verifyWithSha256AndRsaPublicKey: (GsTlsPublicKey newFromPemString: aJws key)
		signature: aJws signature
	] on: Error do: [ ^ false].

	^ true
