# NPlay Music Player and Streamer

<img src="https://api.visitorbadge.io/api/visitors?path=nejimon.raveendran-nplay&countColor=%234a748a&style=flat"></img>

![NPlay Logo](images/logo.png)

NPlay is a remote-controllable lightweight music player and streamer designed for Raspberry Pi and Linux platforms with simplicity and ease of use in mind. It supports prominent audio formats and provides a user-friendly interface for managing and playing your music collection.  It also includes streaming capabilities, allowing you to play music from online sources such as web radios and Qobuz.

## Features
- Supports audio formats WAV, FLAC, and MP3.
- Supports 16-bit, 24-bit, and 32-bit audio files.
- Web radios and online streams (integration via Music Player Demon - MPD).
- Full remote control via web interface - you can control playback and DSP effects from any device with a web browser.
- Can be run as headless server or with local desktop UI.
- A local desktop display user interface, especially useful on devices with small screens such as Raspberry Pi to run visualization effects in full-screen mode.
- Ask AI feature to get track information of currently playing song using Google Gemini AI (requires Google account and free API key - see documentation for setup instructions).
- Supports Qobuz streaming control, visualization, and DSP via MPD and UpMpdCli (requires Qobuz account) - see documentation for setup instructions.
- Library management with support for multiple music directories.
- Playlist management (create/delete playlists, add tracks to playlists, etc.).
- Playback controls (play, pause, stop, next, previous, seek).
- Edit track metadata tags (title, artist, album, etc.) for individual tracks.
- Temporary queue for adding songs to be played next.
- Random, sequential, and single playback modes.
- Album art and track metadata display.
- Adaptive background display for desktop UI based on album art.
- Add track to favorites functionality - saved as Favorites playlist.
- Library browsing and searching (supports searching by title, file name, folder, artist, album, format, etc.).
- Deferred loading of tracks and infinite track scrolling.
- Parametric equalizer with (number of bands configurable).
- A 12-band, 15-level spectrum analyzer visualization with configurable color schemes, peak hold, and falloff settings.
- Support for selecting audio output devices (sound cards/USB DACs, etc.)
- Bypassable DSP effects (equalizer, bass boost, etc.) - for bit-perfect audio output
- In-built software volume control.
- Night mode for distraction-free listening in low-light environments.
- Sleep timer with auto stop, auto system shutdown, night mode activation etc.
- Exposes REST API for all features.
- Websockets for realtime updates to connected clients.


## Installation
- Download this repository package and unzip the v1.0.0 directory it to your home directory to path **~/NPlay-Music**.  This package has precompiled binaries for Raspberry Pi (linux-arm64 directory) and desktop Linux computers with Intel processors (linux-x64 directory).
- Open a terminal window and navigate to the correct directory based on your system architecture.  While in the directory, change the permissions of _install.sh_ file to executable:
    ```sh
    sudo chmod +x install.sh
    ```
- Run the installation script:
    ```sh
    sudo ./install.sh
    ```
- After installation is complete, follow the on-screen instructions to run NPlay. It mainly involves running the command:
    ```sh
    ./run.sh
    ```
- After starting NPlay, open a web browser from the same device or another device on the network and navigate to `http://<your-device-ip>:8000` `http://<your-device-hostname>:8000` to access the web interface.  Replace `<your-device-ip>` or `<your-device-hostname>` with the actual IP address or hostname of your Raspberry Pi or Linux computer.

    Screenshot for reference:
    ![NPlay installation screenshot](images/nplay-command-line.jpg)

## Screenshots
Screenshot of major components of NPlay web and desktop interface:
![NPlay Web Interface](images/nplay-screenshot.jpg)

## Architecture
NPlay supports both x86 and ARM architectures. It consists of a core backend written in .NET 10 (hence the name NPlay) that handles audio playback, metadata management, and DSP processing. The desktop UI container is written in pure C and GTK and communicates with the .NET backend via RESTful APIs and WebSockets. The frontend is implemented in Angular 20 that communicates with the backend through RESTful APIs and WebSockets. A high-level architecture diagram is shown below:
![NPlay Architecture Diagram](images/nplay-architecture.jpg)

## Demo
A short video demo of NPlay is available here:
[Video Demo](https://youtube.com/shorts/XAbcchQTw4E?si=jGZIQd6aU2GCwlza)

## Web Radio Streaming Integration
NPlay supports integration with online streaming services via Music Player Daemon. The install script automatically installs MPD if it is not already present on your system. You can add your favorite web radios under the Radios option. Web radio URLs can be found at [radio-browser.info](https://www.radio-browser.info). 
    
## Qobuz Streaming Integration
Qobuz is a high-quality music streaming service that offers streaming at CD quality and above.  NPlay supports integration with via Music Player Daemon (MPD) and UpMpdCli. The install script automatically installs MPD and UpMpdCli if they are not already present on your system. For detailed setup instructions, please refer to the [Qobuz Integration Documentation](qobuz-setup.md).

## License
You can use this software free of charge. For licensing details - see the [LICENSE](LICENSE.txt) file.  This is an early release version of NPlay, so please expect bugs and incomplete features.  Please report any issues via the Issues section of this repository.
