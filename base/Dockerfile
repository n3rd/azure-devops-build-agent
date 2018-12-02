# escape=`

ARG VERSION=latest
FROM microsoft/windowsservercore:$VERSION
SHELL ["powershell"]

# install chocolatey
ENV chocolateyUseWindowsCompression false
ENV chocolateyVersion 0.10.11
RUN Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# install vsts agent
RUN $ErrorActionPreference = 'Stop'; `
    Invoke-WebRequest -Method Get -Uri https://vstsagentpackage.azureedge.net/agent/2.141.1/vsts-agent-win-x64-2.141.1.zip -OutFile C:\agent.zip ; `
    Expand-Archive -Path C:\agent.zip -DestinationPath C:\BuildAgent ; `
    Remove-Item C:\agent.zip -Force

WORKDIR C:\BuildAgent
COPY .\Start.* .\

CMD ["Start.cmd"]