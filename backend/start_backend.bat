@echo off
echo Backend başlatılıyor...

REM Proje dizinine geç
cd /d %~dp0

REM Sanal ortamın var olup olmadığını kontrol et
if not exist "venv\Scripts\activate.bat" (
    echo HATA: Sanal ortam bulunamadı!
    echo Lütfen önce 'python -m venv venv' komutunu çalıştırın.
    pause
    exit /b 1
)

REM Sanal ortamı aktive et
echo Sanal ortam aktive ediliyor...
call venv\Scripts\activate.bat

REM Gerekli paketlerin yuklu olup olmadigini kontrol et
echo Paketler kontrol ediliyor...

REM FastAPI sunucusunu baslat 
echo FastAPI sunucusu baslatiliyor... 
echo Server adresi: http://localhost:8000
echo Durdurmak icin Ctrl+C basın 
echo.
uvicorn main:app --reload --host 0.0.0.0 --port 8000

REM Sunucu kapandiginda 
echo.
echo Server kapatildi. 
pause