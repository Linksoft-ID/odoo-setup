#!/usr/bin/env bash

read -p "Install PostgreSQL Server in this server? [Y/N]: " install_psql && [[ $install_psql == [yY] || $install_psql == [yY][eE][sS] || $install_psql == [nN] ]] || exit 1

if [[ $install_psql == [yY] || $install_psql == [yY][eE][sS] ]]
then
    read -p "What version of PostgreSQL that you want to install in this server?: " psql_version
fi

if [[ -z "$psql_version" ]]
then
    psql_version="10"
fi

sudo apt update && sudo apt upgrade -y

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

if [[ $install_psql == [yY] || $install_psql == [yY][eE][sS] ]]
then
    sudo apt-get -y install postgresql-$psql_version
fi

sudo apt-get -y install postgresql-client-$psql_version

sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev\
libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev\
liblzma-dev python-openssl git python3-pip nginx snapd libpq-dev libsasl2-dev python-dev python3-dev\
libldap2-dev libssl-dev npm unzip libxml2-dev libxmlsec1-dev

curl https://pyenv.run | bash

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc

exec $SHELL

sudo pip3 install cookiecutter

sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

printf "\n\nSetup done! You can run odoo project template now.\n\n"