# install the necessary dependencies
apt-get -q update
apt-get -yq install gnupg curl

# add Azul's public key
apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9

# download and install the package that adds
# the Azul APT repository to the list of sources
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb

# install the package
apt-get install ./zulu-repo_1.0.0-3_all.deb

# update the package sources
apt-get update

apt-get install zulu11-jdk
