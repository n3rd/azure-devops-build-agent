ARG VERSION=latest
FROM n3rd/vsts-build-agent-base:$VERSION

# install .NET Framework components
RUN choco install microsoft-build-tools --version 14.0.25420.1 -y
RUN choco install netfx-4.5.1-devpack --version 4.5.50932 -y
RUN choco install netfx-4.5.2-devpack --version 4.5.5165101.20180721 -y
RUN choco install netfx-4.6.1-devpack --version 4.6.01055.00 -y

# Install .NET Fx 3.5
# requirement for wixtoolset
RUN powershell -Command \
        $ErrorActionPreference = 'Stop'; \
        $ProgressPreference = 'SilentlyContinue'; \
        Invoke-WebRequest \
            -UseBasicParsing \
            -Uri "https://dotnetbinaries.blob.core.windows.net/dockerassets/microsoft-windows-netfx3-1803.zip" \
            -OutFile microsoft-windows-netfx3.zip; \
        Expand-Archive microsoft-windows-netfx3.zip; \
        Remove-Item -Force microsoft-windows-netfx3.zip; \
        Add-WindowsPackage -Online -PackagePath .\microsoft-windows-netfx3\microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab; \
        Remove-Item -Force -Recurse microsoft-windows-netfx3

# install other components
RUN choco install cmake --version 3.7.2 -y
RUN choco install git --version 2.14.1 -y
RUN choco install nodejs --version 6.11.5 -y
RUN choco install typescript --version 2.5.3 -y
RUN choco install wixtoolset --version 3.11.1 -y
RUN choco install webdeploy --version 3.6.20170627 -y
RUN choco install sqllocaldb --version 14.0.1000.169 -y
RUN choco install 7zip.install --version 18.5.0.20180730 -y
RUN choco install gitversion.portable --version 4.0.0 -y
RUN choco install docker-compose --version 1.23.0 -y
RUN choco install jdk8 --version 8.0.191 -y
RUN choco install ant --version 1.10.5 -y -i
RUN choco install maven --version 3.6.0 -y -i
RUN choco install gradle --version 4.10.2 -y
RUN choco install visualstudio2015testagents --version 14.0.25420.1 -y
RUN choco install webpicmd --version 7.1.50430.20141001 -y

RUN npm install -g gulp-cli && \
    npm install -g grunt-cli && \
    npm install -g cordova && \
    npm install -g yarn

# install Visual Studio 2015 Isolated Shell 
RUN powershell -Command \
   Invoke-WebRequest -Uri "http://go.microsoft.com/fwlink/?LinkId=615451" -OutFile "C:\vs_isoshell.exe"; \
   $p = Start-Process -Wait -PassThru -FilePath "C:\vs_isoshell.exe" -ArgumentList '/Q /S'; \
   if ($p.ExitCode -ne 0) { throw ('Install failed with exit code 0x{0:x}' -f $p.ExitCode) }; \
   Remove-Item -Path "C:\vs_isoshell.exe" -Force