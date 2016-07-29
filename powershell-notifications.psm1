Gci "$PSScriptRoot\*.ps1" | ForEach-Object {. $_.FullName}

Export-ModuleMember -Function *
Export-ModuleMember -Variable *