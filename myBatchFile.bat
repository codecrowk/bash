@echo off
title Apriendiendo de la Consolita
:: Variables
set infoAboutSystem=board\inventarioSistema.txt

:: Crear arbol directorios
set directorios=SO board NIC memoria disco pc 
(for %%a in (%directorios%) do ( 
   mkdir %%a 
))

:: 1. Crear archivo hora y fecha
:: No permixte ejecutar ambos comandos = set timeHour=time /t && date /t
date /t > board\time.txt
time /t >> board\time.txt

:8.: Current directory
cd > so\working_directory.txt

::3. Generar archivo ipconfig
ipconfig > NIC\dirIpLocal.txt

::10. Inventario del sistema
systeminfo > %infoAboutSystem%

::5. Generar archivo memoria
find "Cantidad total de memoria" %infoAboutSystem% > memoria\memoria.txt
findstr "Memoria virtual" %infoAboutSystem% >> memoria\memoria.txt

:: 7. Nombre maquina
whoami > pc\nombre.txt

::9. Listado susdirectorios
cls
echo Esto puede tardar un poco...
echo Haciendo un analisis de carpetas
tree C:/ > so\carpetas.txt

::11. Procesos activos
tasklist > procesos.txt
:: mover Archivo
move .\procesos.txt .\so


::6. Informacion sobre el disco
wmic logicaldisk get size, freespace, caption > disco\disco_duro.txt

::4. Estadisticas de conexion
echo Identificando estadisticas de red
netstat -a > NIC\conexion.txt

::2.  Sesiones
set directorioSesiones=so\sesiones.txt
query session > %directorioSesiones%
:: wmic USERACCOUNT get Caption, Name, Disabled, LocalAccount, Lockout, PasswordRequired > %directorioSesiones%
:: wmic /node:127.0.0.1 computersystem get userName, DomainRole, AdminPasswordStatus, Status, SystemType, Model, Domain, Description, CreationClassName >> %directorioSesiones%




pause
exit