# PRTG-scheduled-Task-sensor
Scheduled Task Sensor for PRTG
This PowerShell script allows you to monitor Windows Scheduled Tasks remotely with PRTG Network Monitor.

Since PRTG doesn't provide a built-in sensor for this, this script was created to fill that gap. It's simple, lightweight, and integrates easily into your monitoring setup.

Features:
Monitor any scheduled task on a remote server

Works as a Custom EXE/Script Advanced sensor in PRTG

Detects task status based on LastTaskResult

Returns clean XML output for PRTG

Includes lookup file for human-readable alerts

Parameters:
The script requires two parameters:

powershell
Kopieren
Bearbeiten
-server     # Remote host (use %host in PRTG)
-taskname   # Name of the scheduled task (as shown in Task Scheduler)
Example in PRTG sensor settings:

perl
Kopieren
Bearbeiten
-server %host -taskname "DailyBackup"
📦 Files Included
scheduledTask_sensor.ps1 – PowerShell script

scheduled.task.lookup.ovl – PRTG value lookup file

🔌 PRTG Setup
Add a EXE/Script Advanced sensor to your device in PRTG.

Upload the script to your \Custom Sensors\EXE folder.

Set parameters like: -server %host -taskname "YourTask"

Copy the .ovl lookup file into:
C:\Program Files (x86)\PRTG Network Monitor\lookups\custom\

Reload lookups in PRTG via:
Setup > System Administration > Administrative Tools > Load Lookups

In the sensor’s channel settings, enable lookup usage and assign scheduled.task.lookup.

📘 Notes
The script checks the last task result code, not the real-time running state.

Extendable: You can modify the script to also return the task’s current state if needed.

💬 Feedback
Feel free to fork, improve, or open issues.
Feedback and contributions are welcome!
