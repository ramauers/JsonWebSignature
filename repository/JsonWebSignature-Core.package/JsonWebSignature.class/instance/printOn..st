Printing
printOn: aStream

	aStream
		nextPut: $a;
		nextPutAll: self className;
		nextPut: $(; cr; tab;
		nextPutAll: 'protectedHeader: '.
	self protectedHeader printOn: aStream.	
	aStream cr; tab; nextPutAll: 'payload: '.
	self payload printOn: aStream.	
	aStream	cr; tab; nextPutAll: 'signature: '.
	self signature printOn: aStream.	
	aStream	cr; nextPut: $)
