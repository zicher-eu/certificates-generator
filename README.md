# Certificates generator

## Example usage

Generate 10-years valid Root CA with SHA256 4096 bits key, named `testroot` with password `testpassword`:
```powershell
.\create-root-ca.ps1 -name testrootca -password testpassword -email info@example.com -commonname Test -organization TestOrganization -city Gdansk -state Pomorskie
```
...this will create certificate in `/certificates/root/testroot/`.

Generate 398-days valid self-signed certificate with SHA256 4096 bits key, named `test1.dev` and sign it by `testroot`:
```powershell
.\create-self-signed.ps1 -name test1.dev -root testrootca -password testpassword -email info@example.com -organization TestOrganization -city Gdansk -state Pomorskie
```
...this will create certificate in `/certificates/self-signed/testroot/test1.dev/`. Notice the `testroot` catalog.

## Available parameters

For Root CA script:
```powershell
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
```

For self-signed certificate script:
```powershell
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
```