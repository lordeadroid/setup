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
  echo "adding $FILE"
  URL=$BASE/$FILE
  curl -sO $URL
done

echo "initializing git"
git init
mkdir .git-hooks
mv pre-commit .git-hooks/

echo "initializing github workflow"
mkdir -p .github/workflows
mv workflow.yml .github/workflows/

touch main.js

echo "initializing npm"
npm init -y
npm install -sD eslint
npm install -sD nyc

echo "initializing setup"
mkdir bin
mv setup.sh bin/
sh bin/setup.sh
