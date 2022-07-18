# Outlook_Auth_Prompt_Fix
Fix for Outlook keeps prompts for password when connected to O365, make it easiler when user have no admin right to edit the registry, or able fix it remotely if available by doing psexec.

You can found the user name in start menu when being asked, for example, if you need to fix Thomas one, then type thomas, or IT_Team for IT_Team one, easy:

![image](https://user-images.githubusercontent.com/20796385/179487717-92279119-93e5-4e01-b3b5-8ced6cebf622.png)



Fix based on: https://docs.microsoft.com/en-us/outlook/troubleshoot/authentication/outlook-prompt-password-modern-authentication-enabled
Outlook prompts for password and doesn't use Modern Authentication to connect to Office 365
Symptoms
Consider the following scenarios.

Scenario 1:

Microsoft Outlook connects to your primary mailbox in an on-premises Exchange server by using RPC, and it also connects to another mailbox that's located in Office 365.

Scenario 2:

You migrate your mailbox to Office 365 from an Exchange server that Outlook connects to by using RPC.

In these scenarios, you're prompted for credentials, and Outlook doesn't use Modern Authentication to connect to Office 365. After you enter your credentials, they're transmitted to Office 365 instead of to a token.
