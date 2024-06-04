public
writeCompactOn: aStream

	self writeEncodedHeaderAndPayloadOn: aStream.
	aStream
		nextPut: $.;
		nextPutAll: (Base64UrlCodec encode: self signature)
