import os
import subprocess
import sys

args = sys.argv
puppet_role = None
modules = []
with open('resources.yaml', 'r') as y:
    resources = yaml.load(y)
    for role in resources[roles]:
        if args[1] == role
        puppet_role = role
        
cwd = os.getcwd()

print('Updating apt and installing dependencies...')
subprocess.call('sudo apt-get update && apt-get install vim ruby-full facter hiera bundler python-pip -y', shell=True)

print('Installing python dependencies...')
subprocess.call('sudo pip install pyyaml')

#switch to urllib?
print('Downloading puppet 4.9.1 agent...')
subprocess.call('wget -O {}/4.9.1.zip https://github.com/puppetlabs/puppet/archive/4.9.1.zip'.format(cwd), shell=True)

print('Preparing for puppet install...')
subprocess.call('{}/unzip 4.9.1.zip && cd puppet-4.9.1 && bundle install --path .bundle/gems/ && sudo bundle update'.format(cwd), shell=True)

print('Using python to call a shell to call ruby to install puppet...')
subprocess.call('ruby {}/puppet-4.9.1/install.rb'.format(cwd), shell=True)

print('Setting basemodulepath...')
subprocess.call('sudo puppet config set basemodulepath /home/pi/puppet-pi-bootstrapper/puppet/modules:/opt/puppetlabs/puppet/modules', shell=True)
