@echo off
cd /d %~dp0

REM Sanal ortam var mı kontrol et, yoksa oluştur
if not exist "venv\Scripts\activate.bat" (
    echo Sanal ortam bulunamadi. Olusturuluyor...
    python -m venv venv
)

call venv\Scripts\activate.bat

REM Gerekli paketler yuklu mu kontrol et
pip show fastapi >nul 2>&1
if errorlevel 1 (
    echo Gerekli paketler yukleniyor...
    pip install fastapi uvicorn yt-dlp
)

REM Backend server baslatiliyor
uvicorn main:app --reload

pause
