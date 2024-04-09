BASE="https://raw.githubusercontent.com/lordeadroid/setup/main/nodejs"

FILES=(
  .eslintignore
  .eslintrc.js
  .gitignore
  .nycrc.json
  pre-commit
  setup.sh
  todo.yml
)

for FILE in $FILES
do
  URL=$BASE/$FILE
  curl -O $URL
done
