param(
  [string]$DestinationRoot = "backups\manual-g2-memory-backups",
  [switch]$CreateZip
)

$ErrorActionPreference = "Stop"

function Write-Step {
  param([string]$Message)
  Write-Host "[G2 BACKUP] $Message"
}

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupRoot = Join-Path $projectRoot $DestinationRoot
$target = Join-Path $backupRoot "Mental_Smile_G2_Memory_Backup_$timestamp"

$memoryPackage = Join-Path $projectRoot "backups\external-memory\Mental_Smile_G2_Memory_Package_V1"
$generationDocs = Join-Path $projectRoot "docs\generation-2"
$guideAssets = Join-Path $projectRoot "assets\branding\guides"

Write-Step "Project root: $projectRoot"
Write-Step "Target backup folder: $target"

New-Item -ItemType Directory -Force -Path $target | Out-Null

if (Test-Path $memoryPackage) {
  Write-Step "Copying G2 memory package..."
  Copy-Item -Path $memoryPackage -Destination (Join-Path $target "Memory_Package") -Recurse -Force
} else {
  Write-Warning "Memory package not found: $memoryPackage"
}

if (Test-Path $generationDocs) {
  Write-Step "Copying docs/generation-2..."
  Copy-Item -Path $generationDocs -Destination (Join-Path $target "docs_generation-2") -Recurse -Force
} else {
  Write-Warning "Generation 2 docs folder not found: $generationDocs"
}

if (Test-Path $guideAssets) {
  Write-Step "Copying guide assets..."
  Copy-Item -Path $guideAssets -Destination (Join-Path $target "guide_assets") -Recurse -Force
} else {
  Write-Warning "Guide assets folder not found: $guideAssets"
}

$manifestPath = Join-Path $target "BACKUP_MANIFEST.txt"
@(
  "Mental Smile G2 Memory Backup"
  "Created: $(Get-Date -Format o)"
  "Project root: $projectRoot"
  "Excluded by design: .git, build, .dart_tool, temp folders, node_modules"
  "Included: Memory package, docs/generation-2, assets/branding/guides"
) | Set-Content -Path $manifestPath -Encoding UTF8

if ($CreateZip) {
  $zipPath = "$target.zip"
  Write-Step "Creating zip: $zipPath"
  Compress-Archive -Path $target -DestinationPath $zipPath -Force
}

Write-Step "Backup completed successfully."
Write-Step "Review folder: $target"

