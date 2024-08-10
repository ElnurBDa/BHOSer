# Week 1
## A Penetration Testing Environment
On first week we were assigned to prepare a **penetration testing environment** for PROLAB educational Platform. The task was to create something like "Attack Box" in Tryhackme or "ParrotOS" in Hackthebox. First we thought to create it based on Debian, as Kali Linux. However then moved to more progressive variant - base it on **Arch Linux**. 

The reason we did not choose the Kali Linux was the fact that it had tool-set that may be not needed on PROLAB's labs. For example, there is no need for tools related to WiFi Pentesting, such as `aircrack-ng` or `airgeddon`. Additionally we wanted to accomplish task related to branding: PROLAB's Attack Machine. It will increase the company's reputation and increase revenue from business point of view. Moreover, Arch had better packages repository - **Arch User Repository** which provided more flexibility in choosing Penetration Testing tools. The count of packages in AUR is close to 100k, the only Distro that has more packages in the repository is NixOS. 

For us, this choice had advantageous consequences: it let us to learn the fundamentals of Linux Distro Development and better understood how Linux works. 

We named the Distro **PTArch** which can be deciphered as **Penetration Testing Arch** and immediately started the development. 

>![[ptarch logo.png]]
>Figure X, PTArch Logo

## Development of PTArch
### Setup Arch as a Virtual Machine
The virtualization software that we used was VMWare. It provided more stable and seamless experience. We downloaded Arch Linux's iso and in VMWare we chose the following options:
- `Other linux 6.x kernel 64-bit`
- `RAM 1`
- `Disk Space 20`
- `CPU 1 core`
These minimal settings will allow us to prepare minimal Linux Distro with the Most Efficient use of Resources. 

### The Installation Process
To install the Arch we followed instructions from Arch Wiki. This resource was more than enough to tune the Arch for our needs. Set of used commands will be shared here too.

First, configured the time, partitioned the disks with following schema:

| Size | Purpose          |
| ---- | ---------------- |
| 1GB  | EFI System       |
| 17GB | Linux Filesystem |
| 2GB  | Linux Swap       |
 
> ![[set 1 commands.png]]
> Figure X, the first set of commands

Then, assigned the roles for partitions, mounted them, installed linux to the root directory and configured the language.

> ![[set 2 commands.png]]
> Figure X, the second set of commands

Network services were configured, installed grub and rebooted.

>![[set 3 commands.png]]
> Figure X, the third set of commands

Finally, the main part of Arch system was configured, we setuped a new user and added it sudoers group, next moves were to customize it for our needs.

### Package Manager
The default package manager for Arch is `pacman`. However, it lacks some features, and we installed `yay` which is wrapper around the `pacman` and provides more packages to install.

> ![[set 4 commands.png]]
> Figure X, the fourth set of commands

### GUI - Budgie
We chose Budgie Desktop Environment as it is both user friendly and less bloated with custom softawares. 

First, we installed the required packages, and then started the setup. To start the DE, several lines of commands were added to X server starting script and we made it to start after each logon.

> ![[set 5 commands.png]]
> Figure X, the fifth set of commands

The result was the following DE:

> ![[budgie.png]]
> Figure X, Budgie Desktop Environment

### Packages 
For our environment we opted several packages that will give us the best Penetration Testing experience. As a terminal we installed Alacritty, and to customize the use of it we installed some alternatives to common GNU tools and added several aliases to `.bashrc` file.


| A tool | An Alternative |
| ------ | -------------- |
| top    | btop           |
| cat    | bat            |
| ls     | eza            |
| -      | jq             |

> ![[set 6 commands.png]]
> Figure X, the sixth set of commands

Then, as an image viewer e used EOG, as a File Manager - Thunar, and as Browser - Firefox. Additionally, we installed common Linux tools.

> ![[set 7 commands.png]]
> Figure X, the seventh set of commands

For hacking, we setup the following tools as a default:
- nmap 
- wireshark-qt 
- dirb 
- gobuster 
- nikto 
- smbclient 
- smbmap 
- enum4linux  
- metasploit 
- postgresql 
- sqlmap 
- impacket 
- john 
- ffuf 
- hashcat 
- hydra 
- steghide 
- gdb 
- netdiscover

The resulting PTArch looked like this:
> ![[resulting PTArch.png]]
> Figure X, PTArch

### Converting to the ISO image
To convert the resulting machine ISO file for setting up the Penetration Testing Environment wherever we want we used `archiso` command. The size of resulting ISO image was 2.2G (For comparison minimal Kali is 3.5G).

>![[archiso.png]]
> Figure X, archiso

# Resources
- https://archlinux.org/download/
- https://wiki.archlinux.org/title/Installation_guide
- https://linuxconfig.org/install-arch-linux-in-vmware-workstation
- https://wiki.archlinux.org/title/General_recommendations
- https://wiki.archlinux.org/title/List_of_applications
- https://linuxways.net/arch/install-configure-openssh-arch-linux/
- https://www.makeuseof.com/fix-sudo-command-not-found-on-linux/
- https://www.debugpoint.com/xfce-arch-linux-install-4-16/
- https://wiki.archlinux.org/title/Budgie
- https://wiki.archlinux.org/title/Xinit
- https://medium.com/@ribomo42/install-official-vmware-tools-on-arch-linux-15afd5b848ed
- https://wiki.archlinux.org/title/Archiso
