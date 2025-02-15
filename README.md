# Deckpad

> ⚠️ **WARNING:** This is a mostly stable prototype, but it is very much alpha!

> ⚠️ After every Steam OS update, make sure to run
> ```
> ~/Deckpad/initialize_after_os_update.sh
> ```

> ⚠️ **WARNING:** If you quit Deckpad without pressing on the screen (or if it doesn't work on your device), it won't clean up and will prevent sleep and brightness changes!
> - The easiest way way to fix it is to run Deckpad again, and quit it by clicking on the target in the middle of the screen  
> - Alternatively, you can restore the SteamDeck to its original state by running these 2 commands:
>   ```bash
>   sudo chmod 666 /sys/class/backlight/amdgpu_bl0/brightness
>   sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target >/dev/null 2>&1
>   ```

## What is Deckpad?

Deckpad allows you to use your SteamDeck as a gamepad on your Windows PC.

Once setup, all you have to do is to launch **Deckpad**, enter your password, and it will:

* Connect automatically to your Windows PC and act as a gamepad
   * You can use all the Steam input config you already configured on the SteamDeck
* Reduce the brightness to the minimum
   * Also prevents Steam from raising it while the app is running
* Disable sleep mode while the app is running
* Show the live battery percentage

Welcome Screen              |  Running Screen
:-------------------------:|:-------------------------:
![](https://github.com/HelloThisIsFlo/Deckpad/raw/main/doc/welcome_screen.jpg)  |  ![](https://github.com/HelloThisIsFlo/Deckpad/raw/main/doc/running_screen.jpg)


## Setup Instructions
> **Update Instructions**
> ```
> cd ~/Deckpad/ && git pull
> ```
### On Steam Deck

1. Initialize Everything

    1. Set a `sudo` password: [SteamDeckTips Tutorial](https://steamdecktips.com/blog/how-to-set-a-password-for-your-steam-deck-user-in-desktop-mode)
    2. Clone repo
        
        ```bash
        cd ~ && git clone https://github.com/HelloThisIsFlo/Deckpad.git
        ```
        
    3. Run `./initialize_after_os_update.sh`
        
        This will:
        
        - Disable `readonly` mode on SteamOS
        - Initialize `pacman`
        - Install `xorg-xinput` and `figlet`
    4. Download: [VirtualHere USB Server for Linux (x86_64)](https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64)      
    5. Put in `~/Deckpad/virtualhere/`
    6. Make executable: `chmod +x vhusbdx86_64`

2. Create the launcher for Deckpad

    1. Add a “fake” game to the steam library *(shortcut will be updated, so the app doesn’t matter, pick whichever)*
    2. Select “fake” game and click `Properties`
    3. Replace with these values
        
        
        | Title | Deckpad |
        | --- | --- |
        | Target | `env` |
        | Start | `"/home/deck/Deckpad"` (don’t remove " symbols) |
        | Launch Opts | `-u LD_PRELOAD konsole --fullscreen -e ./deckpad.sh` |
        - and this icon
            
            ![controller_wireless_icon.png](https://github.com/HelloThisIsFlo/Deckpad/blob/main/icon.png)
            
        
3. Enable touchscreen <- **Do this in Game Mode**  
  _Thank you [Jeoshua](https://github.com/Jeoshua) for figuring this one out!_
    1. Open the Deckpad launcher page
    2. Tap on the controler icon
    3. Click: `Edit Layout`
    4. Click: `Action Sets`
    5. Click the Gear icon next to `Default`
    6. Click: `Add Always-On command`
    7. Click: `Add command` (on the newly added 'Always On Command')
    8. Click: `System` (tab, at the top)
    9. Click: `Touchscreen Native Support`
    10. Back out until you're back on the Deckpad launcher page

4. Launch Deckpad once, and you're all done for the SteamDeck side of things 🎉


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