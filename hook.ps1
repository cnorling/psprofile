# this file acts as a hook to import my profile using the default location
Import-Module "$env:USERPROFILE\git\psprofile\psprofile.psm1"
oh-my-posh init pwsh | Invoke-Expression
bgdc
