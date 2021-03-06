Function Get-IPConfig
{
param ([string]$strComputer="." )

$colItems = Get-WmiObject -class "Win32_NetworkAdapterConfiguration" `
-computername $strComputer | Where {$_.IPEnabled -Match "True"}
foreach ($objItem in $colItems) {
   Clear-Host
   Write-Host -ForegroundColor Cyan $objItem.IPAddress
   Write-Host "DNSHostname: " $objItem.DNSHostName
   Write-Host "IPAddress: " $objItem.IPAddress
   Write-Host "Gateway: " $objItem.DefaultIPGateway
   Write-Host "DNS Servers: " $objItem.DNSServerSearchOrder
   Write-Host "Description: " $objItem.Description
   Write-Host "MAC Address: " $objItem.MACAddress
  }
}