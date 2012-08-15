@echo off
for /f "delims=" %%i in ('cd') do set cwd=%%i
for %%X in (lua.exe) do (set FOUND=%%~$PATH:X)
if defined FOUND (
  set cmd="lua"
) else (
  for %%X in (luajit.exe) do (set FOUND=%%~$PATH:X)
  if defined FOUND (
    set cmd="luajit"
  )
)
if "%cmd%"=="" (
  echo "Busted requires that a valid execution environment be specified(or that you have lua or luajit accessible in your PATH). Aborting."
) else (
  pushd %~dp0 & (call %cmd% bootstrap.lua --cwd="%cwd%\\" %*) && popd
)
