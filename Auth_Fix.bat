@echo off
CLS
Title Outlook Re-auth fix
Color 17
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required. Now will try to auto run as Administrator.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Current User have no admin right, Please right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)


:: ----------------------------------------------------------
:: -------Do not include drivers with Windows Updates--------
:: ----------------------------------------------------------
echo --- Re-Auth from RPC to MA within exchange to 365 migration
echo --------------------------------------------------------------------------------------------------------------------
set /p username=Please enter the User name for modify (You may found it in start menu): 
for /f %%i in ('wmic useraccount where name^="%username%" get sid ^| findstr ^S\-d*') do set SID=%%i
REG ADD HKU\%SID%\Software\Microsoft\Exchange /v AlwaysUseMSOAuthForAutoDiscover /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


pause
exit /b 0
