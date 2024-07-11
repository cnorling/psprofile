# this file acts as a hook to import my profile using the default location
Import-Module "$env:USERPROFILE\git\psprofile\psprofile.psm1"
# oh-my-posh init pwsh --config "$env:USERPROFILE\git\psprofile\m365princess.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\di4am0nd.omp.json" | Invoke-Expression
bgdc
