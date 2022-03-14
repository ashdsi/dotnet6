#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-arm64v8 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY ["Graviton/Graviton.csproj", "Graviton/"]
RUN dotnet restore "Graviton/Graviton.csproj"
COPY . .
WORKDIR "/src/Graviton"
RUN dotnet build "Graviton.csproj" -c Release -o /app/build -r linux-musl-arm64 --self-contained false --no-restore


FROM build AS publish
RUN dotnet publish "Graviton.csproj" -c Release -o /app/publish -r linux-musl-arm64 --self-contained false --no-restore

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Graviton.dll"]