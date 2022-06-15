#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: phpVirtualBox
# Configures phpvirtualbox
# ==============================================================================
declare vbox_username
declare vbox_password
declare vboxwebsrv_protocol
declare vboxwebsrv_host
declare vboxwebsrv_port
declare phpvirtualbox_language
declare enable_vrde
declare vrde_start_port
declare vrde_end_port
declare vrde_ports
declare vrde_address

vbox_username="$(bashio::config 'vbox_username')"
vbox_password="$(bashio::config 'vbox_password')"
vboxwebsrv_protocol="$(bashio::config 'vboxwebsrv_protocol')"
vboxwebsrv_host="$(bashio::config 'vboxwebsrv_host')"
vboxwebsrv_port="$(bashio::config 'vboxwebsrv_port')"
phpvirtualbox_language="$(bashio::config 'language')"
enable_vrde="$(bashio::config 'enable_vrde')"
vrde_start_port="$(bashio::config 'vrde_start_port')"
vrde_end_port="$(bashio::config 'vrde_end_port')"
vrde_address="$(bashio::config 'vrde_address')"
vrde_ports=$vrde_start_port

if [ -e "$vrde_start_port" ]; then
    vrde_ports=9000
fi

if [ -n "$vrde_end_port" ]; then
    vrde_ports="${vrde_ports}-$vrde_end_port"
fi

rm -f /var/www/phpvirtualbox/config.php
cp /var/www/phpvirtualbox/config.template.php /var/www/phpvirtualbox/config.php

sed -i "s/%%vbox_username%%/${vbox_username}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vbox_password%%/${vbox_password}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vboxwebsrv_protocol%%/${vboxwebsrv_protocol}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vboxwebsrv_host%%/${vboxwebsrv_host}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vboxwebsrv_port%%/${vboxwebsrv_port}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%phpvirtualbox_language%%/${phpvirtualbox_language}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vrde_ports%%/${vrde_ports}/g" \
    /var/www/phpvirtualbox/config.php
sed -i "s/%%vrde_address%%/${vrde_address}/g" \
    /var/www/phpvirtualbox/config.php

if [[ "$enable_vrde" && "$vrde_address" ]]; then
    sed -i 's/#var $vrdeaddress/var $vrdeaddress/g' \
    /var/www/phpvirtualbox/config.php
fi

cat /var/www/phpvirtualbox/config.php
