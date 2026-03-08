FROM python:3.11-slim

WORKDIR /app

COPY app ./app

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r app/requirements.txt

WORKDIR /app/app

EXPOSE 3010

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3010"]