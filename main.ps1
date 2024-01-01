$IpHead = "192.168.3."

$ping = New-Object System.Net.NetworkInformation.Ping
$logPath = "C:\Users\minat\Desktop\programs\deviceInfoCollecter\log.txt"

#���O�t�@�C����������
Clear-Content $logPath

$runningTime = Get-Date -Format "yyyy-mm-dd"
Write-Output $runningTime | Out-File -FilePath $logPath -Append

for ($i = 1; $i -lt 255; $i++){
    $Ip = $IpHead + $i #ip�A�h���X�𐶐�
    $msg4console = $Ip + ":��������"
    Write-Host $msg4console
    $connectionResult = Test-Connection -ComputerName $Ip -Count 1 -Quiet #�Ώۂ�IP�A�h���X�ɑa�ʊm�F���ł�������boolean�ł������Ă���̂ŕϐ��ɂƂ�

    #�a�ʂ��Ƃꂽ���̂̂ݒʂ�
    if($connectionResult){
        
        #���O�������ċL�^
        try {
            $hostName = [System.Net.Dns]::GetHostByAddress($ip).Hostname
            $msg = $Ip + ": " + $hostName
        }
        catch {
            $msg = $Ip + ": �a�ʂ͂ł��������O�����ł��Ȃ�����"
        }
        Write-Output $msg | Out-File -FilePath $logPath -Append
    }
}
