@echo off
set PT=8080
set DPT=5005
set SD=n
if "%1" == "" goto defaultPort
set PT=%1
:defaultPort
if "%2" == "" goto defaultDPort
set DPT=%2
:defaultDPort
if "%3" == "" goto defaultSD
set SD=%3
:defaultSD
@echo you can specify arguments: serverPort debugPort suspendFlag, where last parameter may be y or n
call mvn package
java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=%DPT%,suspend=%SD% ^
       -Dserver.port=%1 -jar target/payroll-0.0.1-SNAPSHOT.jar
