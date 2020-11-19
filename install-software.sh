#!/bin/bash
# Eric Burns blog.ericburnsonline.com 
# This script installs various components onto a Raspberry Pi that allow you to 
# work with a Philips HueⓇ bulb and bridge.
# It has been tested on Raspberry PI OS (32-bit) 2020-08-20
echo "Installing Node-RED."
curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered > /tmp/update-nodejs-and-nodered
/bin/bash /tmp/update-nodejs-and-nodered
echo "Done installng Node-RED."

#echo "Adding Philips Hue palette (node-red-contrib-huemagic) for Node-RED."
#npm install node-red-contrib-huemagic
#echo "Done installing node-red-contrib-huemagic palette for Node-RED."


echo "Setting Node-RED to run as a service."
sudo systemctl enable nodered.service
echo "Done enabliing Node-RED to run as a service."
echo "It will auto-start after reboot."

echo "Instaling two Python modules - requests, pyowm"
python -m pip install requests
python -m pip install pyowm
echo "Done adding two Python modules."

echo "Starting Node-RED for now."
node-red-pi --max-old-space-size=256
echo "You can now access Node-RED at http://<hostname>:1880 - try http://localhost:1880 from this system."
echo "Don't forget to lock it down!"




