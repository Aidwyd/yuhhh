@echo off
title Pinger v1.0 by The_Semikon43
mode 69,20
color 03
:home
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo  This program is intended to send a lot of pings to a specific IP
echo  adress or domain. Made by The_Semikon43, not made to harm others!
echo  Creator doesn't take any responsibility for damage done to anyone.
echo.
echo =====================================================================
echo.
echo Press any key to configure the pinger...
echo.
pause>nul
:init
cls
echo                               PINGER V1
echo =====================================================================
echo.
echo The setup will ask you some questions. Answer and press enter.
echo If you already configured the program in this session, you can press
echo enter without actually entering anything to keep the values from
echo before. Entering the wrong things (not numbers when requested, etc.)
echo could break the programs!
echo.
echo Which IP adress should be pinged?
set /p ip="Value:"
echo.
echo How many ping windows should be opened?
set /p amount="Value:"
echo.
echo How many pings per window (enter 0 for unlimited pings)?
set /p attacktime="Value:"
echo.
echo Which buffer size do you want to use (bytes)?
set /p buffersize="Value:"
:initdone
echo.
echo Values set. Are they correct?
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
echo Start pings, update information or tiny ping the IP [S/U/T]?
CHOICE /N /C:SUT /M "Value:"%1
IF ERRORLEVEL == 3 ping %ip% -n 1 && pause && goto initdone
IF ERRORLEVEL == 2 GOTO init
IF ERRORLEVEL == 1 GOTO pings
goto init
:pings
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Creating ping file...
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
if %attacktime% == 0 goto pingsnotime
md pingdata
cd pingdata
echo @echo off>pingfile.cmd
echo mode 60,20>>pingfile.cmd
echo echo Pinger v1 - Logger>>pingfile.cmd
echo echo This window will send logs to /pingdata/pingresults.pngr>>pingfile.cmd
echo echo It is useful to see stats even after the pings are done.>>pingfile.cmd
echo echo Make sure you delete the pingdata folder if you want to>>pingfile.cmd
echo echo clear the log/result file. The_Semikon43 wishes you fun>>pingfile.cmd
echo echo pinging your websites and other IPs!>>pingfile.cmd
echo cd ..>>pingfile.cmd
echo md log>>pingfile.cmd
echo cd log>>pingfile.cmd
echo ping %ip% -l %buffersize% -n %attacktime%^>^>pingresults^%random^%.pngr>>pingfile.cmd
echo echo =====================================================================^>^>pingresults.pngr>>pingfile.cmd
echo exit>>pingfile.cmd
echo @echo off>pingfileo.cmd
echo mode 20,1>>pingfileo.cmd
echo ping %ip% -l %buffersize% -n %attacktime%>>pingfileo.cmd
echo exit>>pingfileo.cmd
cd ..
goto pingsyestime
:pingsnotime
md pingdata
cd pingdata
echo @echo off>pingfile.cmd
echo mode 60,20>>pingfile.cmd
echo echo Pinger v1 - Logger>>pingfile.cmd
echo echo This window will send logs to /pingdata/pingresults.pngr>>pingfile.cmd
echo echo It is useful to see stats even after the pings are done.>>pingfile.cmd
echo echo Make sure you delete the pingdata folder if you want to>>pingfile.cmd
echo echo clear the log/result file. The_Semikon43 wishes you fun>>pingfile.cmd
echo echo pinging your websites and other IPs!>>pingfile.cmd
echo cd ..>>pingfile.cmd
echo md log>>pingfile.cmd
echo cd log>>pingfile.cmd
echo ping %ip% -l %buffersize% -t^>^>pingresults^%random^%.pngr>>pingfile.cmd
echo echo =====================================================================^>^>pingresults.pngr>>pingfile.cmd
echo exit>>pingfile.cmd
echo @echo off>pingfileo.cmd
echo mode 20,1>>pingfileo.cmd
echo ping %ip% -l %buffersize% -t>>pingfileo.cmd
echo exit>>pingfileo.cmd
cd ..
:pingsyestime
ping /n 1 localhost>nul
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Starting pings...
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
cd pingdata
FOR /L %%G IN (1,1,%amount%) DO start pingfileo.cmd
ping localhost -n 1>nul
start pingfile.cmd
cd ..
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Running...
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
if %attacktime% == 0 goto pingsnotime2
ping localhost -n %attacktime%>nul
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Finishing...
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
ping localhost -n 5>nul
goto finished
:pingsnotime2
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Running...
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
ping localhost -n 10>nul
goto pingsnotime2
:finished
cls
echo     _______ ___ __    _ _______ _______ ______      __   __ ____ 
echo    ^|       ^|   ^|  ^|  ^| ^|       ^|       ^|    _ ^|    ^|  ^| ^|  ^|    ^|
echo    ^|    _  ^|   ^|   ^|_^| ^|    ___^|    ___^|   ^| ^|^|    ^|  ^|_^|  ^|^|   ^|
echo    ^|   ^|_^| ^|   ^|       ^|   ^| __^|   ^|___^|   ^|_^|^|_   ^|       ^|^|   ^|
echo    ^|    ___^|   ^|  _    ^|   ^|^|  ^|    ___^|    __  ^|  ^|       ^|^|   ^|
echo    ^|   ^|   ^|   ^| ^| ^|   ^|   ^|_^| ^|   ^|___^|   ^|  ^| ^|   ^|     ^| ^|   ^|
echo    ^|___^|   ^|___^|_^|  ^|__^|_______^|_______^|___^|  ^|_^|    ^|___^|  ^|___^|
echo.
echo.
echo =====================================================================
echo.
echo Status: Finished!
echo.
echo IP:      %ip%
echo Amount:  %amount% windows
echo Time:    %attacktime% seconds
echo Buffer:  %buffersize% bytes
echo.
echo Start pings again, update information, tiny ping or exit [S/U/T/E]?
CHOICE /N /C:SUTE /M "Value:"%1
IF ERRORLEVEL == 4 exit
IF ERRORLEVEL == 3 ping %ip% -n 1 && pause && goto finished
IF ERRORLEVEL == 2 GOTO init
IF ERRORLEVEL == 1 GOTO pings
goto init