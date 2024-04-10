BASE="https://raw.githubusercontent.com/lordeadroid/setup/main/nodejs"

FILES=(
  .eslintignore
  .eslintrc.js
  .gitignore
  .nycrc.json
  pre-commit
  setup.sh
  workflow.yml
)

for FILE in $FILES
do
  URL=$BASE/$FILE
  curl -O $URL
done

git init
mkdir .git-hooks
mv pre-commit .git-hooks/

mkdir -p .github/workflows
mv workflow.yml .github/workflows/

npm init -y
npm install --save-dev eslint
npm install --save-dev nyc

mkdir bin
mv setup.sh bin/
sh bin/setup.sh
