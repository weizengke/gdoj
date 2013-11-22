@echo off
echo.
echo MySQL Data Export

echo *****************************
echo.
echo Date: %date%
echo Time: %time%
echo.
echo *****************************


set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"

set dir="D:\oj\mysql_bak"

md %dir%

set bakFileName=gdoj_bak_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

D:\mysql\bin\mysqldump -d -hlocalhost -P3306 -uroot -prootpwd --default-character-set=gbk gdoj >"%dir%\%bakFileName%.sql"

echo.:P

echo MySQL Export Successfully...

echo.:P
echo.