#! /bin/zsh

chmod u+x .git-hooks/pre-commit
cp .git-hooks/pre-commit .git/hooks

npm install
npm run test
npm run coverage
