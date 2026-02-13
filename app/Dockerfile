FROM python:3.11-slim-bookworm

WORKDIR /app

RUN apt-get update \
 && apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip wheel
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# this line is key for pytest imports
ENV PYTHONPATH=/app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]