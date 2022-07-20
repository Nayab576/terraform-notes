FROM microsoft/dotnet:6.0.302-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./dotnetapp/
WORKDIR /app/dotnetapp
RUN dotnet restore

# copy and build everything else
WORKDIR /app/
COPY . ./dotnetapp/
WORKDIR /app/dotnetapp
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:6.0.302-runtime AS runtime
WORKDIR /app
COPY --from=build /app/dotnetapp/out ./
EXPOSE 9090
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
