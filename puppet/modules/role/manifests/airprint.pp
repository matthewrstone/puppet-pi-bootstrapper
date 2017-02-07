# role::airprint
#
# Make a Raspberry Pi an Airprint Server.
#
# Codifies https://rohankapoor.com/2012/06/configuring-the-raspberry-pi-as-an-airprint-server/
#
# Printadmin user password hashed but easy as an example. Create your own hash!
# echo -n "password" | openssl sha1
class role::airprint {
    include profile::base
    include profile::airprint
}