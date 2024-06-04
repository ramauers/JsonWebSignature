public
beUnsecured

	self protectedHeader ifNil:[ self protectedHeader: JoseHeader new ].
	self protectedHeader at: 'alg' put: 'none'
