# VidMagnet

**VidMagnet**, YouTube, TikTok, Instagram gibi popüler video platformlarından çoklu video indirmenizi sağlayan çapraz platform bir uygulamadır.  
Backend Python FastAPI ile yazılmıştır, frontend ise Flutter kullanılarak geliştirilmiştir.

---

## Özellikler

- Çoklu video URL’si ile video indirme
- YouTube, TikTok, Instagram ve daha fazlasını destekler (yt-dlp desteklediği platformlar)
- Basit ve hızlı kullanıcı arayüzü (Flutter)
- Hızlı ve güvenilir backend (FastAPI + yt-dlp)

---

## Kurulum ve Çalıştırma

### Backend

1. Python 3.12+ yüklü olmalı  
2. Sanal ortam oluştur ve aktif et:  
   ```bash
   python -m venv venv
   .\venv\Scripts\activate  # Windows için
   source venv/bin/activate # Mac/Linux için
