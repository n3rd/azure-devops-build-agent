# escape=`

ARG VERSION=latest
FROM n3rd/azure-devops-build-agent-base:$VERSION

# install .NET Framework components
RUN choco install dotnetfx --version 4.7.2.20180712 -y; `
    if ($LASTEXITCODE -eq 3010) { exit 0 }
RUN choco install microsoft-build-tools  15.0.26320.2 -y; `
    choco install dotnet4.6-targetpack --version 4.6.00081.20150925 -y; `
    choco install netfx-4.7.2-devpack --version 4.7.2.20180712 -y; `
    choco install netfx-4.6.2-devpack --version 4.6.01590.20170129 -y; `
    choco install netfx-4.5.2-devpack --version 4.5.5165101.20180721 -y; `
    choco install windows-sdk-8.0 --version 8.59.29750.0 -y; `
    if ($LASTEXITCODE -eq 3010) { exit 0 }
RUN choco install visualstudio2017-workload-webbuildtools --version 1.3.1 -y --ignore-dependencies
    
# Install .NET Fx 3.5
# requirement for wixtoolset
RUN $ErrorActionPreference = 'Stop'; `
    $ProgressPreference = 'SilentlyContinue'; `
    Invoke-WebRequest `
        -UseBasicParsing `
        -Uri "https://dotnetbinaries.blob.core.windows.net/dockerassets/microsoft-windows-netfx3-1803.zip" `
        -OutFile microsoft-windows-netfx3.zip; `
    Expand-Archive microsoft-windows-netfx3.zip; `
    Remove-Item -Force microsoft-windows-netfx3.zip; `
    Add-WindowsPackage -Online -PackagePath .\microsoft-windows-netfx3\microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab; `
    Remove-Item -Force -Recurse microsoft-windows-netfx3

# install other components
RUN choco install wixtoolset --version 3.11.1 -y; `
    choco install python --version 3.6.6 -y; `
    choco install git --version 2.18.0 -y; `
    choco install git-lfs --version 2.4.2 -y; `
    choco install firefox --version 58.0.2 -y; `
    choco install selenium-gecko-driver --version 0.19.1.20171103 -y; `
    choco install nodejs-lts --version 8.11.4 -y; `
    choco install cmake --version 3.12.1 -y; `
    choco install dotnetcore-sdk --version 2.1.400 -y; `
    choco install typescript --version 3.0.1 -y; `
    choco install webdeploy --version 3.6.20170627 -y; `
    choco install sqllocaldb --version 14.0.1000.169 -y; `
    choco install 7zip.install --version 18.5.0.20180730 -y; `
    choco install gitversion.portable --version 4.0.0 -y; `
    choco install docker-compose --version 1.23.0 -y; `
    choco install jdk8 --version 8.0.191 -y; `
    choco install ant --version 1.10.5 -y -i; `
    choco install maven --version 3.6.0 -y -i; `
    choco install gradle --version 4.10.2 -y; `
    choco install visualstudio2017testagent --version 15.9.1.0 -y; `
    choco install webpicmd --version 7.1.50430.20141001 -y; `
# only the latest version of chrome is officially available
RUN choco install googlechrome --ignore-checksum -y; `
    choco install selenium-chrome-driver -y

RUN npm install -g gulp-cli; `
    npm install -g grunt-cli; `
    npm install -g cordova; `
    npm install -g yarn
