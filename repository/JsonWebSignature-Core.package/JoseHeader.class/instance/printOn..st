Printing
printOn: aStream

	aStream
		nextPut: $a;
		nextPutAll: self className;
		nextPutAll: '(parameter: '.
	self parameter printOn: aStream.
	aStream nextPut: $).
