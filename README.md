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

---

## 📜 Script
Located here:  
`/script/ticket-prioritization.ps1`

---

## 🖼️ Architecture
See diagram in `/docs/architecture-diagram.png`

---

## 🎯 Goal
Reduce manual triage and improve response time for critical issues.

Key Features=
Automated ticket triage
Keyword-based prioritization
API integration
Scalable for MSP environments



📈 Business Impact
Faster response to critical issues
Improved SLA compliance
Reduced manual workload
Increased operational efficiency



🔮 Future Improvements
Microsoft Teams / email alerting
Azure Function (serverless automation)
Severity scoring (AI/NLP)
Dashboard reporting



🔐 Security Considerations
Store API keys securely (environment variables / vault)
Avoid hardcoding credentials
Implement logging and error handling


<br />
<br />
