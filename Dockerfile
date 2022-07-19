FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /App
COPY *.csproj ./
RUN dotnet restore
COPY ..
ENTRYPOINT ["dotnet", "RUN"]
