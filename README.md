# thing

why are you here

## Installation

1. Clone the repository:

    git clone https://github.com/Leontking2/thing.git
    cd thing

2. Run the install script:

    bash install.sh

That's it!

## What does this do

- Copies the austiblox-launcher.sh script to your home directory.
- Installs the austiblox.desktop file into ~/.local/share/applications/ so it shows up in your app launcher.
- Makes sure everything is executable.

## Notes

- If you update the script later, you'll need to re-run the install script.
- You can customize the launcher behavior by editing <directoryof>/austiblox-launcher.sh.
- This assumes that the AustibloxUpdater.exe file is located in the same directory as the austiblox-launcher.sh
## Uninstall

To remove Austiblox:

    rm ~/.local/share/applications/austiblox.desktop <directoryof>/austiblox-launcher.sh
