$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://github.com/ccache/ccache/releases/download/v4.14.1/ccache-4.14.1-windows-x86_64.zip'
  checksum       = '6219f3865ca59aec41ee4b678df171d5d35855ecb2b6dbbbd20690b3a68af7b4'
  checksumType   = 'sha256'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  softwareName   = 'ccache'
}
Install-ChocolateyZipPackage @packageArgs
