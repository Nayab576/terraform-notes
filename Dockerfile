FROM microsoft/aspnetcore-buld:6.0.302
WORKDIR /app
COPY . .
RUN dotnet build -c Release
ENTRYPOINT ["dotnet","run","--no-lauch-profile"]
