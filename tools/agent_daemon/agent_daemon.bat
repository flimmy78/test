@echo off

set _task=vdservice.exe
set _svr="C:\Program Files (x86)\SPICE Guest Tools\64\vdservice.exe"
set _des=start_agent.bat

:checkstart
for /f "tokens=5" %%n in ('qprocess.exe *^| find "%_task%" ') do (
 if %%n==%_task% (goto checkag) else goto startsvr
)

 

:startsvr
echo %time% 
echo ********����ʼ����********
echo �������������� %time% ,����ϵͳ��־ >> restart_service.txt
echo start %_svr% > %_des%
echo exit >> %_des%
net start vdservice
set/p=.<nul
for /L %%i in (1 1 10) do set /p a=.<nul&ping.exe /n 2 127.0.0.1>nul
echo .
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs 
cscript //b //nologo %tmp%\delay.vbs 1000 
del %_des% /Q
echo ********�����������********
goto checkstart


:checkag
echo %time% ������������,3���������.. 
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs 
cscript //b //nologo %tmp%\delay.vbs 3000 
goto checkstart