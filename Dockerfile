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
    STRING_SESSION=BQFJoiIAFPH8tazg7XnXXOSHydq1xtzH8862-t5e_5GhCqkfZf941KHuqtheyjXO9hKpfaHruXMTCHjHZEtBDwmMyM2Hc4EaTuG-p6c3RKdI3y4Dgw2wOlpNlswB5mooxm43KPQoNXXeyCtdxnUBg5ogwbyrSFQQ9DpID1HOKlRonKTjQRKTPMshtFgiqUXMRx1A7-JfeNPNFbyBDby66TUNdynbgaItmS0JnVjF2FUQMVQKYJvswbAgbcAELuQ0xsAqQ4E3DzAg1tikmag9OC83KYRVomT3EPs6y8w5JHnj2j2P0rUFpKYdNkizP9KTZLMoVqH-r3F3kR6Xs5gNWZy70CvhjAAAAAHo4-fxAA

# Run the bot
CMD ["python3", "-m", "BrandrdXMusic"]
