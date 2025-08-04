# Stage 1 - Base runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Stage 2 - Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy project file and restore
COPY ["dotnet-store.csproj", "./"]
RUN dotnet restore "dotnet-store.csproj"

# Copy the rest of the app
COPY . .

# Build the project
RUN dotnet build "dotnet-store.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Stage 3 - Publish
FROM build AS publish
RUN dotnet publish "dotnet-store.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Stage 4 - Final runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Create non-root user
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Entry point
ENTRYPOINT ["dotnet", "dotnet-store.dll"]
