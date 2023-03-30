FROM python:3.8-alpine

ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

# best method: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apk --no-cache add ffmpeg

# Uncomment these commands for easy restarts during development instead of
# having to do a full rebuild every time you make a change.
RUN mkdir -p /code/bot /code/config
VOLUME ./bot:/code/bot
VOLUME ./config:/code/config

WORKDIR /code

COPY requirements.txt /code/

RUN pip3 install --no-cache-dir -r requirements.txt

ADD . /code

CMD ["bash"]
