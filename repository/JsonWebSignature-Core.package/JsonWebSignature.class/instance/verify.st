public
verify

	^ (JsonWebAlgorithm forAlg: (self protectedHeader at: 'alg'))
			verify: self
