$ErrorActionPreference = 'Stop';

# Itefix no longer serves cwRsync 6.2.7, so the package carries the archive
# (see VERIFICATION.txt) instead of downloading it.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$archive  = Join-Path $toolsDir 'cwrsync_6.2.7_x64_free.zip'
Get-ChecksumValid -File $archive -Checksum 'ab55d70cf84ca62ba010263b3e65b9927ff8d73a08769e3527ecfb5f37dd3811' -ChecksumType 'sha256'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}
Get-ChocolateyUnzip @unzipArgs

# Put only rsync.exe on PATH: a shim for the bundled ssh.exe would shadow the
# system's ssh.
Get-ChildItem $toolsDir -Include *.exe -Recurse |
  Where-Object { $_.Name -ne 'rsync.exe' } |
  ForEach-Object { New-Item "$($_.FullName).ignore" -Type File -Force | Out-Null }
