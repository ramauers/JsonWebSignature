Printing
printOn: aStream

	aStream
		nextPut: $a;
		nextPutAll: self className;
		nextPutAll: '(claims: '.
	self claims printOn: aStream.
	aStream nextPut: $).
