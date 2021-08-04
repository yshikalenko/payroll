@echo off
if "%1" == "" goto defaultPort
mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=%1
:defaultPort
mvn spring-boot:run
