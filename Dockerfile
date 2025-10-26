# Use a lightweight Python image
FROM python:3.10-slim-bullseye

# Install ffmpeg and git (needed for many music bots)
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/
WORKDIR /app/

# Upgrade pip and install dependencies
RUN python3 -m pip install --upgrade pip setuptools
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

# ✅ Environment variables (same old bot token, new working session)
ENV API_ID=21602850 \
    API_HASH=a8042c2f4a4c3016f74207c38faf1195 \
    BOT_TOKEN=7959421986:AAEHRgoFFP9Uw7Vrml72GROsIC-UFOOVKpc \
    MONGO_DB_URI=mongodb+srv://Stormx:Darkboy336%401234@cluster0.jmjpvmg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0 \
    LOGGER_ID=-1003188854281 \
    OWNER_ID=8306709243 \
    STRING_SESSION="BQFJoiIAjfua8I3rRmLKPuvjcOMEUv2dUkALCFLkDiHuF3KWukna4OlJAnwgM63pj36EqBmV72IaXQxQ_r-aW1oK_zOEMO2AEEabl3oT-ELu3P0E9JcBn-qng5vKA2e1auJe8leWC5NntEp3u5VQaCrLG9q3_ADu5yv-HahGVJycucVpBKSl4sDfxrQRYh8fVZKwznS2QlumYqJQ2QxoQMz_9uKVrSqqo86WROualW8JZm9OYtMY5I7NBhivER6JWAbqATpJzLAOn-pjY6BJg0HqPA7pzDICAc1b7cczeGBoUwJo90AJ7DAxGOMBV5JMNP6LEHMtfIZ7-ljUXkVu3zOeEPHskAAAAAHo4-fxAA"

# ✅ Clean old sessions before start & run bot
CMD ["sh", "-c", "rm -f /app/*.session /app/BrandrdXMusic/*.session && python3 -m BrandrdXMusic"]
