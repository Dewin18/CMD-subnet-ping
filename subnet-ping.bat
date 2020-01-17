@echo off

SET count=0
SET on = 0
SET off = 0

SET /p subnet=Please enter subnet (e.g: 192.168.178): 

echo ##### ping scan started ####
:start
SET /a count=%count%+1

ping -n 1 -w 1000 %subnet%.%count% >nul  

IF %errorlevel%==0 (
	echo %subnet%.%count% UP
	SET /a on=%on%+1
)

IF %errorlevel%==1 (
	echo %subnet%.%count% DOWN
	SET /a off=%off%+1
)

IF %count%==254 goto finish

GOTO start

:finish 
echo ##### ping scan finished ####
echo %on% HOSTS ONLINE
echo %off% HOSTS OFFLINE

cmd /k