other
sign: aJws

	(aJws key == nil or:[ aJws key isEmpty ]) ifTrue:[ self error: 'no key specified for verification' ].

	aJws signature: (aJws rawHeaderDotPayload
										signWithSha256AndRsaPrivateKey: (GsTlsPrivateKey newFromPemString: aJws key)
										into: nil)
