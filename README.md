@echo off

SET HOUR=%TIME:~0,2%

IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%
::Nome do Projeto

SET PROJETO=devall
::IP do Servidor do PostgreSQL:

SET PGHOST=10.100.246.52
::Porta de acesso ao PostgreSQL:

SET PGPORT=5060
::Base de Dados que será feito backup:

SET PGDATABASE=esmeralda
::Usuário da base de dados:

SET PGUSER=u_backup
::Senha da base de dados

SET PGPASSWORD=xxxxxxxxxxxxxxxxxxx
::Diretório de destino do arquivo de Backup:

SET DESTDIR=E:\Backup\Postgresql\dados\DEV\
:: Criar Log

SET LOG=E:\Backup\Postgresql\script\LOG
:: e-mail

SET EMAIL=geraldo.silva@defensoria.mg.def.br
::pg_dump.exe -F c -b -v -f %DESTDIR%_%PGDATABASE%.backup
pg_dump -F p -C -f %DESTDIR%%PROJETO%_%PGDATABASE%_%date:~0,2%-%date:~3,2%-%date:~6,10%-%HOUR%-%time:~3,2%.sql

blat.exe -attach "E:\Backup\Postgresql\script\LOG\Arquivos.txt" -p configsmtp -to %geraldo.silva@defensoria.mg.def.br% -subject BACKUP -body "O backup foi realizado com sucesso!" -server 192.168.1.200:25 -f %vismar.felix@defensoria.mg.def.br%

pause
