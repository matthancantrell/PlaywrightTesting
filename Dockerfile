FROM mcr.microsoft.com/playwright/dotnet:v1.42.0-jammy
WORKDIR /PlaywrightTests

COPY *.sln .
COPY *.csproj .
COPY Tests ./Tests

RUN dotnet build
RUN pwsh bin/Debug/net8.0/playwright.ps1 install --with-deps