#!/bin/sh

echo "\n* Generating Ruby 2.0.0 tags file in ~/.vim/tags/ - OK?"
read
RUBY2='/Users/blue/.rbenv/versions/2.0.0-p247/lib/ruby/2.0.0'
ctags-exuberant -f ~/.vim/tags/ruby2.0.0.tags \
  -h \".rb\" -R \
  --exclude=\"\.svn\" \
  --exclude=\"\.git\" \
  --exclude=\"\.hg\" \
  --totals=yes \
  --tag-relative=yes \
  "$RUBY2"

echo "\n\n* Generating Python 3.3 tags file in ~/.vim/tags/ - OK?"
read
PYTHON3='/Library/Frameworks/Python.framework/Versions/3.3/lib'
ctags-exuberant -f ~/.vim/tags/python3.3.tags \
  -h \".py\" -R \
  --exclude=\"\.svn\" \
  --exclude=\"\.git\" \
  --exclude=\"\.hg\" \
  --totals=yes \
  --tag-relative=yes \
  "$PYTHON3"

echo "\n\n* Generating PHP 5.4.10 tags file in ~/.vim/tags/ - OK?"
read
PHP54='/Applications/MAMP/bin/php/php5.4.10/lib/php'
phpctags -f ~/.vim/tags/php5.4.10.tags -R "$PHP54"

#ctags-exuberant -f ~/.vim/tags/frameworks/php5.4.10.tags \
  #-h \".php\" -R \
  #--exclude=\"\.svn\" \
  #--exclude=\"\.git\" \
  #--exclude=\"\.hg\" \
  #--totals=yes \
  #--tag-relative=yes \
  #--PHP-kinds=+cf \
  #--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
  #--regex-PHP='/interface ([^ ]*)/\1/c/' \
  #--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \
  #"$PHP54"
