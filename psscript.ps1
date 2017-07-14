$domainName = "domain.com"

$username = "sysgain"

$password = "Sysgain@123456"

Set-DnsClient `
    -InterfaceAlias "Ethernet*" `
    -ConnectionSpecificSuffix domain.com 

$securePassword =  ConvertTo-SecureString $password `
    -AsPlainText `
    -Force

$cred = New-Object System.Management.Automation.PSCredential($username, $securePassword)

Add-Computer -DomainName $domainName -Credential $cred -Restart
