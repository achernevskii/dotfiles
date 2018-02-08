#!/bin/bash

sudo apt-get purge bcmwl-kernel-source
sudo apt-get install firmware-b43-installer

echo "Also need to put in the module b43 in the /etc/modules files to autoload it at bootup."
