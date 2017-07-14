$domainName = "pizza.com"

$username = "pizza.com\sysgain"

$password = "Sysgain@123456"

Set-DnsClient `
    -InterfaceAlias "Ethernet*" `
    -ConnectionSpecificSuffix pizza.com 

$securePassword =  ConvertTo-SecureString $password `
    -AsPlainText `
    -Force

$cred = New-Object System.Management.Automation.PSCredential($username, $securePassword)

Add-Computer -DomainName $domainName -Credential $cred -Restart
