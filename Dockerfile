FROM microsoft/dotnet:6.0.302-sdk AS build
WORKDIR /App
COPY *.csproj ./
# RUN dotnet restore
COPY . ./
EXPOSE 9090
ENTRYPOINT ["dotnet", "RUN"]
