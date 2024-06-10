# JsonWebSignature
Basic Implementation of JSON Web Tokens (JWT) / JWS Compact Serialization for GemStone/S

This package implements basic Json Web Token support as it is comonly used nowadays for API protection with OAuth 2.0 and OpenID Connect (OIDC).
This package was developed in GemStone/S 3.7.0 and has no dependencies other than GemStone's Kernel Classes.

Currently supported algorithms are "HS256", "RS256" and "none" but the structure of the package allows adding others as well... 

# Some Usage Examples

Tip: Have a look at https://jwt.io/ to fiddle around with JWTs and the examples.

## Materialize from a HS256 Token

```smalltalk
| jws token |
token := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'.

[ jws := JsonWebSignature fromCompactString: token ]
	on: Error
	do:[ ^'A villain has presented you an invalid token! A protected API should respond with 401 Unauthorized' ].

jws key: 'your-256-bit-secret'. 

jws verify
	ifTrue:["Signature is ok BUT you are responsible for verifying the contents of the token. 
            Access and check header and payload as necessary and only perform your business stuff if everything is okay..."]
    ifFalse:["Signature verification failed. --> 401"].

jws --printIt -->

 aJsonWebSignature(
	protectedHeader: aJoseHeader(parameter: aDictionary( 'alg'->'HS256', 'typ'->'JWT'))
	payload: aJwtClaimsSet(claims: aDictionary( 'name'->'John Doe', 'iat'->1516239022, 'sub'->'1234567890'))
	signature: aByteArray( 73, 249, 74, 199, 4, 73, 72, 199, 138, 40, 93, 144, 79, 135, 240, 164, 199, 137, 127, 126, 143, 58, 78, 178, 37, 95, 218, 117, 11, 44, 195, 151)
)
```

## Serialize a RS256 Token

```smalltalk
| jws privateKey token |

privateKey := '-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC7VJTUt9Us8cKj
MzEfYyjiWA4R4/M2bS1GB4t7NXp98C3SC6dVMvDuictGeurT8jNbvJZHtCSuYEvu
NMoSfm76oqFvAp8Gy0iz5sxjZmSnXyCdPEovGhLa0VzMaQ8s+CLOyS56YyCFGeJZ
qgtzJ6GR3eqoYSW9b9UMvkBpZODSctWSNGj3P7jRFDO5VoTwCQAWbFnOjDfH5Ulg
p2PKSQnSJP3AJLQNFNe7br1XbrhV//eO+t51mIpGSDCUv3E0DDFcWDTH9cXDTTlR
ZVEiR2BwpZOOkE/Z0/BVnhZYL71oZV34bKfWjQIt6V/isSMahdsAASACp4ZTGtwi
VuNd9tybAgMBAAECggEBAKTmjaS6tkK8BlPXClTQ2vpz/N6uxDeS35mXpqasqskV
laAidgg/sWqpjXDbXr93otIMLlWsM+X0CqMDgSXKejLS2jx4GDjI1ZTXg++0AMJ8
sJ74pWzVDOfmCEQ/7wXs3+cbnXhKriO8Z036q92Qc1+N87SI38nkGa0ABH9CN83H
mQqt4fB7UdHzuIRe/me2PGhIq5ZBzj6h3BpoPGzEP+x3l9YmK8t/1cN0pqI+dQwY
dgfGjackLu/2qH80MCF7IyQaseZUOJyKrCLtSD/Iixv/hzDEUPfOCjFDgTpzf3cw
ta8+oE4wHCo1iI1/4TlPkwmXx4qSXtmw4aQPz7IDQvECgYEA8KNThCO2gsC2I9PQ
DM/8Cw0O983WCDY+oi+7JPiNAJwv5DYBqEZB1QYdj06YD16XlC/HAZMsMku1na2T
N0driwenQQWzoev3g2S7gRDoS/FCJSI3jJ+kjgtaA7Qmzlgk1TxODN+G1H91HW7t
0l7VnL27IWyYo2qRRK3jzxqUiPUCgYEAx0oQs2reBQGMVZnApD1jeq7n4MvNLcPv
t8b/eU9iUv6Y4Mj0Suo/AU8lYZXm8ubbqAlwz2VSVunD2tOplHyMUrtCtObAfVDU
AhCndKaA9gApgfb3xw1IKbuQ1u4IF1FJl3VtumfQn//LiH1B3rXhcdyo3/vIttEk
48RakUKClU8CgYEAzV7W3COOlDDcQd935DdtKBFRAPRPAlspQUnzMi5eSHMD/ISL
DY5IiQHbIH83D4bvXq0X7qQoSBSNP7Dvv3HYuqMhf0DaegrlBuJllFVVq9qPVRnK
xt1Il2HgxOBvbhOT+9in1BzA+YJ99UzC85O0Qz06A+CmtHEy4aZ2kj5hHjECgYEA
mNS4+A8Fkss8Js1RieK2LniBxMgmYml3pfVLKGnzmng7H2+cwPLhPIzIuwytXywh
2bzbsYEfYx3EoEVgMEpPhoarQnYPukrJO4gwE2o5Te6T5mJSZGlQJQj9q4ZB2Dfz
et6INsK0oG8XVGXSpQvQh3RUYekCZQkBBFcpqWpbIEsCgYAnM3DQf3FJoSnXaMhr
VBIovic5l0xFkEHskAjFTevO86Fsz1C2aSeRKSqGFoOQ0tmJzBEs1R6KqnHInicD
TQrKhArgLXX4v3CddjfTRJkFWDbE/CkvKZNOrcf1nhaGCPspRJj2KUkj1Fhl9Cnc
dn/RsYEONbwQSjIfMPkvxF+8HQ==
-----END PRIVATE KEY-----'.

jws := JsonWebSignature new
	beRs256;
	beJwt;
	key: privateKey.

jws payload
	at: 'language' put: 'Smalltalk'.

jws sign.

token := jws asCompactString.

"token --printIt-->

 'eyJhbGciOiJSUzI1NiJ9.eyJsYW5ndWFnZSI6IlNtYWxsdGFsayJ9.qmc_6PwY8U7zDwE7YlxKaUeBZbcaDMAkFLfRFd1TzaczhoQ-GoYbFDPO5qPslYqwZY6XJy_-N5v8xBy-ItyTrRIfNSOMGu23GZrFzAa-yG5W36oyPAF56-5nQaXs0qIDuz2ZaEyxtqyS2gArzJV24uXOpdivtmtdevuLz-lLO_4I3q5WwItwdJOhY0dYcgTBwrhblps7QXvK29iOeh9nizsNY3D9SY557kmpIO2Btg5CX_Mfs2_ga70o_lwckIZTz1mpGjGiaryFs4dzzhcatEIJIP8ud0fRn3Sp9tZxT0GKL6BQcGbwOObBioqLzLRMi1ZsJUD2TuQbaZJxee1bkQ'

"
```
## Materialize a RS256 Token

```smalltalk
| jws publicKey token |

publicKey := '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu1SU1LfVLPHCozMxH2Mo
4lgOEePzNm0tRgeLezV6ffAt0gunVTLw7onLRnrq0/IzW7yWR7QkrmBL7jTKEn5u
+qKhbwKfBstIs+bMY2Zkp18gnTxKLxoS2tFczGkPLPgizskuemMghRniWaoLcyeh
kd3qqGElvW/VDL5AaWTg0nLVkjRo9z+40RQzuVaE8AkAFmxZzow3x+VJYKdjykkJ
0iT9wCS0DRTXu269V264Vf/3jvredZiKRkgwlL9xNAwxXFg0x/XFw005UWVRIkdg
cKWTjpBP2dPwVZ4WWC+9aGVd+Gyn1o0CLelf4rEjGoXbAAEgAqeGUxrcIlbjXfbc
mwIDAQAB
-----END PUBLIC KEY-----'.

token := 'eyJhbGciOiJSUzI1NiJ9.eyJsYW5ndWFnZSI6IlNtYWxsdGFsayJ9.qmc_6PwY8U7zDwE7YlxKaUeBZbcaDMAkFLfRFd1TzaczhoQ-GoYbFDPO5qPslYqwZY6XJy_-N5v8xBy-ItyTrRIfNSOMGu23GZrFzAa-yG5W36oyPAF56-5nQaXs0qIDuz2ZaEyxtqyS2gArzJV24uXOpdivtmtdevuLz-lLO_4I3q5WwItwdJOhY0dYcgTBwrhblps7QXvK29iOeh9nizsNY3D9SY557kmpIO2Btg5CX_Mfs2_ga70o_lwckIZTz1mpGjGiaryFs4dzzhcatEIJIP8ud0fRn3Sp9tZxT0GKL6BQcGbwOObBioqLzLRMi1ZsJUD2TuQbaZJxee1bkQ'.

[ jws := JsonWebSignature fromCompactString: token ]
	on: Error
	do:[ ^'A villain has presented you an invalid token!' ].

jws key: publicKey.

^jws verify
	ifTrue:[jws payload asJson]
	ifFalse:[ 'no valid token, not worth to look at.' ].

--printIt-->  '{"claims":{"language":"Smalltalk"}}'
```