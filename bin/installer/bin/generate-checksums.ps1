param (
    [string]$Directory = ".",
    [string]$OutputFile = "checksums.txt",
    [string]$FilePattern = "*"
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

# Get the full path of the directory
$fullDirectoryPath = (Get-Item -Path $Directory).FullName

# Iterate over each file in the directory matching the pattern
Get-ChildItem -Path $Directory -Filter $FilePattern -File -Recurse | ForEach-Object {
    $fileHash = Get-FileHashSHA256 -filePath $_.FullName
    $relativePath = $_.FullName.Substring($fullDirectoryPath.Length).TrimStart('\')
    $hashResults += "$fileHash  .\$relativePath"
}

# Output the hash results to the file
$hashResults | Out-File -FilePath $OutputFile

# Output the hash results to the console
$hashResults | ForEach-Object { Write-Output $_ }
