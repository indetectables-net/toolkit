param (
    [Parameter(Mandatory = $true)]
    [string]$Directory,
    [string]$OutputFile = "checksums.txt",
    [string]$FilePattern = "*",
    [switch]$NoRecurse
)

# Initialize a list to store the hash results for better performance
$hashResults = New-Object System.Collections.Generic.List[string]

# Function to compute SHA-256 hash of a file
function Get-FileHashSHA256 {
    param ([string]$filePath)
    
    $stream = [System.IO.File]::OpenRead($filePath)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hash = $sha256.ComputeHash($stream)
    $stream.Close()
    
    return [BitConverter]::ToString($hash) -replace "-", ""
}

# Get the full path of the directory
$fullDirectoryPath = (Get-Item -Path $Directory).FullName

# Determine recursion based on $NoRecurse
$searchOption = $NoRecurse ? [System.IO.SearchOption]::TopDirectoryOnly : [System.IO.SearchOption]::AllDirectories

# Iterate over each file in the directory matching the pattern
Get-ChildItem -Path $Directory -Filter $FilePattern -File -Recurse: -not $NoRecurse | ForEach-Object {
    $fileHash = Get-FileHashSHA256 -filePath $_.FullName
    $relativePath = $_.FullName.Substring($fullDirectoryPath.Length + 1).TrimStart('\')
    $hashResults.Add("$fileHash  .\$relativePath")
}

# Output the hash results to the file and console
$hashResults | Out-File -FilePath $OutputFile
$hashResults | ForEach-Object { Write-Output $_ }
