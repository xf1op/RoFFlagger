$file = "C:\Windows\System32\drivers\etc\hosts"

$domainsToRemove = @(
    "usermoderation.roblox.com"
)

$content = Get-Content $file

$found = $false

$newContent = $content | Where-Object {
    $line = $_

    foreach ($domain in $domainsToRemove) {
        if ($line -like "*$domain*") {
            $found = $true
            return $false
        }
    }

    return $true
}

if ($found) {
    $newContent | Set-Content $file
    Write-Host "Removed, Roblox Studio Fixed!"
}
else {
    Write-Host "Not Found, Roblox Studio Works!"
}
