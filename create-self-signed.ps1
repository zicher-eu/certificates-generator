Param (
	$name, 
	$root, 
	$password, 
	$email, 
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
	-e ROOT=$root `
	-e PASSWORD=$password `
	-e EMAIL=$email `
	-e ORGANIZATION=$organization `
	-e CITY=$city `
	-e STATE=$state `
	-e COUNTRY=$country `
	-e ORGANIZATIONAL_UNIT=$organizationalunit `
	certificates-generator:1.0.0 `
	sh create-self-signed.sh