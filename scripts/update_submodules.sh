TOP=$(git rev-parse --show-toplevel)
git submodule foreach git pull origin master

$TOP/scripts/setup_submodules.sh
