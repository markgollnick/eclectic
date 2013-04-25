@echo off
rem electic.bat
rem @author Mark R. Gollnick <mark.r.gollnick@gmail.com>
rem @license Boost Software Licence v1.0 <http://www.boost.org/LICENSE_1_0.txt>
rem @date 2012 Apr 26, Thu, 06:34 PM CST
rem @desc Eclectic is to eclipse plugins as workspaces are to projects.
rem "Eclipse Configuration Loader Easily Changes The IDE Config," or
rem "Eclectic Can Let Eclipse Change The IDE Config"

set ECLECTIC_DIR=configs

if not exist %ECLECTIC_DIR% (
  mkdir %ECLECTIC_DIR%
)
goto:main

:eclipse_run
rem if not exist %ECLECTIC_DIR%\%ECLIPSE_CONF% (
rem   mkdir %ECLECTIC_DIR%\%ECLIPSE_CONF%
rem   start /wait xcopy "configuration" "%ECLECTIC_DIR%\%ECLIPSE_CONF%\" /E /Q /Y
rem )
start eclipsec.exe -clean -configuration %ECLECTIC_DIR%/%ECLIPSE_CONF%/configuration
goto:eof

:main
set ECLIPSE_CONF=%1
if /I "%ECLIPSE_CONF%" == "" (
  echo.ECLECTIC.BAT
  echo.Eclectic Can Let Eclipse Change The IDE Config
  echo.
  echo.Specify a configuration name, or press CTRL + C to cancel.
  echo.
  for /F "usebackq delims=" %%d in (`dir /B %ECLECTIC_DIR%`) do (
    echo.  %%~nd
  )
  echo.
  set /P ECLIPSE_CONF=
)
if /I not "%ECLIPSE_CONF%" == "" (
  goto:eclipse_run
)
