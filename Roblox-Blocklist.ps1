$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

$url = "https://raw.githubusercontent.com/xf1op/RoFFlagger/refs/heads/main/BlockList.txt"

$githubList = @(
    (Invoke-WebRequest $url -TimeoutSec 10).Content -split "`r?`n" |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -and $_ -notmatch "^#" }
)

Write-Host "Reading hosts..."

$hosts = @(Get-Content $hostsFile)

$start = $hosts.IndexOf("# Roblox Blocklist")

if ($start -eq -1) {

    Write-Host "Creating Roblox Blocklist..."

    $hosts += ""
    $hosts += "# Roblox Blocklist"

    $start = $hosts.Count - 1
}

$end = $hosts.Count

for ($i = $start + 1; $i -lt $hosts.Count; $i++) {

    if ($hosts[$i] -match "^#") {
        $end = $i
        break
    }
}

$currentBlock = @()

if ($end -gt $start + 1) {
    $currentBlock = $hosts[($start + 1)..($end - 1)]
}

Write-Host "Syncing blocklist..."

$newBlock = @($githubList | Sort-Object)

$newHosts = @()

$newHosts += $hosts[0..$start]

$newHosts += $newBlock

if ($end -lt $hosts.Count) {
    $newHosts += $hosts[$end..($hosts.Count - 1)]
}

$newHosts = $newHosts | Select-Object -Unique

$newHosts | Out-File -FilePath $hostsFile -Encoding ASCII

Write-Host "Finished."
