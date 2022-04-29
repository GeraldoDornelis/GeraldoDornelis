echo off

SET HOUR=%TIME:~0,2%
IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%
::Nome do Projeto
SET PROJETO=compactar
::Base de Dados que será feito backup:
SET PGDATABASE=citrino
:: Compactar Arquivos
cd c:
cd /
cd "C:\Program Files\7-Zip\"
7z.exe a -tzip "C:\temp\teste compactar\compactados\%PROJETO%_%PGDATABASE%_%date:~0,2%-%date:~3,2%-%date:~6,10%-%HOUR%-%time:~3,2%" "C:\temp\teste compactar\compactar\*"
:: Deleta arquivos a partir de 15 dias
ForFiles /p "C:\temp\teste compactar\compactar" /s /m *.* /c "cmd /c DEL @path" /d -15
exit
	