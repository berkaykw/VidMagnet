@echo off
REM Proje dizinine geç
cd /d %~dp0

REM Sanal ortamı aktive et
call venv\Scripts\activate.bat

REM FastAPI sunucusunu başlat
uvicorn main:app --reload --host 0.0.0.0

REM Kapatma komutu bekle
pause
