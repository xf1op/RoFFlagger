$file = "C:\Windows\System32\drivers\etc\hosts"

$domainsToRemove = @(
    "voice.roblox.com"
)

$content = Get-Content $file

$found = $false

$newContent = $content | Where-Object {
    $line = $_

    foreach ($domain in $domainsToRemove) {
        if ($line -contains "0.0.0.0 $domain") {
            $found = $true
            return $false
        }
    }

    return $true
}

if ($found) {
    $newContent | Set-Content $file
    Write-Host "Removed, VC Games Fixed!"
}
else {
    Write-Host "Not Found, VC Games Work!"
}
