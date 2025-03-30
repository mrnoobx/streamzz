FROM python:3.12-slim

WORKDIR /app
COPY . /app

RUN pip install -U pip uv && \
    uv pip install --system --no-cache-dir -r requirements.txt && \
    chmod +x surf-tg.sh

EXPOSE 8080

CMD ["bash", "surf-tg.sh"]
