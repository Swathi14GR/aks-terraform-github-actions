FROM python:3.11-slim-bookworm

WORKDIR /app

RUN rm -rf /usr/lib/python3/dist-packages/wheel* \
           /usr/lib/python3/dist-packages/jaraco.context* \
 && pip install --no-cache-dir --upgrade wheel==0.46.2 jaraco.context==6.1.0

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# this line is key for pytest imports
ENV PYTHONPATH=/app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
