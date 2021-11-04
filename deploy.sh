set -e

# сборка
npm run build

# переход в каталог сборки
cd build

# если вы публикуете на пользовательский домен
# echo 'www.example.com' > CNAME

git config --global credential.helper store
echo 'https://$($env:access_token):x-oauth-basic@github.com`n' > "$HOME\.git-credentials"
git config --global user.email "a.shleyko@yandex.ru"
git config --global user.name "Alexandr Shleyko"

git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# если вы публикуете по адресу https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:dustyo-O/skypro-frontend-ci-cd-example.git master:gh-pages

cd -
