#Variabel

$NewPath = "C:\ProgramData\NinjaRMMAgent\scripting"
$NewPattern = "*.bat"

#Check if previous version Cryptoblocker script is installed.

$WantFile = "C:\Scripts\CryptoBlocker-master\DeployCryptoBlocker.ps1"
$FileExists = Test-Path $WantFile
If ($FileExists -eq $False) 
  {
        Write-host "DeployCryptoBlocker.ps1 does not exist, exit script"
        Exit 
  }

Else
  {
        Write-Host "DeployCryptoBlocker.ps1 does exist, continue script"

  }

#Check if $NewPattern is already in the Exclusion group and Add it

$FsrmGroup = Get-FsrmFileGroup -Name "RansomwareExclusion"

If ($FsrmGroup.IncludePattern -contains $NewPattern) 
  {
        Write-host "Pattern Already In ExclusionGroup, skipp adding"
 
  }

  Else
  {
        Write-Host "Adding new Pattern to ExclusionGroup"

        $list = $FsrmGroup.IncludePattern + "$NewPattern"
    
        Set-FsrmFileGroup -Name "RansomwareExclusion" -IncludePattern $list

  }

#Directory pad toevoegen aan Excludepaths.txt

$NewContent = Get-Content -Path C:\Scripts\CryptoBlocker-master\ExcludePaths.txt
If ($NewContent -contains $NewPath) 
  {
        Write-host "Folder Path Already There, exit script"
        
        Exit 
  }

Else
  {
        Write-Host "Adding new folder Path"

        Add-Content -Path C:\Scripts\CryptoBlocker-master\ExcludePaths.txt -Value "`r$NewPath"

  }




