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

# ✅ Set environment variables for the bot
ENV API_ID=21602850 \
    API_HASH=a8042c2f4a4c3016f74207c38faf1195 \
    BOT_TOKEN=7959421986:AAEHRgoFFP9Uw7Vrml72GROsIC-UFOOVKpc \
    MONGO_DB_URI=mongodb+srv://Stormx:Darkboy336%401234@cluster0.jmjpvmg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0 \
    LOGGER_ID=-1003188854281 \
    OWNER_ID=8306709243 \
    STRING_SESSION=1BVtsOHUBu67gC39XHzZ6jqhjGgo_FoB01tzD-D6wsgkzYG960PqEG1uxS4PuqRRQg0_LsE2mphoV0-EWNTShZxg6-Zok_VUqOvx9Mks0fkFZIHGqMPuif8Kek__jbygo7Z5ukzATIl8eiq8ckxePpifCh85tbl5TlTWs-U6AsyyyVPUvkjXQobt1eRJmwOXfMPMF0cmMaGj4SGz2GAwx0W__154xl52IDHkwQBnDKbtRpy5OR_owKZfYoFCttjdv5k6E9GNu3vnxTMh5kQ7kMzlzg3pFzZ_5vecMz1mGCL34IxdmiEDkR3i0Z9VAawkYUzHiOLNhU8-GJUsAKjfJz7N9WGG1Hx4=
# Run the bot
CMD ["python3", "-m", "BrandrdXMusic"]
