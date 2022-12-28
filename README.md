# Deckpad

## Setup Instructions
### On Steam Deck

1. Clone repo
    
    ```bash
    cd ~ && git clone git@github.com:FlorianKempenich/SteamDeckScripts.git
    ```
    
2. Run `./initialize_after_os_update.sh`
    
    This will:
    
    - Disable `readonly` mode on SteamOS
    - Initialize `pacman`
    - Install `xorg-xinput` and `figlet`
3. Download: [VirtualHere USB Server for Linux (x86_64)](https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64)      
4. Put in `~/SteamDeckScripts/Deckpad/virtualhere/`
5. Make executable: `chmod +x vhusbdx86_64`
6. Add a “fake” game to the steam library *(shortcut will be updated, so the app doesn’t matter)*
7. Select “fake” game and click `Properties`
8. Replace with these values
    
    
    | Title | Deckpad |
    | --- | --- |
    | Target | `env` |
    | Start | `"/home/deck/SteamDeckScripts/Deckpad"` (don’t remove ") |
    | Launch Opts | `-u LD_PRELOAD konsole -e “./deckpad.sh”` |
    - and this icon
        
        ![controller_wireless_icon.png](https://github.com/FlorianKempenich/SteamDeckScripts/blob/main/Deckpad/icon.png)
        
    
9. Launch it once


### On Windows Gaming PC

1. Download [VirtualHere Client for Windows (64-Bit Win10,Win11/Server 2016/2019/2022](https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe)
2. Place `.exe` at the root of `C:` drive
3. Configure it
    1. Launch Deckpad on the Steam Deck
    2. Run `vhui64.exe`
    3. *Steam Controller should show (it can take a bit before it shows)*
    4. Right click on `USB Hubs` and select
        1. `Start minimized`
        2. `Always On Top`
        3. *(can’t use `Install Client as a Service`, it requires the paid version)*
    5. Right click on `Steam Controller` and select
        1. `Auto-Use Device`
4. Place a shortcut of `vhui64.exe` in `shell:startup`