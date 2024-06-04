private
transcodeCharBase64ToBase64Url: base64Char

	base64Char == $+ ifTrue: [ ^ $- ].
	base64Char == $/ ifTrue: [ ^ $_ ].
	base64Char == $= ifTrue: [ ^ nil ].

	^ base64Char
