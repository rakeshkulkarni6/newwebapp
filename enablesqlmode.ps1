

Write-Host (" installing SQl Powershell modules")
#Installing powershell module
Install-Module -Name SqlServer

Write-Host (" Enabling SQL for Mixed Mode Authentication")
$password = ConvertTo-SecureString "Password@123" -AsPlainText -Force
$user = New-LocalUser -Name dtctest -FullName dtctest -Password $password -PasswordNeverExpires | Add-LocalGroupMember -Group "Administrtators"
$credentials=New-Object System.Management.Automation.PSCredential ("dtctest", $Password)
Set-SqlAuthenticationMode -Mode Mixed -Credential $credentials
Add-SqlLogin -ServerInstance "$env:COMPUTERNAME" -LoginName "dtctest" -LoginType "SqlLogin" -Credential $credentials -Enable -GrantConnectSql -DefaultDatabase "master" 

# Connect to the instance using SMO$s = new-object ('Microsoft.SqlServer.Management.Smo.Server') 'MyServer\MyInstance'[string]$nm = $s.Name[string]$mode = $s.Settings.LoginModewrite-output "Instance Name: $nm"write-output "Login Mode: $mode"#Change to Mixed Mode$s.Settings.LoginMode = [Microsoft.SqlServer.Management.SMO.ServerLoginMode]::Mixed# Make the changes$srv.Alter()
