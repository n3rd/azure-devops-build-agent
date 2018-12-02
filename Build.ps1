Param (
    [Parameter(Mandatory=$true)]
    [string]$serverCoreVersion,

    [Parameter(Mandatory=$true)]
    [string]$containerVersionSuffix,

    [switch]$build2015,
    [switch]$build2017
)

$containerVersion="$serverCoreVersion-$containerVersionSuffix"
Write-Host "Version is $containerVersion"

Write-Host "Building the base image ..."
Set-Location -Path "$PSScriptRoot\base"
docker build --build-arg VERSION=$serverCoreVersion -t n3rd/azure-devops-build-agent-base:$containerVersion -t n3rd/azure-devops-build-agent-base:latest .

if($build2015)
{
    Write-Host "Building the 2015 image ..."
    Set-Location -Path "$PSScriptRoot\2015"
    docker build --build-arg VERSION=$containerVersion -t n3rd/azure-devops-build-agent-2015:$containerVersion -t n3rd/azure-devops-build-agent-2015:latest .
}

if($build2017)
{
    Write-Host "Building the 2017 image ..."
    Set-Location -Path "$PSScriptRoot\2017"
    docker build --build-arg VERSION=$containerVersion -t n3rd/azure-devops-build-agent-2017:$containerVersion -t n3rd/azure-devops-build-agent-2017:latest .
}

Set-Location -Path "$PSScriptRoot"