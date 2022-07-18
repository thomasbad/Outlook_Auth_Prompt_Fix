# Outlook_Auth_Prompt_Fix
Fix for Outlook keeps prompts for password when connected to O365, make it easiler when user have no admin right to edit the registry, or able fix it remotely if available by doing psexec.

Fix based on: https://docs.microsoft.com/en-us/outlook/troubleshoot/authentication/outlook-prompt-password-modern-authentication-enabled
Outlook prompts for password and doesn't use Modern Authentication to connect to Office 365
Symptoms
Consider the following scenarios.

Scenario 1:

Microsoft Outlook connects to your primary mailbox in an on-premises Exchange server by using RPC, and it also connects to another mailbox that's located in Office 365.

Scenario 2:

You migrate your mailbox to Office 365 from an Exchange server that Outlook connects to by using RPC.

In these scenarios, you're prompted for credentials, and Outlook doesn't use Modern Authentication to connect to Office 365. After you enter your credentials, they're transmitted to Office 365 instead of to a token.
