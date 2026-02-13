FROM python:3.11-slim-bookworm
RUN python -m pip install --upgrade --no-cache-dir pip \
 && python -m pip install --upgrade --no-cache-dir --force-reinstall wheel==0.46.2 \
 && python -m pip install --upgrade --no-cache-dir --force-reinstall jaraco.context==6.1.0
 
WORKDIR /app

RUN apt-get update \
 && apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/*
#RUN pip install --no-cache-dir --upgrade pip wheel
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# this line is key for pytest imports
ENV PYTHONPATH=/app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
