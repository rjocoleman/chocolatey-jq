try {
  $packageName = 'jq'
  $url = 'http://stedolan.github.io/jq/download/win32/jq.exe'
  $url64 = 'http://stedolan.github.io/jq/download/win64/jq.exe'

  $scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $fileFullPath = Join-Path $scriptPath "$packageName.exe"
  Get-ChocolateyWebFile $packageName $fileFullPath $url $url64
  Install-ChocolateyPath $fileFullPath 'machine'
  $env:Path += ";$fileFullPath"

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
