FROM python:3.11-slim

WORKDIR /app

# Install system dependencies + build essentials
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

EXPOSE 8080

# Set proper entrypoint
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
