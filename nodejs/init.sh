BASE="https://raw.githubusercontent.com/lordeadroid/setup/main/nodejs"

FILES=(
  .eslintignore
  .gitignore
  .c8rc.json
  eslint.config.js
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
npm install -sD c8
npm pkg set type="module"
npm pkg delete scripts.test
npm pkg set scripts.coverage="npx c8 npm test"
npm pkg set scripts.dev="node --watch main.js"
npm pkg set scripts.lint="eslint ."
npm pkg set scripts.setup="sh ./bin/setup.sh"
npm pkg set scripts.start="node main.js"
npm pkg set scripts.test="node --test"

echo "initializing setup"
mkdir bin
mv setup.sh bin/
sh bin/setup.sh
