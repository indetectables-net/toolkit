param (
    [Parameter(Mandatory = $true)]
    [string]$Directory,
    [string]$OutputFile = "checksums.txt",
    [string]$FilePattern = "*",
    [switch]$NoRecurse
)

# Initialize an array to store the hash results
$hashResults = @()

# Function to compute SHA-256 hash of a file
function Get-FileHashSHA256 {
    param (
        [string]$filePath
    )

    $stream = [System.IO.File]::OpenRead($filePath)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hash = $sha256.ComputeHash($stream)
    $stream.Close()
    
    return [BitConverter]::ToString($hash) -replace "-", ""
}

# Verify that the Directory parameter is provided
if (-not $Directory) {
    Write-Error "The 'Directory' parameter is mandatory."
    exit 1
}

# Get the full path of the directory
$fullDirectoryPath = (Get-Item -Path $Directory).FullName

# Determine if recursion is enabled
if ($NoRecurse) {
    $searchOption = [System.IO.SearchOption]::TopDirectoryOnly
} else {
    $searchOption = [System.IO.SearchOption]::AllDirectories
}

# Iterate over each file in the directory matching the pattern
Get-ChildItem -Path $Directory -Filter $FilePattern -File -Recurse:$searchOption | ForEach-Object {
    $fileHash = Get-FileHashSHA256 -filePath $_.FullName
    $relativePath = $_.FullName.Substring($fullDirectoryPath.Length + 1).TrimStart('\')
    $hashResults += "$fileHash  .\$relativePath"
}

# Output the hash results to the file
$hashResults | Out-File -FilePath $OutputFile

# Output the hash results to the console
$hashResults | ForEach-Object { Write-Output $_ }
