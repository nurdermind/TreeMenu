FROM python:3.9

WORKDIR /web/

COPY . /web

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install -r req.txt

CMD "./start.sh"