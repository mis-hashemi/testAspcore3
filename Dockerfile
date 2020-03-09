FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-nanoserver-1809 AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o /publish

WORKDIR /publish
COPY . .
ENTRYPOINT ["dotnet", "myapp.dll"]