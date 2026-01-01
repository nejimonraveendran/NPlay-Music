## Qobuz Setup Documentation - Documentation based on Linux Debian Bookworm.

NPlay supports Qobuz streaming control, visualization, and DSP via MPD and UpMpdCli. Once you have set up Qobuz streaming on your Raspberry Pi or Linux computer with MPD and UpMpdCli, you can have MPD output Qobuz streams to NPlay so that you can run visualizations and apply DSP effects such as equalizer to Qobuz streams.  You can also use NPlay to control playback of Qobuz streams such as seeking, play, pause, and stop (next/prev does not work - at least not in the current version).

As part of the installation, NPlay already installs MPD and UpMpdCli and configures MPD to output the streams to NPlay, but you need to install the UpMpdCli Qobuz plugin separately and configure UpMpdCli for Qobuz streaming. This document provides instructions to set up Qobuz plugin.

First of all, add the following source repo list locally, and verify that it exists using ls command:
```bash
wget https://www.lesbonscomptes.com/upmpdcli/pages/upmpdcli-rbookworm.list
sudo cp upmpdcli-rbookworm.list /etc/apt/sources.list.d
ls /etc/apt/sources.list.d
```

Next install UpMpdCli Qobuz plugin:
```bash
sudo apt update
sudo apt install upmpdcli-qobuz
```

**upmpdcli configuration for Qobuz:**

Open the UpMpdCli configuration file using nano or your favorite text editor (I use nano editor here):
```
sudo nano /etc/upmpdcli.conf
```

Add the following lines at the end of the file, replacing `<your-qobuz-username>` and `<your-qobuz-password>` with your actual Qobuz credentials:
```
friendlyname = MyPiQoBuz
mpdhost = localhost
mpdport = 6600
qobuzuser = yourqobuzusername@mail.com
qobuzpass = YourQoBuzPassword
qobuzautostart = 1
qobuzenabled = 1
openhome = 1
qobuzformatid = 27 #highest quality (high-res) streaming
upnpiface = wlan0
logfilename = /var/log/upmpdcli.log
```

Finally restart and enable services:
```
sudo systemctl start mpd
sudo systemctl enable mpd
sudo systemctl start upmpdcli
sudo systemctl enable upmpdcli
```

To stream Qobuz music to Rasperry Pi or the Linux computer, you can use any UPnP/DLNA controller app on your smartphone or tablet. MConnectLive app(Android/iOs) was found to work the best.  When you open the app, you should see the Qobuz music library as a UPnP/DLNA server and the NPlay device (MyPiQoBuz in this example) as a playback device. Go to NPlay web interface and turn stream play on from the menu. If you play a track from the Qobuz library, it should start playing on NPlay with visualizations and DSP effects applied.

Note: If you hear garbled or distorted audio, try changing playback device in the settings.

