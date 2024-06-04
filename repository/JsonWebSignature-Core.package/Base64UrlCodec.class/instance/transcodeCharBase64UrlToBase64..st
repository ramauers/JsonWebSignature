private
transcodeCharBase64UrlToBase64: base64UrlChar

	base64UrlChar == $- ifTrue: [ ^ $+ ].
	base64UrlChar == $_ ifTrue: [ ^ $/ ].

	^ base64UrlChar
