<h1>Automation Ticket Prioritization  System </h1>



<h2>Description</h2>
In high-volume support environments, critical tickets can be delayed due to manual triage.


SOLUTION:

A PowerShell-based automation that:

-Retrieves tickets via API

-Scans for high-priority keywords

-Automatically updates ticket priority

-Reduces response time for critical issues
<br />


<h2>Languages and Utilities Used</h2>

- <b>PowerShell, Rest API, JSON and Ticketing Systems (Connectwise)</b> 


<h2>Workflow </h2>

- <b>Tickets (API) 
   ↓
  
PowerShell Script
   ↓
   
Keyword Scan
   ↓
   
Match?
 ├── Yes → Set Priority = High → (Optional: Alert / Assign)
 └── No  → Keep Default Priority</b> 
 

<h2>Program walk-through:</h2>

<p align="center">
Launch the utility Powershell ISE and type the code. As we can see, since there are admin restricions with a quick code run we will have to bypass these resctricions with the "Set-ExecutionPolicy Unrestricted -Scope CurrentUser" and "Set-ExecutionPolicy Bypass -Scope Process": Copy and save script <br/>
  
![Image](https://github.com/user-attachments/assets/61695114-79af-41bb-9ce0-073c371d9432)
  
Search Powershell and run as Admin and paste the script you done <br/>

![Image](https://github.com/user-attachments/assets/79843df6-cda8-4b53-a1a1-5516a9c57206)

<br />
<br />
Next, we can confirm if this task is scheduled by checking the app Task scheduler and checking the library <br/>

![Image](https://github.com/user-attachments/assets/95e148f8-6adf-472d-b22a-58541b8ab203)
<br />
<br />
Lasty, Powershell can display the task we created with the "Get-scheduletask" function, or directly without the other tasks showing by typing after "-taskname "SpaceX" <br/>

![Image](https://github.com/user-attachments/assets/ba9a328d-e656-4bd5-890e-1bc834a2fb34)

<br />
<br />
