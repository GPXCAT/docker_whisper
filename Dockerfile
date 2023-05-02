FROM python:3.10.11-slim-bullseye

# https://github.com/openai/whisper
RUN python3 -m pip install -U openai-whisper \
    && rm -rf /root/.cache

RUN apt-get update \
    && apt-get install -y ffmpeg \
    && rm -rf /var/lib/apt/list/*

ENTRYPOINT ["whisper"]
