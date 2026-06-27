$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"

$domains = @(
    "ams2-128-116-21-3.roblox.com"
    "atl4-128-116-2-3.roblox.com"
    "bom2-128-116-47-3.roblox.com"
    "cdg2-128-116-13-3.roblox.com"
    "dfw2-128-116-95-3.roblox.com"
    "fra2-128-116-5-3.roblox.com"
    "fra4-128-116-44-3.roblox.com"
    "gru1-128-116-86-3.roblox.com"
    "iad2-128-116-56-3.roblox.com"
    "iad4-128-116-102-3.roblox.com"
    "iad5-44-197-17-243.roblox.com"
    "lax2-128-116-116-3.roblox.com"
    "lax4-128-116-63-3.roblox.com"
    "lga2-128-116-32-3.roblox.com"
    "lhr4-128-116-31-3.roblox.com"
    "mia2-128-116-127-3.roblox.com"
    "mia4-128-116-45-3.roblox.com"
    "nrt2-128-116-120-3.roblox.com"
    "ord2-128-116-48-3.roblox.com"
    "sea1-128-116-115-3.roblox.com"
    "sin2-128-116-97-3.roblox.com"
    "sin4-128-116-50-3.roblox.com"
    "sin6-128-116-54-3.roblox.com"
    "sin6c2-128-116-46-3.roblox.com"
    "syd1-128-116-51-3.roblox.com"
    "contacts.roblox.com"
    "ecsv2.roblox.com"
    "edge-term4-fra4.roblox.com"
    "edge-term4.roblox.com"
    "ephemeralcounters.api.roblox.com"
    "gameinternationalization.roblox.com"
    "gold.roblox.com"
    "lms.roblox.com"
    "metrics.roblox.com"
    "realtime-signalr.roblox.com"
    "sc0.rbxcdn.com"
    "sc0ak.rbxcdn.com"
    "sc0aws.rbxcdn.com"
    "sc0gcp.rbxcdn.com"
    "silver.roblox.com"
    "titanium.roblox.com"
    "tracing.roblox.com"
    "upload.crashes.rbxinfra.com"
    "usermoderation.roblox.com"
    "voice.roblox.com"
)

$existingDomains = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

Get-Content $hostsFile | ForEach-Object {
    if ($_ -match '^\s*(?:\d{1,3}(?:\.\d{1,3}){3}|::1)\s+([^\s#]+)') {
        $null = $existingDomains.Add($matches[1])
    }
}
if ((Get-Content $hostsFile) -notcontains "# Roblox Blocklist") {
    Add-Content $hostsFile "`r`n# Roblox Blocklist"
        Start-Sleep -Milliseconds 500
}
foreach ($domain in $domains) {
    if ($existingDomains.Add($domain)) {
        Add-Content $hostsFile "0.0.0.0 $domain"
        Start-Sleep -Milliseconds 500
        echo Added $domain
    }
}
