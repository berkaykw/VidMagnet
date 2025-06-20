@echo off
cd /d %~dp0
call venv\Scripts\activate.bat
uvicorn main:app --reload
pause
