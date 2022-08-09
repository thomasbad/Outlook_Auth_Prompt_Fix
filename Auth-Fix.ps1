# This tool require administrator right, please allow it to start the tool correctly

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
$host.UI.RawUI.WindowTitle = "Outlook Re-auth fix"

Clear-host
Write-host @'

----------------------------------------------------------
- Re-Auth from RPC to MA within exchange to 365 migration-
----------------------------------------------------------


'@

$UserName = Read-Host -Promt @'
Please enter the User name for modify 
(You may found it in start menu, case sensitive):
'@
Write-Host @'

-------------------------------------------------------------------

'@

$UserSIDChecker = Get-LocalUser -Name $UserName | Select sid
Write-Host $UserSIDChecker

Write-Host @'

-------------------------------------------------------------------

'@

$UserSID = Read-Host -Prompt 'Please enter the User SID: (Behind of SID=, started with S-)'
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
if ( -not (Test-Path -Path HKU:\$UserSID\Software\Microsoft\Exchange)){
    Write-Warning '------------Cannot find inputed SID, please check if the SID have been input correctly------------'
    Pause
    Exit
}else{
New-ItemProperty -Path "HKU:\$UserSID\Software\Microsoft\Exchange" -Name "AlwaysUseMSOAuthForAutoDiscover" -PropertyType DWord -Value "1" -Force
}
Write-Host @'

--------------------Fix Applied----------------------------

'@
Pause
