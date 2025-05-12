# Scheduled Task Sensor for PRTG

This PowerShell script allows you to monitor Windows Scheduled Tasks remotely with **PRTG Network Monitor**.

Since PRTG doesn't provide a built-in sensor for this, this script was created to fill that gap. It's simple, lightweight, and integrates easily into your monitoring setup.

## ✅ Features

- Monitor any scheduled task on a **remote server**
- Works as a **Custom EXE/Script Advanced** sensor in PRTG
- Detects task status based on `LastTaskResult`
- Returns clean XML output for PRTG
- Includes **lookup file** for human-readable alerts

## 🔧 Parameters

The script requires two parameters:

```
-server     # Remote host (use %host in PRTG)
-taskname   # Name of the scheduled task (as shown in Task Scheduler)
```

Example in PRTG sensor settings:

```
-server %host -taskname "DailyBackup"
```

## 📦 Files Included

- `scheduledTask_sensor.ps1` – PowerShell script
- `scheduled.task.lookup.ovl` – PRTG value lookup file

## 🔌 PRTG Setup

1. Add a **EXE/Script Advanced** sensor to your device in PRTG.
2. Upload the script to the folder:  
   `C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXE\`
3. Set the parameters:  
   `-server %host -taskname "YourTaskName"`
4. Copy the lookup file `scheduled.task.lookup.ovl` to:  
   `C:\Program Files (x86)\PRTG Network Monitor\lookups\custom\`
5. Reload lookups in PRTG under:  
   `Setup > System Administration > Administrative Tools > Load Lookups`
6. In the sensor's **channel settings**, enable:
   - "Enable alerting based on lookups"
   - Select `scheduled.task.lookup` from the list

## 📘 Notes

- The script checks the **last result code** of the task, not the current state.
- You can expand the script to return additional channels like task state if needed.

## 💬 Feedback

Feel free to fork, improve, or open an issue.  
Feedback and contributions are always welcome!
