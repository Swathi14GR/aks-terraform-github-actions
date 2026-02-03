FROM python:3.12-slim

WORKDIR /app

COPY app/ /app/

RUN pip install --no-cache-dir fastapi uvicorn pytest httpx

CMD ["pytest", "tests"]
