@echo on
echo.
echo MySQL Data Import

echo *****************************
echo.
echo Date: %date%
echo Time: %time%
echo.
echo *****************************

set CUR_DIR=%cd%

set path="%CUR_DIR%\gdoj_struct.sql"

D:\mysql\bin\mysql -uroot -prootpwd gdoj < %path%

echo.:P

echo MySQL Import successfully...

echo.:P
echo.

pause>nul