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
    STRING_SESSION="BQFJoiIAoRR3FC_PRobD5h4zzl9ubec2NO3S7TAZj-74Rr5cweylg0e4GJUiVrvZxU3FgqjigHf2pISM8w3Km-fP2EfNjDjAaOwazScW7COmVqShrNc1WV3mDaPY3igky_TEUP8FqZNiXMJe5Fi2lJyNQY7DAgZUGoHGJyTXIlPFM5x5hyvdm-vakhZSgTS8MWa7YkVbzAeAMFzR6tZAjFRduC35jy4zDUuR3aIYLA05jtxx3muUU6b5sZDrZNV7PrJztfWxVUKXe8tICrV7iTNq8mPYwyXo2b0h1QFCslkOSSOL5FwdsFW8MPW56pAoiZnVk1YaWNx-hc_t2NWXytCFJNMGygAAAAHuBV4iAA"

# ✅ Clean old sessions before start & run bot
CMD ["sh", "-c", "rm -f /app/*.session /app/BrandrdXMusic/*.session && python3 -m BrandrdXMusic"]
