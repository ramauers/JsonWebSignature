private
paddingLength: aBase64UrlString

	| paddingLength |
	paddingLength := 4 - (aBase64UrlString size \\ 4).
	paddingLength == 4 ifTrue:[ ^ 0 ].
	paddingLength == 3 ifTrue:[ self error: 'Invalide base64url input'].

	^ paddingLength
