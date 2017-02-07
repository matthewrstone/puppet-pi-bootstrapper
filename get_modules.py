import yaml
import os
import subprocess

cwd = os.getcwd()
modpath = '{}/puppet/modules'
with open('{}/resources/airprint.yaml'.format(cwd)) as y:
    mod = yaml.load(y)
    for module in mod['puppet_modules']:
        subprocess.call('`which puppet` module install {} --modulepath {}'.format(module, modpath))