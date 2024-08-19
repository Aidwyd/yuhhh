@echo off
chcp 65001
title OutputLogger
cls
echo [40;37mOutputLogger made by [40;35mThe_Semikon43#6969[40;37m
echo.
echo Press any key to start logging...
pause>nul
cd utilities
cd dvcinfo
:logging
cls
type log.txt
ping /n 1 localhost>nul
goto logging