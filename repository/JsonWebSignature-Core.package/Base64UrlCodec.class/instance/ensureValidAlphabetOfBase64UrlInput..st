private
ensureValidAlphabetOfBase64UrlInput: aString

	| alphabet |
	alphabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-'.

	(aString allSatisfy:[ :char | char in: alphabet ])
		ifFalse:[ self error: 'unexpected characters in base64url input' ]
