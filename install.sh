#!/bin/bash

set -e

echo "Immortals CLI vositalarini o'rnatish boshlanmoqda..."

# Go'ni tekshirish va o'rnatish
if ! command -v go &> /dev/null; then
    echo "Go o'rnatilmagan. O'rnatilmoqda..."
    apt-get update
    apt-get install -y golang
fi

# Loyihani yuklab olish va kompilyatsiya qilish
echo "Manba kodini yuklab olish va kompilyatsiya qilish..."
go install github.com/nurmuhammad701/immortals_sudo@latest

# Binarni /usr/local/bin ga ko'chirish
echo "Binarni tizim katalogiga ko'chirish..."
install -m 755 ~/go/bin/immortals_sudo /usr/local/bin/immortals

echo "Immortals muvaffaqiyatli o'rnatildi!"
echo "Quyidagi buyruqlar bilan ishlatishingiz mumkin: 'immortals todo' va 'immortals currency'"