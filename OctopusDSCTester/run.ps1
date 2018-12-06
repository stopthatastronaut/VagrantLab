# load secrets

Function Get-VagrantPlugin
{
    [CmdletBinding()]
    param($pluginname)
    $p = & vagrant plugin list
    $plugins = @()
    $plugins += $p.split("`n") | % { Write-Verbose $_; [pscustomobject]@{ Plugin = ($_ -split " ")[0]; Version = [version](($_ -split " ")[1] -replace "[(]|[)]", "") } }

    if($pluginname)
    {
        return $plugins | ? { $_.Plugin -eq $pluginname }
    }
    else
    {
        return $plugins
    }
}

$secret = Get-VagrantPlugin vagrant-secret
if($null -eq $secret) # quicker to check if it's installed rather than install/update every time
{
    vagrant plugin install vagrant-secret
}


