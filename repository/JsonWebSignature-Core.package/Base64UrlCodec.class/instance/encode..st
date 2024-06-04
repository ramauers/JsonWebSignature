converting
encode: aString

	aString size == 0 ifTrue:[^''].

	stream := WriteStream on: String new.
	aString asBase64String do:
		[ :base64Char |
		(self transcodeCharBase64ToBase64Url: base64Char)
			ifNotNilDo: [ :base64UrlChar | stream nextPut: base64UrlChar ]
			ifNil:[ ^stream contents ]].

	^ stream contents
