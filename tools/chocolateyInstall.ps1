$packageName = 'jq'
$packageVersion = '1.5'

$checksumUrl = "https://raw.githubusercontent.com/stedolan/jq/master/sig/v$packageVersion/sha256sum.txt"
$url = "https://github.com/stedolan/jq/releases/download/$packageName-$packageVersion/$packageName-win32.exe"
$url64 = "https://github.com/stedolan/jq/releases/download/$packageName-$packageVersion/$packageName-win64.exe"

$checksum = $($(Invoke-WebRequest $checksumUrl).Content -Split "[\n]" | select-string -InputObject {$_} -Pattern '.*win32.exe').ToString().Split(' ')[0]
$checksum64 = $($(Invoke-WebRequest $checksumUrl).Content -Split "[\n]" | select-string -InputObject {$_} -Pattern '.*win64.exe').ToString().Split(' ')[0]

$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fileFullPath = Join-Path $scriptPath "$packageName.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $fileFullPath -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType 'sha256' -Checksum64 $checksum64 -ChecksumType64 'sha256'
