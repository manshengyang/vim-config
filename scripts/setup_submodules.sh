git submodule update --init --recursive
git submodule foreach git pull origin master

TOP=$(git rev-parse --show-toplevel)
# compile command+t
cd $TOP
cd ./submodules/command-t/ruby/command-t && ruby extconf.rb && make
cd $TOP
cd ./submodules/you-complete-me && ./install.sh
cd $TOP
