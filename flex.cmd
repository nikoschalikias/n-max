if exist FLEX.txt del FLEX.txt
if exist .\FLEX  del /Q .\FLEX\*.*
md .\FLEX


7z.exe a -tzip  ODB.zip .\ODB\*.*

COPY .\deliverables\review.zip  .\FLEX
COPY .\deliverables\asm.zip  .\FLEX

copy .\gerber\gerberFiles.zip   .\FLEX
copy .\BOM\PurchaseList.xlsx   .\FLEX

if exist purchase.zip        copy purchase.zip   .\FLEX
if exist asm.zip             copy asm.zip   .\FLEX

if exist ODB.zip    copy ODB.zip  .\FLEX

del /Q *.*zip


:STEP_DATESTAMP
::
REM Setting Datestamp to YYYYMMDD
set v_datestampYYYY=%date:~6,4%
set v_datestampMM=%date:~3,2%
set v_datestampDD=%date:~0,2%
set v_datestamp=%v_datestampYYYY%%v_datestampMM%%v_datestampDD%
::
REM Setting Timestamp to HHMMSS
set HH=%time:~0,2%
:: ensure that hour is always 2 digits
if %HH%==0 set HH=00
if %HH%==1 set HH=01
if %HH%==2 set HH=02
if %HH%==3 set HH=03
if %HH%==4 set HH=04
if %HH%==5 set HH=05
if %HH%==6 set HH=06
if %HH%==7 set HH=07
if %HH%==8 set HH=08
if %HH%==9 set HH=09
set MM=%time:~3,2%
set SS=%time:~6,2%
set v_timestamp=%HH%%MM%%SS% 


7z.exe a -tzip  .\FLEX\FLEX_%1_%2_%v_datestamp%_%v_timestamp% .\FLEX\*.*


set dropbox=%userprofile%\dropbox
if exist %dropbox%\FLEX copy  .\FLEX\FLEX_*.*    "%dropbox%\PMD - Flextronics Share\DMR\3 PCB Files"


echo done > FLEX.txt


