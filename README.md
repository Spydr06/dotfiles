# dotfiles
My dotfiles and configurations of my linux system

## Contents
This repository contains configurations for the following programs:
* Alacritty (Terminal Emulator)
* Termite (Terminal Emulator)
* Polybar (Bar and System Tray)
* Tint2 (Bar and System Tray)
* Rofi (Application Launcher)
* jgmenu (Application Launcher)
* i3-gaps (Window Manager)
* dwm (Window Manager, seperate repository)
* bspwm (Window Manager)
* herbstluftwm (Window Manager, almost exact copy of my i3 theme, not well done)
* openbox (Floating Window Manager)
* sxhkd (Hotkey Daemon)
* nano (File Editor)
* picom (X Compositor)
* starship (Shell Prompt)
* tabliss (New-tab-page for Firefox)
* zsh (Shell)

Following things you can find here additionally:
* GKT2/3 themes
* Firefox Userchrome (not mine)
* Openbox themes
* Some Screenshots
* My Wallpapers

## Installation
This repository is mostly set up like your $HOME folder.
### a) To install everything, enter the following shell commands (might be unsafe):
```bash
cd ~
```
```bash
git clone --recursive https://github.com/spydr06/dotfiles.git
```
```bash
rm -rf .git/    # delete the .git directory, so you can still have your own repositories in subdirectories
```
### b) Install my themes partially, enter the following shell commands (safer):
```bash
cd ~/Downloads    # cd into a non-critical directory (Downloads for example)
```
```bash
git clone --recursive https://github.com/spydr06/dotfiles.git dotfiles-spydr
cd dotfiles-spydr
```
Now you can copy all the configs you want to use.

### c) Install my custom dwm-version:
Although the installation does not differ from the default dwm installation process, you can follow the installation instructions on my [DWM repository](https://github.com/spydr06/dwm-spydr).

### Important:
As this repository represents a copy of my $HOME folder, configurations will definately change in the future. To get all configs safely, I suggest you to download the exact version of my configurations you want over at the [releases tab](https://github.com/Spydr06/dotfiles/releases). 

## newest theme (dwm):
![img](https://github.com/Spydr06/dotfiles/blob/main/Screenshots/dwm%20Rice.png)

## older theme: (i3-gaps):
![img](https://github.com/Spydr06/dotfiles/blob/main/Screenshots/Rice%2003%20v2%20i3-gaps.png)
