import yaml
import os
import subprocess

cwd = os.getcwd()
modpath = '{}/puppet/modules'.format(cwd)
with open('{}/resources/airprint.yaml'.format(cwd)) as y:
    mod = yaml.load(y)
    for module in mod['puppet_modules']:
        subprocess.call('/usr/bin/puppet module install {} --modulepath {}'.format(module, modpath), shell=True)