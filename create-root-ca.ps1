Param (
	$name, 
	$password, 
	$email, 
	$commonname, 
	$organization, 
	$city, 
	$state, 
	$country='PL', 
	$organizationalunit='Dev'
)

Invoke-Expression -Command "./_build-dev-alpine.ps1"

docker run `
	--rm `
	-v "$(pwd)\certificates:/certificates" `
	-e NAME=$name `
	-e PASSWORD=$password `
	-e EMAIL=$email `
	-e COMMON_NAME=$commonname `
	-e ORGANIZATION=$organization `
	-e CITY=$city `
	-e STATE=$state `
	-e COUNTRY=$country `
	-e ORGANIZATIONAL_UNIT=$organizationalunit `
	certificates-generator:1.0.0 `
	sh create-root-ca.sh