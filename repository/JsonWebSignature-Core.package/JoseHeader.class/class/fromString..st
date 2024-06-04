Instance creation
fromString: aString

	| headerJson |

	[ headerJson := JsonParser parse: aString ]
		on: Error do: [ self error: 'json parsing of header failed' ].

	^ self new
		parameter: headerJson;
		validate;
		yourself
