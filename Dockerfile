FROM mcr.microsoft.com/windows/nanoserver:1809 as stage1

USER ContainerAdministrator

ADD https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-windows-amd64.zip 'C:\cloudflared.zip'

RUN tar -xvf C:\cloudflared.zip

FROM mcr.microsoft.com/windows/nanoserver:1809

COPY --from=stage1 /cloudflared.exe /cloudflared.exe

ENTRYPOINT ["C:\\cloudflared.exe","--no-autoupdate"]