@echo off
echo.
echo MySQL Data Export

echo *****************************
echo.
echo Date: %date%
echo Time: %time%
echo.
echo *****************************

set CUR_DIR=%cd%

svn update

set bakFileName="%CUR_DIR%\gdoj_bak.sql"

D:\mysql\bin\mysqldump -hlocalhost -P3306 -uroot -prootpwd --default-character-set=gbk gdoj >"%bakFileName%"

echo.:P

echo MySQL Export Successfully...

echo.:P
echo.

pause>nul