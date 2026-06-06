FROM python:3.12-slim

WORKDIR /app

# System dependencies install කරගැනීම
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt copy කර dependencies install කිරීම
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# මුළු project එකම copy කිරීම
COPY . .

# ඔයාගේ server එක run වෙන port එක (උදා: 8000)
EXPOSE 8000

# Server එක run කරන command එක (ඔයාගේ ප්‍රධාන python file එක app.py නම්)
CMD ["python", "app.py"]