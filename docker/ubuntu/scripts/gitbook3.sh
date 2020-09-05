export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

apt-get install -y tzdata
apt-get install -y npm

npm config set registry https://registry.npm.taobao.org
npm install --global gitbook-cli
gitbook fetch ${VERSION}
npm cache clear
rm -rf /tmp
