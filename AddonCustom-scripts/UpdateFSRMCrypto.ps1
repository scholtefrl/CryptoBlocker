#Check if previous version Cryptoblocker script is installed.


$WantFile = "C:\Scripts\CryptoBlocker-master\DeployCryptoBlocker.ps1"
$FileExists = Test-Path $WantFile
If ($FileExists -eq $False) 
{
  Write-host "DeployCryptoBlocker.ps1 does not exist, exit script"
 Exit 
}

Else{
  Write-Host "DeployCryptoBlocker.ps1 does exist, continue update"

}


#Remove old DeployCryptoBlocker.ps1
Write-Host "`n####"
Write-Host "Remove old DeployCryptoBlocker.ps1..."

Remove-Item C:\Scripts\CryptoBlocker-master\DeployCryptoBlocker.ps1 -Force -Recurse

# Enable TLS 1.2 as Security Protocol
[Net.ServicePointManager]::SecurityProtocol = `
    [Net.SecurityProtocolType]::Tls12 ;

#Update DeployCryptoBlocker.ps1 downloaden 
Write-Host "`n####"
Write-Host "Update DeployCryptoBlocker.ps1 downloaden van download.freez.it..."

$Username = "download" 
$Password = "BetheeX6" 
$Path = Get-Location 
$WebClient = New-Object System.Net.WebClient 
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password) 
Write-Host "Downloading" $Path -ForegroundColor Green 
    $Url = "https://download.freez.it/FSRM-CryptoBlocker/DeployCryptoBlocker.ps1" 
    $Path = "C:\Scripts\CryptoBlocker-master\DeployCryptoBlocker.ps1" 
    $WebClient.DownloadFile( $url, $path )
	
# Scheduled Task Update Anti-Ransom List Starten
Write-Host "`n####"
Write-Host "Scheduled Task Update Anti-Ransom List Starten..."
