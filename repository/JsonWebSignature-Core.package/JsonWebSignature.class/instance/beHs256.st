public
beHs256

	self protectedHeader ifNil:[ self protectedHeader: JoseHeader new ].
	self protectedHeader at: 'alg' put: 'HS256'
