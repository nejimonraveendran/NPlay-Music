#!/bin/bash
set -euo pipefail

sudo apt update

echo "Installing GTK..."
sudo apt install libgtk-3-0 -y

echo "Installing WebKit..."
sudo apt install libwebkit2gtk-4.1-0 -y

echo "Installing MPD..."
sudo apt install mpd -y

echo "Trying to enable MPD..."
sudo systemctl enable mpd

echo "Stopping MPD for further operations..."
sudo systemctl stop mpd

echo "Attempting to create NPlay Pipe..."
if [ ! -p /tmp/nplaystream.pipe ]; then
    sudo mkfifo /tmp/nplaystream.pipe
    sudo chown mpd:$(id -gn mpd) /tmp/nplaystream.pipe
else
    echo "NPlay pipe already exists"
fi

echo "Changing mode of NPlay Pipe..."
sudo chmod 666 /tmp/nplaystream.pipe

echo "Adding NPlay Pipe to MPD configuration file..."
if ! grep -q 'path\s\+"/tmp/nplaystream.pipe"' /etc/mpd.conf; then
    sudo bash -c "cat <<'EOF' | cat - /etc/mpd.conf > /etc/mpd.conf.tmp && mv /etc/mpd.conf.tmp /etc/mpd.conf
audio_output {
    type            \"fifo\"
    name            \"NPlayPipe\"
    path            \"/tmp/nplaystream.pipe\"
    format          \"48000:32:2\"
}
EOF"
else
    echo "Configuration already exists"
fi

echo "Starting MPD back..."
sudo systemctl start mpd

if systemctl --quiet is-active mpd; then
    echo "MPD is running. Installation success"
else
    echo "MPD is not running. Some parts of the installation may have failed"
    exit 1
fi

echo "Making run.sh script runnable..."
sudo chmod +x run.sh

echo "Installation successfully completed. "
echo "To run the application, execute ./run.sh. The application will be exposed on port 8000 by default. Open a browser and try accessing it on http://localhost:8000.  If you are accessing it from another device on the network, make sure port 8000 is allowed in the firewall. "
echo "To configure your music libraries and playback device (sound card), go to NPlay Settings and add them.  Once the library is added, make sure you click Rescan Library in the menu and refresh your page afterwards."
