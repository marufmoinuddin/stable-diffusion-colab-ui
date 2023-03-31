wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok http 1234 &>/dev/null &
echo Your Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
sh /content/drive/MyDrive/Projects/easy-diffusion/start.sh  > /dev/null 2>&1
