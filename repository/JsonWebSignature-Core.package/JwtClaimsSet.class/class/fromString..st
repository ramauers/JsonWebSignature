Instance creation
fromString: aString

	| payloadJson |

	[ payloadJson := JsonParser parse: aString ]
		on: Error do: [ self error: 'json parsing of jwt payload failed' ].

	^ self new
		claims: payloadJson;
		yourself
