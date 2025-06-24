from fastapi import FastAPI
from pydantic import BaseModel
import yt_dlp
import asyncio

app = FastAPI()

class VideoRequest(BaseModel):
    url_list: list[str]
    audio_only: bool = False

async def download_video(url: str, audio_only: bool):
    ydl_opts = {
        'outtmpl': 'downloads/%(title)s.%(ext)s',
        'hls_prefer_native': True,
        'merge_output_format': 'mp4',
    }

    if audio_only:
        ydl_opts.update({
            'format': 'bestaudio/best',
            'postprocessors': [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': 'mp3',
                'preferredquality': '192',
            }],
        })
    else:
        ydl_opts.update({
            'format': 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best',
            'postprocessors': [{
                'key': 'FFmpegVideoConvertor',
                'preferedformat': 'mp4',
            }],
        })

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

@app.post("/download")
async def download_videos(data: VideoRequest):
    tasks = [download_video(url, data.audio_only) for url in data.url_list]
    await asyncio.gather(*tasks)
    return {"message": "İndirme işlemi başlatıldı"}

@app.post("/info")
async def get_video_info(data: VideoRequest):
    url = data.url_list[0]
    ydl_opts = {
        'quiet': True,
        'skip_download': True,
        'format': 'best',
    }
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(url, download=False)
    return {
        "title": info.get("title"),
        "thumbnail": info.get("thumbnail"),
        "filesize": info.get("filesize") or info.get("filesize_approx"),
        "duration": info.get("duration"),
    }
