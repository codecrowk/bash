@echo off
title Apriendiendo de la Consolita

:: Crear archivo hora y fecha
:: No permite ejecutar ambos comandos = set timeHour=time /t && date /t
date /t > time.txt
time /t >> time.txt

set directorios=SO board NIC memoria disco pc 
(for %%a in (%directorios%) do ( 
   echo %%a 
))

pause
exit
