##Get File Share Mappings and unmap them
$smbmapped=get-smbmapping
foreach($smbmapping in $smbmapped){Remove-SmbMapping $smbmapping.localpath -force}

##Sleep after unmap to allow previous step to complete
sleep -Seconds 5

## Restart Windows Explorer to clear previous drive mappings
stop-process -Name explorer -force

##Clean up MDM folder
remove-item -Path c:\mdm\*.pdf -force
remove-item -Path c:\mdm\*.bat -force

##Create new BAT to manually unmap files
New-Item -Value "net use * /delete /yes" -path "c:\mdm\unmap_old_drives.bat" -force 

##Download copy of the Nasuni Agent to c:\mdm
wget "https://github.com/whiteleyoliver/files/raw/main/Whiteley%20All%20Drives.23.1.23.0.exe" -outfile "c:\mdm\Whiteley All Drives.23.1.23.0.exe"

##End
exit

