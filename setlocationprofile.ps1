<#
.SYNOPSIS
 Sets the current working location to a specified location.
.DESCRIPTION
 Sets the working location to a specified location.
 Default location to set $Profile.
.NOTES
 PowerShell over version 6.2 added support for `-` and `+` as a values for the Path parameter.
.PARAMETER Path
 Path for set-location.(default $Profile)
.PARAMETER LiteralPath
 LiteralPath for set-location.
.PARAMETER StackName
 StackName for set-location.
.PARAMETER PassThru
 PassThru for set-location.
.EXAMPLE
 PS >setlocationprofile.ps1
.EXAMPLE
 PS >setlocationprofile.ps1 -Path C:\Windows\
#>
[CmdletBinding(DefaultParameterSetName = "Path")]
param (
	[Parameter(ValueFromPipeline = $true, ValueFromPipeLineByPropertyName = $true, Position = 0, ParameterSetName = "Path")]
	[String] $Path,
	[Parameter(Mandatory = $true, ValueFromPipeLineByPropertyName = $true, ParameterSetName = "LiteralPath")]
	[String] $LiteralPath,
	[Parameter(ValueFromPipeLineByPropertyName = $true, ParameterSetName = "Stack")]
	[String] $StackName,
	[Switch] $PassThru
)
process {
	if ( $Path ) {
		Set-Location -Path $Path -PassThru:$PassThru
	}
	elseif ( $LiteralPath ) {
		Set-Location -LiteralPath $LiteralPath -PassThru:$PassThru
	}
	elseif ( $StackName ) {
		Set-Location -PassThru:$PassThru -StackName $StackName
	}
	else {
		Set-Location -Path $(Split-Path -Path $profile) -PassThru:$PassThru
	}
}
