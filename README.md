# Odoo Setup
This repo contains scripts that will help us to prepare our machine to be ready for Odoo development or Odoo Deployment.

## odoo-presetup.sh
Bash script that will install dependencies of Odoo project. Run this script before you run odoo project template in the new fresh server.

## odoo-project.py
Python script that will run cookiecutter to scaffold Odoo project template.

## odoo-project-test.py
Python script that will run cookiecutter to scaffold Odoo project template for testing. It contains latest unstable script to preparing the next version of the script.

# Usage
## odoo.presetup.sh
`$ bash <(curl -sL https://bit.ly/odoo-presetup)`

## odoo-project.py
`$ python3 <(curl -sL https://bit.ly/odoo-project)`

## odoo-project-test.py
`$ python3 <(curl -sL http://bit.ly/odoo-project-test)`

# FAQ
## How to create a system user?
`$ sudo adduser --system --home=/opt/odoo --shell=/bin/bash --group odoo`

When new user added, they won't have pyenv installed on their home directory. So, use these command below to install pyenv after new user added:
```bash
$ sudo su odoo
$ bash <(curl -sL http://bit.ly/pyenv-install)
```
Then you can call **odoo-project.py** or **odoo-project-test.py** in that new user.

## How to allow users to use sudo without a password?
First, run this command:

`$ sudo visudo`

It will open visudo editor, add this line in bottom of the file:
```bash
odoo ALL=(ALL) NOPASSWD:ALL
```

## How to create a database user?
```bash
$ sudo su postgres
$ createuser -dP odoo
$ exit
```