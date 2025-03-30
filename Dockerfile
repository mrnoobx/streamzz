FROM python:3.11-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install -U pip uv
COPY requirements.txt .
RUN uv pip install --system --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "-m", "bot"]
