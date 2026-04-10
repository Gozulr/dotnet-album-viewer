
FROM mcr.microsoft.com/dotnet/sdk:2.1 AS builder

WORKDIR /album-viewer

COPY AlbumViewerNetCore.sln ./
COPY src/AlbumViewerNetCore/AlbumViewerNetCore.csproj src/AlbumViewerNetCore/
COPY src/AlbumViewerBusiness/AlbumViewerBusiness.csproj src/AlbumViewerBusiness/
COPY src/Westwind.Utilities/Westwind.Utilities.csproj src/Westwind.Utilities/

RUN dotnet restore src/AlbumViewerNetCore/AlbumViewerNetCore.csproj

COPY src/ src/

RUN dotnet publish ./src/AlbumViewerNetCore/AlbumViewerNetCore.csproj -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:2.1

WORKDIR /album-viewer
COPY --from=builder /out ./

ENTRYPOINT ["dotnet", "AlbumViewerNetCore.dll"]