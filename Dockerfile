FROM mcr.microsoft.com/windows/nanoserver:1809 as stage1

USER ContainerAdministrator

ADD https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe 'C:\\cloudflared.exe'

ENTRYPOINT ["C:\\cloudflared.exe", "--no-autoupdate"]