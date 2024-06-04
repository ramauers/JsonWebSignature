other
sign: aJws

	(aJws key == nil or:[ aJws key isEmpty ]) ifTrue:[ self error: 'no key specified for verification' ].

	aJws signature: (ByteArray fromHexString: (aJws rawHeaderDotPayload asSha256HmacStringWithKey: aJws key))
