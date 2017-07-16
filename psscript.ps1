#Invoke-WebRequest -Uri https://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SQLEXPRADV_x64_ENU.exe -OutFile D:\SQLEXPRADV_x64_ENU.exe

#D:\SQLEXPRADV_x64_ENU.exe /ACTION=install /QS /INSTANCENAME="mssqlserver" /SECURITYMODE=SQL /SA PWD="Sysgain@123456" /IACCEPTSQLSERVERLICENSETERMS=1 /FEATURES=SQLENGINE,SSMS /SQLSYSADMINACCOUNTS="adVM\windowsuser"

param(
    [string] $domainName, = "$1",
     [string] $username="$domainname\$2",
    [string] $password = "$3"
  )
    
Set-DnsClient `
    -InterfaceAlias "Ethernet*" 
    -ConnectionSpecificSuffix $domainName `

$securePassword =  ConvertTo-SecureString $password `
    -AsPlainText `
    -Force

$cred = New-Object System.Management.Automation.PSCredential($username, $securePassword)
    
Add-Computer -DomainName $domainName -Credential $cred -Restart 
