function Update-Winbox(){
    Param(
        [string]$Path,
        [string]$WinboxURL,
        [string]$FileName
        )

    $execTime = Get-Date
    $defParams = 3;
    if([string]::IsNullOrEmpty($Path)){$Path = $env:USERPROFILE + '\AppData\Local\Microsoft\WindowsApps\'; $defParams--}
    if([string]::IsNullOrEmpty($WinboxURL)){$WinboxURL = 'https://mt.lv/winbox64'; $defParams--}
    if([string]::IsNullOrEmpty($FileName)){$FileName = 'wbox.exe'; $defParams--}

    $filePath = $Path + $FileName

    Write-Host 'Winbox download URL: ' -ForegroundColor Cyan -NoNewline; Write-Host $WinboxURL -ForegroundColor White
    Write-Host 'Download path: ' -ForegroundColor Cyan -NoNewline; Write-Host $Path$FileName -ForegroundColor White
    
    try{
        Invoke-WebRequest $WinboxURL -OutFile $filePath
    }catch{
        Write-Host "Error was encountered while trying to download the Winbox." -ForegroundColor Red
    }

    if((Test-Path $filePath -PathType Leaf) -and (Get-Item $filePath).LastWriteTime -ge $execTime){
        Write-Host "Operation succesfull." -ForegroundColor Green

        if($defParams -eq 0){Write-Host "You can run Winbox via WIN+R > wbox `nor type `"wbox`" in shell. `n" -ForegroundColor Gray}

    }else{Write-Host "Operation failed. `n" -ForegroundColor Red}
}