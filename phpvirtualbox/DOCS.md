# Home Assistant Add-on: phpVirtualBox

This add-on allows you to manage an already-running VirtualBox server which is running the vboxwebsrv service.

It uses ingress in Home Assistant to proxy the phpVirtualBox interface directly into Home Assistant.

## How to use

Enable the add-on, configure it according to the instructions in the UI, start it, and then click "Open Web UI" or the VirtualBox link in the sidebar if enabled.

## Warning

This add-on makes general maintenance, modifications, and managing of other VMs easy within Home Assistant, but iif Home Assistant is running inside one of your VMs, take care not to shut down that VM completely. If you do, phpVirtualBox will also go away and you will have to re-start the VM some other way to be able to get back in.

Make sure you always have another way to control VirtualBox in case your Home Assistant VM shuts down or fails. It is usually safe to make changes and then restart the VM from within phpVirtualbox, however know that you will lose your connection to phpVirtualbox until Home Assistant has fully restarted.
