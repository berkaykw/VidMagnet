
![Screenshot_1](https://github.com/user-attachments/assets/c37e5aba-c80d-4466-82a2-ffdea634886d)

# VidMagnet

**VidMagnet**, kullanıcıların çeşitli video platformlarından video ve ses dosyalarını kolayca indirip kaydedebildiği çok platformlu bir uygulamadır.
Flutter ile geliştirilmiş kullanıcı arayüzü ve FastAPI tabanlı Python backend’i sayesinde yt-dlp ve FFmpeg kütüphanelerinin gücünden faydalanarak hızlı ve sorunsuz indirme işlemleri gerçekleştirir.

---

## Özellikler

- Video ve ses dosyası indirme (MP4 ve MP3 seçenekleri)
- Video bilgilerini (başlık, küçük resim, dosya boyutu) gösterme
- Kullanıcı dostu Flutter arayüzü
- FastAPI ile hızlı ve asenkron indirme işlemleri

##  Teknolojiler

- Flutter: Mobil ve masaüstü uygulama arayüzü
- FastAPI: Python backend, video indirme API'si
- yt-dlp: Video/ses indirme kütüphanesi
- FFmpeg: Video/ses işleme (postprocessing için)

### Backend Kurulum

1. **Python 3.8+ yüklü olduğundan emin olun.**

2. Proje klasöründe bir sanal ortam oluşturun ve aktif edin:

- Windows:
  ```bash
  python -m venv venv
  venv\Scripts\activate

Gerekli Python paketlerini yükleyin:  pip install fastapi uvicorn yt-dlp

-FFmpeg'i sisteminize kurun ve PATH ortam değişkenine ekleyin.

-Backend sunucusunu çalıştırın: uvicorn main:app --reload --host 0.0.0.0)

(Not: Android emülatör kullanıyorsanız API çağrılarında http://10.0.2.2:8000 adresini kullanmanız gerekmektedir.)



### Frontend Kurulum

1 . **Flutter SDK** kurulu olmalıdır. Eğer yüklü değilse, [Flutter resmi sitesinden](https://flutter.dev/docs/get-started/install) kurulum yapabilirsiniz.

2. Proje dizinine gidin ve bağımlılıkları yükleyin:

```bash
flutter pub get

Uygulamayı çalıştırın:

Android emülatör ya da fiziksel cihaz kullanıyorsanız:
flutter run
Web için : flutter run -d chrome

pubspec.yaml 

dependencies:
  cupertino_icons: ^1.0.8
  http: ^0.13.6
  provider: ^6.1.2
  animated_text_kit: ^4.2.3


      
