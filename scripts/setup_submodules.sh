git submodule update --init --recursive
git submodule foreach git pull origin master

TOP=$(git rev-parse --show-toplevel)
cd $TOP/submodules/command-t/ruby/command-t && ruby extconf.rb && make
cd $TOP/submodules/you-complete-me && ./install.py
cd $TOP/submodules/vimproc && make
cd $TOP
