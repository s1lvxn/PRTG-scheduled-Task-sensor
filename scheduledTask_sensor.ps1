 <#
 
 Author: S.Meier
 V1.0
        .SYNOPSIS
        Scheduled Task Sensor 

        .DESCRIPTION
        Das Script prüft den Status von Scheduled Tasks auf einem remote Server. 
        
        Parameter:
        -server %host
        -taskname = Task Name
        
        Channel: Last Result
            0 = Completed successfully
            1 = Currently running
            2 = Error
        
        .EXAMPLE

#>

param (
    [string]$Server,
    [string]$taskname
)


$taskinfo = Invoke-Command -ComputerName $Server -ScriptBlock { ‘{0:x}’ -f (Get-ScheduledTaskInfo -TaskName $using:taskname).LastTaskResult }

switch($taskinfo){
    "0" {$lastresult = "0"}
    "41301" {$lastresult = "1"}
    default {$lastresult = "2"}
}

$XMLOutput = "<prtg>
  <result>
     <channel>Last Result</channel>
    <value>$lastresult</value> 
    <CustomUnit>count</CustomUnit>
  </result>
</prtg>
"

$XMLOutput

