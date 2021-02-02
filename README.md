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
`$ python <(curl -sL https://bit.ly/odoo-project)`

## odoo-project-test.py
`$ python <(curl -sL http://bit.ly/odoo-project-test)`
