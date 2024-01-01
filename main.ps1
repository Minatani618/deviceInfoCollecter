$IpHead = "192.168.3."

$ping = New-Object System.Net.NetworkInformation.Ping
$logPath = "C:\Users\minat\Desktop\programs\deviceInfoCollecter\log.txt"

#ログファイルを初期化
Clear-Content $logPath

$runningTime = Get-Date -Format "yyyy-mm-dd"
Write-Output $runningTime | Out-File -FilePath $logPath -Append

for ($i = 1; $i -lt 255; $i++){
    $Ip = $IpHead + $i #ipアドレスを生成
    $msg4console = $Ip + ":を処理中"
    Write-Host $msg4console
    $connectionResult = Test-Connection -ComputerName $Ip -Count 1 -Quiet #対象のIPアドレスに疎通確認ができたかをbooleanでかえしてくるので変数にとる

    #疎通がとれたもののみ通る
    if($connectionResult){
        
        #名前解決して記録
        try {
            $hostName = [System.Net.Dns]::GetHostByAddress($ip).Hostname
            $msg = $Ip + ": " + $hostName
        }
        catch {
            $msg = $Ip + ": 疎通はできたが名前解決できなかった"
        }
        Write-Output $msg | Out-File -FilePath $logPath -Append
    }
}
