$domainName = "systest1.com"

$username = "sysgain"

$password = "Sysgain@123456"

Set-DnsClient `
    -InterfaceAlias "Ethernet*" `
    -ConnectionSpecificSuffix systest1.com

$securePassword =  ConvertTo-SecureString $password `
    -AsPlainText `
    -Force

$cred = New-Object System.Management.Automation.PSCredential($username, $securePassword)
    
Add-Computer -DomainName $domainName -Credential $cred -Restart –Force