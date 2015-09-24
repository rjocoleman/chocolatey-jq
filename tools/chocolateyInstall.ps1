try {
  $packageName = 'jq'
  $url = 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-win32.exe'
  $url64 = 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-win64.exe'

  $scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $fileFullPath = Join-Path $scriptPath "$packageName.exe"
  Get-ChocolateyWebFile $packageName $fileFullPath $url $url64

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
