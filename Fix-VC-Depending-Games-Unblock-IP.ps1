$file = "$env:SystemRoot\System32\drivers\etc\hosts"

$domainsToRemove = @(
    "voice.roblox.com"
)

Write-Host "Checking hosts..."

$foundLines = @()

foreach ($domain in $domainsToRemove) {

    $result = @(cmd /c "findstr /I /B ""0.0.0.0 $domain"" ""$file""")

    if ($result) {
        $foundLines += "0.0.0.0 $domain"
    }
}

if ($foundLines.Count -eq 0) {

    Write-Host "Not Found, VC Games Work!"
    exit
}

$content = @(Get-Content $file)

$newContent = foreach ($line in $content) {

    if ($foundLines -notcontains $line.Trim()) {
        $line
    }
}

$newContent | Out-File -FilePath $file -Encoding ASCII

Write-Host "Removed, VC Games Fixed!"
