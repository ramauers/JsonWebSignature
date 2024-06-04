other
verify: aJws
	"answer true if signature of token is valid, otherwise false."

	| signature |

	(aJws key == nil or:[ aJws key isEmpty ]) ifTrue:[ self error: 'no key specified for verification' ].

	signature := (ByteArray fromHexString: (aJws rawHeaderDotPayload asSha256HmacStringWithKey: aJws key)).
	^ signature = aJws signature
