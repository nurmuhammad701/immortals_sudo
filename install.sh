   #!/bin/bash

   set -e

   echo "Immortals CLI vositalarini o'rnatish boshlanmoqda..."

   # Go'ni tekshirish va o'rnatish
   if ! command -v go &> /dev/null; then
       echo "Go o'rnatilmagan. O'rnatilmoqda..."
       sudo apt-get update
       sudo apt-get install -y golang
   fi

   # Loyihani yuklab olish va kompilyatsiya qilish
   echo "Manba kodini yuklab olish va kompilyatsiya qilish..."
   go install github.com/sizning-username/sizning-repo@latest

   # Binarni /usr/local/bin ga ko'chirish
   echo "Binarni tizim katalogiga ko'chirish..."
   sudo mv ~/go/bin/sizning-repo /usr/local/bin/immortals

   echo "Immortals muvaffaqiyatli o'rnatildi!"
   echo "Quyidagi buyruqlar bilan ishlatishingiz mumkin: 'immortals todo' va 'immortals currency'"