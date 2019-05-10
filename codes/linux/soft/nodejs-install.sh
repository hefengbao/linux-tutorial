#!/usr/bin/env bash

cat << EOF

###################################################################################
# 安装 Nodejs 脚本
# @system: 适用于所有 linux 发行版本。
# @author: Zhang Peng
###################################################################################

EOF

if [[ $# -lt 1 ]] || [[ $# -lt 2 ]];then
    echo "Usage: sh nodejs-install.sh [version] [path]"
    echo -e "Example: sh nodejs-install.sh 10.15.2 /opt/nodejs\n"
fi

version=10.15.2
if [[ -n $1 ]]; then
  version=$1
fi

. ~/.nvm/nvm.sh
nvm --version
execode=$?
if [[ ${execode} != 0 ]]; then
  echo -e "\n>>>>>>>>> install nvm"
  rm -rf ~/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  . ~/.nvm/nvm.sh
  nvm --version
fi

echo "Current execution: install nodejs ${version} to ${root}"
echo -e "\n>>>>>>>>> install nodejs by nvm"
nvm install ${version}
nvm use ${version}
node --version