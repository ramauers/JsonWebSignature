private
writeEncodedHeaderAndPayloadOn: aStream

	aStream
		nextPutAll: (Base64UrlCodec encode: self protectedHeader asUtf8String);
		nextPut: $.;
		nextPutAll: (Base64UrlCodec encode: (self payload class == JwtClaimsSet
																ifTrue: [self payload asUtf8String]
																ifFalse:[self payload asString]))
