@echo off
mode 60,20
echo Pinger v1 - Logger
echo This window will send logs to /pingdata/pingresults.pngr
echo It is useful to see stats even after the pings are done.
echo Make sure you delete the pingdata folder if you want to
echo clear the log/result file. The_Semikon43 wishes you fun
echo pinging your websites and other IPs!
cd ..
md log
cd log
ping 152.26.89.248 -l 1000 -n 700>>pingresults.pngr
echo =====================================================================>>pingresults.pngr
exit
