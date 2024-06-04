other
verify: aJws
	"Verification fails, if unsecured is not explicitly allowed or signatue is not empty"

	^ aJws isAcceptUnsecured and:[ aJws signature isNil or:[aJws signature isEmpty ]]
