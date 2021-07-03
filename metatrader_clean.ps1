# Script que limpia todos los descargado en MT.
# Script that cleans all downloaded in MT.
# @ulises2k
# 03/07/2021
#
#Windwos 2008
#Set-ExecutionPolicy RemoteSigned
$dir = Get-ChildItem  $env:USERPROFILE\AppData\Roaming\MetaQuotes\Terminal\| ? {$_.PSIsContainer}
$dirMT = $env:USERPROFILE+"\AppData\Roaming\MetaQuotes\Terminal\"

foreach ($d in $dir){
	
	if (($d.Name -ne "Community") -and ($d.Name -ne "Common") -and ($d.Name -ne "Help")) {
		$FilesLogs=$dirMT + [string]$d.Name + "\logs\*.log"
		Remove-Item -Path $FilesLogs -ErrorAction SilentlyContinue
		echo $FilesLogs
		
		$FilesLogs=$dirMT + [string]$d.Name + "\Tester\logs\*.log"
		Remove-Item -Path $FilesLogs -ErrorAction SilentlyContinue
		echo $FilesLogs
		
		$DirLogs = $dirMT + [string]$d.Name + "\MQL5\Logs\"
		if (Test-Path -Path $DirLogs) {
			$FilesLogs=$DirLogs + "*.log"
			Remove-Item -Path $FilesLogs -ErrorAction SilentlyContinue
			echo $FilesLogs
		}
				
		$DirLogs = $dirMT + [string]$d.Name + "\MQL4\Logs\"
		if (Test-Path -Path $DirLogs) {
			$FilesLogs=$DirLogs + "*.log"
			Remove-Item -Path $FilesLogs -ErrorAction SilentlyContinue
			echo $FilesLogs
		}
				
		$FilesTicks=$dirMT + [string]$d.Name + "\bases\RoboForex-ECN\ticks\*"
		if (Test-Path -Path $FilesTicks) {			
			Remove-Item -Path $FilesTicks -Recurse -ErrorAction SilentlyContinue 
			echo $FilesTicks
		}
		
		$FilesHistory=$dirMT + [string]$d.Name + "\bases\RoboForex-ECN\history\*"
		if (Test-Path -Path $FilesHistory) {
			Remove-Item -Path $FilesHistory -Recurse -ErrorAction SilentlyContinue 
			echo $FilesHistory
		}
		
		$FilesTicks=$dirMT + [string]$d.Name + "\bases\RoboForex-Pro\ticks\*"
		if (Test-Path -Path $FilesTicks) {			
			Remove-Item -Path $FilesTicks -Recurse -ErrorAction SilentlyContinue 
			echo $FilesTicks
		}
		
		$FilesHistory=$dirMT + [string]$d.Name + "\bases\RoboForex-Pro\history\*"
		if (Test-Path -Path $FilesHistory) {
			Remove-Item -Path $FilesHistory -Recurse -ErrorAction SilentlyContinue 
			echo $FilesHistory
		}
	}
}

#Windows 2008
#Set-ExecutionPolicy Restricted
