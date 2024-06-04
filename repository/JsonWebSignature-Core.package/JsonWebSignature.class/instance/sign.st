public
sign

	self rawHeaderDotPayload: (String streamContents:[ :stream | self writeEncodedHeaderAndPayloadOn: stream]).

	^ (JsonWebAlgorithm forAlg: (self protectedHeader at: 'alg'))
			sign: self
