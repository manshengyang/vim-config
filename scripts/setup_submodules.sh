git submodule init
git submodule update
git submodule foreach git pull origin master

# compile command+t
cd "$(git rev-parse --show-toplevel)"
cd ./submodules/command-t/ruby/command-t && ruby extconf.rb && make
cd "$(git rev-parse --show-toplevel)"
