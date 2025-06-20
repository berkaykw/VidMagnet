from fastapi import FastAPI
from pydantic import BaseModel
import yt_dlp
import asyncio

app = FastAPI()

class VideoRequest(BaseModel):
    url_list: list[str]

async def download_video(url: str):
    ydl_opts = {
        'outtmpl': 'downloads/%(title)s.%(ext)s',
    }
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

@app.post("/download")
async def download_videos(data: VideoRequest):
    tasks = [download_video(url) for url in data.url_list]
    await asyncio.gather(*tasks)
    return {"message": "İndirme işlemi başlatıldı"}
