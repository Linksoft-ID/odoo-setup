import os
from cookiecutter.main import cookiecutter
from cookiecutter.repository import determine_repo_dir
from cookiecutter.config import get_user_config

template = "https://git.linksoft.id/odoo/odoo_project_template.git"
template_name = "odoo_project_template"
checkout = "master"
config_dict = get_user_config(
       config_file=None,
       default_config=False,
   )
repo_dir = os.path.join(config_dict['cookiecutters_dir'], template_name)
extra_context={
    '_current_dir': os.getcwd(),
    '_repo_dir': repo_dir,
    '_repo_branch': checkout,
    '_home_dir': os.environ.get('HOME')
}
cookiecutter(template, checkout=checkout, extra_context=extra_context)
