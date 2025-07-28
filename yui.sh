#!/bin/bash
echo "📦 Menginstal dependensi..."
apt-get update -y && apt-get install -y screen wget tar git

echo "📁 Setup skrip mining..."
cat <<'EOF' > /root/sugar.sh
#!/bin/bash
cd /root || exit
[ ! -d new ] && git clone https://github.com/amirul5656/new.git
cd new && chmod +x unmi

if ! screen -list | grep -q amirul3; then
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./unmi --algorithm randomx --pool rx.unmineable.com:80 -u LTC:ltc1q682mxnytl67x3gdw8eezxpuq4pehz5qhax4ls5.amirul
      sleep 2
    done
  '
else
  echo "⚠️  Mining sudah berjalan di screen 'amirul3'."
fi
EOF
