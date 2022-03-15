$svcs = "World Wide Web Publishing Service", "SSDP Discovery", "Print Spooler", "BranchCache", "IIS Admin Service", "Function Discovery Resource Publication"

foreach ($svc in $svcs){
    $target = (get-service -name $svc).name
    Stop-service -name $target -force
    set-service -name $target -startuptype disabled
    get-service -name $target | Select-Object name, status, starttype
}