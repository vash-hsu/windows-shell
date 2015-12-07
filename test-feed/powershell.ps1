param (
    [string]$file2write = 'eicar.com',
    [string]$howmany = 0
)

$myself = $MyInvocation.InvocationName
Function propagate([int] $sn)
{
    $buffer = Get-Content $myself
    For ($i=1; $i -le $sn; $i++)
    {
        $filename = "{0:D4}.ps1" -f $i
        $template = "{0:D4}.com" -f $i
        Write-host $filename ' ... ' -NoNewline
        '# ' + $template | Out-File $filename
        foreach ($text in $buffer)
        {
            $text | Out-File $filename -Append
        }
		Write-output "write_eicar '$($template)'" | Out-File $filename -Append
    }
	Write-host 'Done'
}

Function write_eicar([string] $output_file)
{
    $target = ('X5O!P%@AP[4\PZX54(P^)7CC)7}$',
               'EICAR-STANDARD-ANTIVIRUS-TEST-FILE',
               '!$H+H*')
    $filename = $output_file
    foreach ($text in $target)
    {
        $text | Out-File -NoNewline $filename -Append
    }
}

Function open_webpage([string] $target_url)
{
    $command = 'cmd.exe /C start ' + $target_url
    Invoke-Expression $command
}

Function trigger_web_browsing()
{
    $target = ('www.google.com', 'yam.com')
    foreach ($domain in $target)
    {
        $url = "http://$($domain)/"
        open_webpage $url
    }
}

If ($howmany -ge 1)
{
    propagate $howmany
	Exit
}

trigger_web_browsing
