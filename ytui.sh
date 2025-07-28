#!/bin/bash

# Nama acak untuk screen (agar worker unik)
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Update dan pasang dependensi
apt update -y && apt install -y git screen

# Pindah ke root
cd /root || exit 1

# Clone repo kamu kalau belum ada
if [ ! -d "new" ]; then
  git clone https://github.com/amirul5656/new.git
fi

cd new || exit 1

# Izin eksekusi
chmod +x unmi

# Jalankan mining di dalam screen
screen -dmS "$RAND_NAME" ./unmi --algorithm m7m --pool stratum+tcp://m7m.sea.mine.zpool.ca:6033 -u 9P124xJj1Sq9HgPemLcxLdBxSKn2WYUQ5Q -p c=XMG,zap=XMG

# Info tampilan
echo "🚀 Mining dimulai di screen: $RAND_NAME"
echo "👀 Untuk lihat: screen -r $RAND_NAME"
