Getting ctags and autocompletion in vim is annoying but improving

* `brew install ctags-exuberant`
* `ctags --version` # should be 5.8+
* If not, then you might be using the native osx ctags
* to fix, put /usr/local/bin ahead of /usr/bin in $PATH
* or `ln -s /usr/bin/ctags-exuberant /usr/local/bin/ctags`
* `gem install ctags`
