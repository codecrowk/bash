@echo off
title Apriendiendo de la Consolita
:: Variables
set infoAboutSystem=board\inventarioSistema.txt

:: Crear arbol directorios
set directorios=SO board NIC memoria disco pc 
(for %%a in (%directorios%) do ( 
   mkdir %%a 
))

:: Crear archivo hora y fecha
:: No permixte ejecutar ambos comandos = set timeHour=time /t && date /t
date /t > board\time.txt
time /t >> board\time.txt

:: Current directory
cd > so\working_directory.txt

:: Generar archivo ipconfig
ipconfig > NIC\dirIpLocal.txt

:: Inventario del sistema
systeminfo > %infoAboutSystem%

:: Generar archivo memoria
find "Cantidad total de memoria" %infoAboutSystem% > memoria.txt
findstr "Memoria virtual" %infoAboutSystem% >> memoria.txt

:: Listado susdirectorios
cls
echo Esto puede tardar un poco...
echo Haciendo un analisis de carpetas
tree C:/ > carpetas.txt

:: Procesos activos
tasklist > procesos.txt

:: Informacion sobre el disco
wmic logicaldisk get size, freespace, caption > disco_duro.txt

:: Estadisticas de conexion
echo Identificando estadisticas de red
netstat -a > conexion.txt

:: Sesiones
query session > cuentas.txt
:: wmic USERACCOUNT get Caption, Name, Disabled, LocalAccount, Lockout, PasswordRequired > cuentas.txt
:: wmic /node:127.0.0.1 computersystem get userName, DomainRole, AdminPasswordStatus, Status, SystemType, Model, Domain, Description, CreationClassName >> cuentas.txt



pause
exit
