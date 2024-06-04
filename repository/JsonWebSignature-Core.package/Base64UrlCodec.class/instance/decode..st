converting
decode: aString

	aString size == 0 ifTrue:[^''].
	self ensureValidAlphabetOfBase64UrlInput: aString.

	stream := WriteStream on: String new.
	aString do:
		[ :base64UrlChar |
		stream nextPut: (self transcodeCharBase64UrlToBase64: base64UrlChar)].

	(self paddingLength: aString) timesRepeat: [ stream nextPut: $= ].

	^ ByteArray fromBase64String: stream contents
