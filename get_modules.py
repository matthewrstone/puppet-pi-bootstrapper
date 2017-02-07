import yaml
import os
cwd = os.getcwd()
modpath = '{}/modules'
with open('{}/resources/airprint.yaml'.format(cwd)) as y:
    mod = yaml.load(y)
    for module in mod['puppet_modules']:
        subprocess.call('puppet module install {} --modulepath {}'.format(module, modpath))