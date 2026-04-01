# ============================================
# Ticket Priority Automation Script
# Author: Sterling Mitchell
# Description:
# Automates ticket triage by scanning for priority keywords
# and updating ticket priority via API integration.
# ============================================
# ============================================
# Ticket Priority Automation Script
# ============================================

# ---------- CONFIGURATION ----------
$company   = "your_company"
$publicKey = "your_public_key"
$privateKey= "your_private_key"
$clientId  = "your_client_id"
$baseUrl   = "https://api-na.myconnectwise.net/v4_6_release/apis/3.0"

# Log file
$logFile = "C:\Logs\ticket_automation.log"

# Priority keywords
$priorityKeywords = @(
    "down",
    "outage",
    "urgent",
    "vpn",
    "server offline",
    "cannot connect",
    "email not working"
)

# ---------- LOGGING FUNCTION ----------
function Write-Log {
    param([string]$message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp - $message"
    Add-Content -Path $logFile -Value $entry
    Write-Output $entry
}

# ---------- AUTHENTICATION ----------
try {
    $pair = "$company+$publicKey:$privateKey"
    $encodedAuth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($pair))

    $headers = @{
        Authorization = "Basic $encodedAuth"
        clientId      = $clientId
        "Content-Type"= "application/json"
    }

    Write-Log "Authentication headers created."
}
catch {
    Write-Log "ERROR: Failed to create authentication headers. $_"
    exit
}

# ---------- GET TICKETS ----------
try {
    $ticketsUrl = "$baseUrl/service/tickets?conditions=status/name='New'"
    $tickets = Invoke-RestMethod -Uri $ticketsUrl -Headers $headers -Method Get

    Write-Log "Retrieved $($tickets.Count) tickets."
}
catch {
    Write-Log "ERROR: Failed to retrieve tickets. $_"
    exit
}

# ---------- PROCESS TICKETS ----------
foreach ($ticket in $tickets) {

    try {
        $ticketId = $ticket.id
        $summary = $ticket.summary
        $description = $ticket.initialDescription

        $text = ($summary + " " + $description).ToLower()

        foreach ($keyword in $priorityKeywords) {

            if ($text -like "*$keyword*") {

                Write-Log "Match found in Ticket ID $ticketId (Keyword: $keyword)"

                # ---------- UPDATE PRIORITY ----------
                try {
                    $updateBody = @{
                        priority = @{ id = 1 }  # 1 = High Priority
                    } | ConvertTo-Json -Depth 3

                    $updateUrl = "$baseUrl/service/tickets/$ticketId"

                    Invoke-RestMethod -Uri $updateUrl -Headers $headers -Method Patch -Body $updateBody

                    Write-Log "Ticket ID $ticketId updated to HIGH priority."

                }
                catch {
                    Write-Log "ERROR: Failed to update Ticket ID $ticketId. $_"
                }

                break
            }
        }
    }
    catch {
        Write-Log "ERROR: Issue processing Ticket ID $ticketId. $_"
    }
}

Write-Log "Ticket prioritization process completed."
