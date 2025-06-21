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
    
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

@app.post("/download")
async def download_videos(data: VideoRequest):
    tasks = [download_video(url, data.audio_only) for url in data.url_list]
    await asyncio.gather(*tasks)
    return {"message": "İndirme işlemi başlatıldı"}
