# 🐧 Linux History 

Linux is an open source computer operating system, initially developed on and for Intel x86-based personal computers. It has since been ported to a wide range of hardware platforms from tiny embedded appliances to the world's largest supercomputers.

In 1991, Linus Torvalds, a student in Helsinki, Finland, began working on a project: writing his own operating system kernel. Alongside it, he gathered or developed the necessary components to form a complete OS. This became known as the **Linux kernel**.

In 1992, Linux was re-licensed under the **GNU General Public License (GPL)** by the Free Software Foundation (FSF), which enabled the rise of a worldwide developer community. By combining Linux with GNU system components, developers began releasing full **Linux Distributions**, starting in the mid-1990s.

These early distributions became the foundation for fully free (as in freedom) computing. In 1998, major companies like **IBM** and **Oracle** announced support for Linux, further boosting its development and credibility.

Today, Linux powers:
- More than **50%** of the Internet's servers
- The majority of smartphones (**Android**)
- Over **90%** of the public cloud workload
- All of the world’s most powerful supercomputers

## 🐧 Linux Philosophy 

Every successful project needs a guiding philosophy. The Linux community operates on principles of openness, collaboration, and meritocracy.

- Anyone can contribute—only technical skill, a willingness to collaborate, and a desire to improve the system are needed.
- Linux is a free and open-source alternative to UNIX.
- It adopts a UNIX-like filesystem structure, with everything accessible as a file, including devices and processes.
- Linux is **multiuser**, **multitasking**, and includes built-in **networking** and service processes known as **daemons**.

> **Note:** Linux was inspired by UNIX, but it is not UNIX.

## 🐧 Linux Community 

Stuck configuring a Linux server? The global Linux community can help.

The Linux community includes developers, sysadmins, users, and vendors. Popular community spaces include:
- **IRC clients**: WeeChat, HexChat, Pidgin, XChat, Discord
- **Online forums** and **Linux User Groups (LUGs)**
- **GitHub**, **GitLab**, and other collaborative platforms
- **Mailing lists** like the Linux Kernel Mailing List (LKML)
- Events: Hackathons, Install Fests, Open Source Summits, etc.

## 🐧 Linux Distributions

So, what is a Linux distribution, and how does it relate to the Linux kernel?

The Linux kernel is the core of the operating system. 
A full Linux distribution consists of the kernel plus a number of other software tools for file-related operations, user management, and software package management. 
Each of these tools provides a part of the complete system. Each tool is often its own separate project, with its own developers working to perfect that piece of the system.

> More on [Linux Kernel](https://graphviz.org/Gallery/directed/Linux_kernel_diagram.html)

### Kernel Versions

Distributions vary in kernel version:
- **RHEL 8** uses kernel **4.18** (older but stable)
- **RHEL 9** uses **5.14**
- Others like Fedora or Arch may adopt newer kernels more quickly
- Even older kernels are often backported with newer features.

### Components in Distributions

Distributions include:
- C/C++ compilers, Clang
- `gdb` debugger
- System libraries
- Graphics systems and desktop environments
- Package management systems
- And they usually ship with a wide range of pre-installed apps.

![Linux Distros](https://github.com/user-attachments/assets/194c4215-dd31-49db-82bb-04735102c15b)

## 🐧 Services Associated with Distributions

Different audiences require different distributions:

### Enterprise-Focused Distros
- **Red Hat**, **SUSE**, **Canonical (Ubuntu)** offer commercial support
- **CentOS**, **AlmaLinux**, **Rocky Linux**: free alternatives to RHEL

> Note: CentOS Stream replaced CentOS after 2021

### Developer-Focused Distros
- **Ubuntu**, **Fedora**: popular in developer and academic circles
  
![Distros Comparison](https://github.com/user-attachments/assets/e522b951-ea70-4283-aa03-1cd0d97d2bf5)

## 🐧 Summary
- Linux is inspired by UNIX but is a standalone open-source OS.
- Its components are accessed through files or file-like objects.
- It supports multitasking, multiuser environments, and networking.
- It's developed collaboratively by a global community.
- Common Linux terms include: `kernel`, `distribution`, `boot loader`, `service`, `filesystem`, `X Window`, `desktop environment`, and `command line`.
- A Linux distribution = kernel + user tools + package management + GUI + apps.

--- 

## 🐧 The Boot Process

The Linux boot process is the procedure for initializing the system. It consists of everything that happens from when the computer power is first switched on until the user interface is fully operational.

Having a good understanding of the steps in the boot process may help you with troubleshooting problems, as well as with tailoring the computer's performance to your needs.

On the other hand, the boot process can be rather technical, and you can't start using Linux without knowing all the details.

![Boot process](https://github.com/user-attachments/assets/f5b51507-0f4a-4192-a7c7-cc0558f31f56)

---

## 🐧 Master Boot Record (MBR), EFI Partition, and Boot Loader

Once the POST is completed, system control passes from the BIOS to the boot loader. The boot loader is usually stored on one of the system’s storage devices, such as a hard disk or SSD drive, either in the boot sector (for traditional BIOS/MBR systems) or the EFI partition (for more recent Unified Extensible Firmware Interface or EFI/UEFI systems).

Up to this stage, the machine does not access any mass storage media. Then, information on the date, time, and the most important peripherals are loaded from the CMOS values (after a technology used for the battery-powered memory store, which allows the system to keep track of the date and time even when it is powered off).

A number of boot loaders exist for Linux; the most common ones are:
- **GRUB** (GRand Unified Boot loader)
- **ISOLINUX** (for booting from removable media)
- **DAS U-Boot** (for booting on embedded devices/appliances)

Most Linux boot loaders can present a user interface for choosing alternative options for booting Linux and even other operating systems that might be installed.

When booting Linux, the boot loader is responsible for:
- Loading the kernel image
- Loading the initial RAM disk or filesystem (which contains some critical files and device drivers needed to start the system) into memory

![MBR](https://github.com/user-attachments/assets/258912eb-ecb5-45a8-995f-ebf4c3911f31)

The boot loader has two distinct stages:

### BIOS/MBR Systems:
- The boot loader resides in the first sector of the hard disk, known as the Master Boot Record (MBR), which is just 512 bytes in size.
- The boot loader examines the partition table and finds a bootable partition.
- Once found, it searches for the second stage boot loader (e.g., GRUB) and loads it into RAM.

### UEFI Systems:
- UEFI firmware reads its Boot Manager data to determine which UEFI application is to be launched and from where (disk and partition).
- The firmware then launches the UEFI application (e.g., GRUB) as defined in the boot entry.

This process is more complex but offers more features and flexibility than the older MBR methods.

### Second Stage:
- Resides under `/boot`
- A splash screen is displayed, allowing the user to choose which OS and/or kernel to boot
- After selection, the boot loader loads the kernel into RAM and passes control to it
- Kernels are typically compressed; the kernel first uncompresses itself
- It then checks and initializes hardware, and loads any device drivers built into the kernel

---

## 🐧 The Initial RAM Disk (initramfs)

The `initramfs` filesystem image:
- Contains programs and binaries needed to mount the proper root filesystem
- Provides the kernel functionality required for the specific filesystem
- Loads device drivers for mass storage controllers

![initramfs](https://github.com/user-attachments/assets/4e835ac0-c17f-4f88-9eca-256bc6128726)

It makes use of the **udev** system (user device manager), which:
- Detects present devices
- Locates and loads required drivers

After the root filesystem is found:
- It is checked for errors and mounted
- The `initramfs` is cleared from RAM
- The `/sbin/init` program is executed

`init` then handles the mounting and pivoting over to the final real root filesystem. If special drivers are needed before storage access, they must be included in the initramfs image.

---

## 🐧 Text-Mode Login

Near the end of the boot process, `init` starts a number of text-mode login prompts.

These allow the user to:
- Enter a username and password
- Gain access to a command shell

### On most systems:
- 6 text consoles and 1 graphical interface are started
- You can switch to text consoles using `Ctrl + Alt + F1` to `F6`
- GUI is usually available via `F7` or `F1`

The default shell is usually **bash** (GNU Bourne Again Shell), though others exist. Once logged in, the shell prints a prompt to accept user commands.

---

## 🐧 The Linux Kernel

The **boot loader** loads both the kernel and the `initramfs` into memory.

Upon loading:
- The kernel initializes memory
- Detects and configures hardware (CPU, I/O subsystems, storage, etc.)
- Loads necessary user space components

The root filesystem is mounted, and then the system proceeds to start the init process.

---

## 🐧 /sbin/init and Services

Once the kernel completes its tasks, it executes `/sbin/init`, which becomes the first user-space process (PID 1).

### Responsibilities of `init`:
- Starting essential services
- Managing user sessions
- Managing background processes
- Cleaning up after completed processes
- Restarting services as needed

Most other processes on a Linux system are descendants of `init`. Some kernel-level processes are started directly by the kernel itself.

![init](https://github.com/user-attachments/assets/242d2995-8eb4-474b-8532-2a09c365ba20)


### Traditional Startup: SysVinit
- Uses numbered **runlevels** to define system states (e.g., multi-user, single-user)
- Scripts in `/etc/init.d/` start/stop services
- Serial execution of boot scripts

---

## 🐧 systemd Features

All major Linux distributions now use **systemd**, which replaces SysVinit.

### Benefits:
- Faster boot times through **parallelization**
- Simplified **unit files** instead of complex scripts
- Manages the system as a whole: devices, sockets, mount points, timers

The `/sbin/init` binary is now a symbolic link to `/lib/systemd/systemd`.

### Common systemctl commands:
```bash
# Start, stop, or restart a service (e.g., httpd)
sudo systemctl start|stop|restart httpd.service

# Enable or disable a service at boot
sudo systemctl enable|disable httpd.service

# Check the status of a service
sudo systemctl status httpd.service
```
---

## 🐧 Filesystems

A **filesystem** is a method for storing and organizing data on a storage medium.

Just like a library uses shelves to organize books by topic, audience, or type, filesystems organize data logically for efficient access.

### Types of Linux-supported filesystems

- **Disk-based**: `ext3`, `ext4`, `XFS`, `Btrfs`, `JFS`, `NTFS`, `vfat`, `exFAT`
- **Flash-based**: `ubifs`, `jffs2`, `yaffs`
- **Database-style**: Specialized use cases
- **Special-purpose**: `procfs`, `sysfs`, `tmpfs`, `squashfs`, `debugfs`, `fuse`

![fs](https://github.com/user-attachments/assets/9fa19750-0db7-414f-8a4c-3de3acd6f4a3)

---

## 🐧 Partitions 

- A **partition** is a dedicated section of physical storage (e.g., `/dev/sda1`)
- A **filesystem** resides inside a partition

> A partition is like a container. A filesystem defines how files are organized within that container.

- A filesystem can span multiple partitions using techniques like symbolic links or volume management.

---

## 🐧 Filesystem Comparison: Windows vs Linux

| Category            | Windows        | Linux               |
|---------------------|----------------|---------------------|
| Partition Naming    | Disk1          | `/dev/sda1`         |
| Filesystem Type     | NTFS/VFAT      | ext3, ext4, XFS...  |
| Mounting Parameters | Drive Letters (C:) | Mount Points (`/`) |
| OS Base Folder      | `C:\`          | `/`                 |

---

## 🐧 Summary: Linux Boot Process Components

| Component     | Description                                      |
|---------------|--------------------------------------------------|
| POST          | Power-on self-test of hardware                   |
| BIOS/UEFI     | Firmware initialization, passes control to boot loader |
| Boot Loader   | Loads kernel and `initramfs` into memory         |
| Kernel        | Initializes system and mounts root filesystem    |
| init/systemd  | Starts all system and user-level services        |
| Filesystem    | Organizes and stores system and user data        |

---

![Sticker](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExcHJwMzNucnc4OWd6M2hycG85Z29iNXg2bnBob3piOGRtdWZnbWFxayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JncaPzecWR21pPDoTL/giphy.gif)
> Continue [rhcsa_linux_intern_guide.md](./rhcsa_linux_intern_guide.md).



