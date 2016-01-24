@echo off
echo.
echo MySQL Data Import

echo *****************************
echo.
echo Date: %date%
echo Time: %time%
echo.
echo *****************************

set path="E:\gdoj\trunk\sql\gdoj_bak_2013051220734.sql"

D:\mysql\bin\mysql -uroot -prootpwd gdoj < %path%

echo.:P

echo MySQL Import successfully...

echo.:P
echo.

ping null