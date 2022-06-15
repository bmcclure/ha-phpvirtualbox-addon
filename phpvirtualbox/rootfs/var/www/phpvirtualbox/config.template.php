<?php
class phpVBoxConfig {
    var $username = '%%vbox_username%%';
    var $password = '%%vbox_password%%';
    var $location = '%%vboxwebsrv_protocol%%://%%vboxwebsrv_host%%:%%vboxwebsrv_port%%/';
    var $language = '%%phpvirtualbox_language%%';
    var $vrdeports = '%%vrde_ports%%';
    #var $vrdeaddress = '%%vrde_address%%';
    var $maxProgressList = 5;
    var $deleteOnRemove = true;
    var $browserRestrictFiles = array('.iso','.vdi','.vmdk','.img','.bin','.vhd','.hdd','.ovf','.ova','.xml','.vbox','.cdr','.dmg','.ima','.dsk','.vfd');
    var $hostMemInfoRefreshInterval = 5;
    var $consoleResolutions = array('640x480','800x600','1024x768','1280x720','1440x900');
    var $consoleKeyboardLayout = 'EN';
    var $nicMax = 4;
}
