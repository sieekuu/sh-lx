#!/bin/bash

# Sprawdzenie uprawnień root
if [ "$EUID" -ne 0 ]; then
  echo "Uruchom skrypt jako root (sudo ./skrypt.sh)"
  exit 1
fi

echo "=== Aktualizacja systemu ==="

# Aktualizacja listy pakietów
apt update

# Pełna aktualizacja systemu
apt upgrade -y

# Usunięcie niepotrzebnych pakietów
apt autoremove -y
apt autoclean

echo "Aktualizacja systemu zakończona"

echo ""
echo "=== Włączanie logowania SSH dla użytkownika root ==="

# Backup oryginalnej konfiguracji SSH
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Zmiana konfiguracji SSH - włączenie logowania root
if grep -q "^PermitRootLogin" /etc/ssh/sshd_config; then
  sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
else
  echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi

# Restart usługi SSH
systemctl restart ssh || systemctl restart sshd

echo "Logowanie SSH dla root zostało włączone"

echo ""
echo "=== Instalacja Dockera ==="

# Instalacja Dockera przez oficjalny skrypt
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Uruchomienie i włączenie Docker przy starcie systemu
systemctl start docker
systemctl enable docker

# Sprawdzenie wersji
docker --version

# Czyszczenie
rm get-docker.sh

echo ""
echo "=== Instalacja zakończona ==="
echo "System został zaktualizowany"
echo "Docker został zainstalowany i uruchomiony"
echo "SSH root login został włączony"
