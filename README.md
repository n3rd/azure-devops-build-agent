# Scope

Provide a docker based windows build agent for asp.net applications without visual studio.

# How to use

Requires at minimum two environment variables:

* VSTS_ACCOUNT: the name of the Visual Studio account
* VSTS_TOKEN: a personal access token (PAT) for the Visual Studio account that has been given at least the Agent Pools (read, manage) scope.

```
docker run -d `
-e VSTS_ACCOUNT=<name> `
-e VSTS_TOKEN=<pat> `
n3rd/vsts-build-agent-201x:latest
```

To run the 2017 version with a custom agent name and pool name:

```
docker run -d `
-e VSTS_ACCOUNT=<name> `
-e VSTS_TOKEN=<pat> `
-e VSTS_AGENT="$env:COMPUTERNAME-agent" `
-e VSTS_POOL='docker-2017' `
n3rd/vsts-build-agent-2017:latest
```

# Notes

When using a VsTest task, please use the "Visual Studio Test Platform Installer" task first and for "Test platform version" choose "Installed by Tools Installer".