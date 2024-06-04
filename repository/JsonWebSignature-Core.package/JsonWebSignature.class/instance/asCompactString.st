public
asCompactString

	^String streamContents:
		[ :stream | self writeCompactOn: stream ]
