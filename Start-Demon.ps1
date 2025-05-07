function Write-OutputColour {
    [CmdletBinding()]
    param(
        # the colour to output the text as
        [Parameter(Mandatory=$true, Position=1)]
        [ValidateSet('Blue','Cyan', 'Green', 'Magenta', 'Red', 'Yellow')]
        [ValidateNotNullOrEmpty()]
        [string]$Colour,

        # the text for which the colour will be applied
        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]$String
    )

    switch($Colour) {
        "Blue"    { $printColour = "`e[34m" }
        "Cyan"    { $printColour = "`e[36m" }
        "Green"   { $printColour = "`e[32m" }
        "Magenta" { $printColour = "`e[35m" }
        "Red"     { $printColour = "`e[31m" }
        "Yellow"  { $printColour = "`e[33m" }
    }

    $newString = $String.Replace("`n", "`n${printColour}")

    Write-Output "${printColour}${newString}`e[0m"
}

$Host.Name

Write-OutputColour Blue "====================== Get-Variable ============================"
Get-Variable | ft
Write-OutputColour Blue "================== Get-ChildItem env: ==========================="
Get-ChildItem  env: | ft



function blah-blah-blah {
	Write-Host 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
	Write-Output 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
	Write-Host '##[error]- Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
}


$scriptName = $MyInvocation.MyCommand.Name
# $consoleWidth = [console]::WindowWidth
$consoleWidth = 137 # Set a default console width if needed
$message = " $scriptName entered "
$paddedMessage = $message.PadLeft(($consoleWidth + $message.Length) / 2, '-').PadRight($consoleWidth, '-')


$PSDefaultParameterValues

    Write-Host "##[group]Beginning of a group 1"

[string[]]$allColors = @(
	'Black', 
	'DarkGray',   'Gray',, 'White'	 
	'DarkBlue',   'Blue',
	'DarkCyan',   'Cyan', 
	'DarkGreen',  'Green', 
	'DarkYellow', 'Yellow',
	'DarkMagenta', 'Magenta', 
	'DarkRed', 'Red'	  
)

foreach ($color in $allColors) {
	$colorValue = [System.ConsoleColor]::Parse([System.ConsoleColor], $color.ToString())
	Write-Host $paddedMessage -ForegroundColor $colorValue
	blah-blah-blah
}
 Write-Host "##[endgroup]"
 
<#
Black
DarkBlue
DarkGreen
DarkCyan
DarkRed
DarkMagenta
DarkYellow
Gray
DarkGray
Blue
Green
Cyan
Red
Magenta
Yellow
White
#>

    Write-Host "##[group]Beginning of a group 2"
    Write-Host "##[warning]Warning message"
    Write-Host "##[error]Error message"
    Write-Host "##[section]Start of a section"
    Write-Host "##[debug]Debug text"
    Write-Host "##[command]Command-line being run"
    Write-Host "##[endgroup]"


Write-OutputColour Cyan "`nHi`nI can haz output? 😺"
Write-OutputColour Blue "###############################################################"
Write-OutputColour Yellow "                    I can haz output? 😺"
Write-OutputColour Blue "###############################################################"
Write-OutputColour Cyan "###############################################################"
Write-OutputColour Green "###############################################################"
Write-OutputColour Magenta "###############################################################"
Write-OutputColour Red "###############################################################"
Write-OutputColour Yellow "###############################################################"


<# 

Write-Host "##[section]Get-AzSubscription"
Get-AzSubscription

#get-PSResource  -ErrorAction Continue
az upgrade
Get-InstalledModule -Name Az* -ErrorAction Continue
#Update-PSResource Az -Scope AllUsers -Force

Write-Host "##[section] New-AzSubscriptionDeploymentStack "
# New-AzSubscriptionDeploymentStack -Name 'dep-devops-test-cicd' -Location 'australiaeast' -ActionOnUnmanage DeleteAll -DenySettingsMode None -TemplateFile .\main.bicep   -WhatIf 
New-AzSubscriptionDeployment -Name 'dep-devops-test-cicd' -Location 'australiaeast' -TemplateFile .\main.bicep   -WhatIf 



Write-Host "##[section] $res = New-AzSubscriptionDeploymentStack "
#$res = New-AzSubscriptionDeploymentStack -Name 'dep-devops-test-cicd' -Location 'australiaeast'  -ActionOnUnmanage DeleteAll -DenySettingsMode None   -TemplateFile .\main.bicep  -WhatIf 
$res = New-AzSubscriptionDeployment -Name 'dep-devops-test-cicd' -Location 'australiaeast' -TemplateFile .\main.bicep   -WhatIf 

Write-Host "##[section] res -replace"

$res `
    -replace "\[38;5;208m", "[31m" `
    -replace "\[38;5;77m" , "[32m" `
    -replace "\[38;5;141m", "[33m" `
    -replace "\[38;5;246m", "[33m"

#>

#EOF  Start-Demon.ps1
