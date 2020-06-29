@echo off

cls

cd C:\Program Files\MySQL\mysql-8.0.19-winx64\bin


set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%


mysqldump -uroot -p medical_database customers> "%cd%\customers_backup_%date%__%CUR_HH%-%CUR_NN%-%CUR_SS%.sql"