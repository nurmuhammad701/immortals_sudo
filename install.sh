#!/bin/bash

set -e

echo "Immortals CLI vositalarini o'rnatish boshlanmoqda..."

# Go'ni tekshirish va o'rnatish
if ! command -v go &> /dev/null; then
    echo "Go o'rnatilmagan. O'rnatilmoqda..."
    apt-get update
    apt-get install -y golang
fi

# Loyihani yuklab olish
echo "Manba kodini yuklab olish..."
git clone https://github.com/nurmuhammad701/immortals_sudo.git
cd immortals_sudo

# Currency va Todo dasturlarini alohida build qilish
echo "Currency dasturini build qilish..."
go build -o currency ./Currency
echo "Todo dasturini build qilish..."
go build -o todo ./todos

# Binarlarni /usr/local/bin ga ko'chirish
echo "Binarlarni tizim katalogiga ko'chirish..."
install -m 755 currency /usr/local/bin/immortals-currency
install -m 755 todo /usr/local/bin/immortals-todo

# Asosiy immortals buyrug'ini yaratish
echo '#!/bin/bash
case $1 in
  "currency") shift; immortals-currency "$@" ;;
  "todo") shift; immortals-todo "$@" ;;
  *) echo "Noto'g'ri buyruq. 'currency' yoki 'todo' dan foydalaning." ;;
esac' > immortals
install -m 755 immortals /usr/local/bin/immortals

echo "Immortals muvaffaqiyatli o'rnatildi!"
echo "Quyidagi buyruqlar bilan ishlatishingiz mumkin: 'immortals todo' va 'immortals currency'"

# O'rnatish papkasini tozalash
cd ..
rm -rf immortals_sudo