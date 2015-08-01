---
title: Berkeley Common Environment
subtitle: OSs, VMs, and BCE
minutes: 10
---

# Operating Systems & the Berkeley Common Environment

> ## Learning objectives
> 
> * Explain what operating systems are.
> * Explain the history and advantages of Unix.
> * Explain what a virtual machine is and why we use it.
> * Introduce the Berkeley Common Environment.

[Dav Clark](https://github.com/davclark) is teaching a group of 30 students how to do automated text analysis using Python. Everyone brought their own laptop, and in the audience Dav sees a MacBook Air, a Windows HP laptop, and a Google Chromebook, among others. 

Trying to get everyone to install Python and the requisite Python packages proves to be difficult. Some students have different versions of Python, which means that Dav's instructional code doesn't work for them. Dav spends most of his teaching time doing tech support -- helping students getting up and running with their own computers -- instead of teaching.

## Operating Systems and Unix

#### What is an Operating System?

An operating system is a suite of programs which make the computer work. It is a stable, multi-user, multi-tasking system for servers, desktops and laptops.

#### Unix

UNIX is an operating system which was first developed in the 1960s, and has been under constant development ever since. 

![Unix history](http://fc06.deviantart.net/fs70/i/2011/224/1/6/unix_history_by_legosz-d46a501.png)

#### Unix v. Windows

Unix has several fundamental differences compared with Windows:

* More rigorous security
* Extremely powerful command-line tools 
* Very stable
* Entirely different directory structure

#### Unix v. Apple OSX

OSX *is* Unix: A version called Darwin, based on [BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution). It comes packaged with all the necessary tools:
* The full suite of command-line tools in the **Terminal**
* An X11() server for graphics
* Secure shell and secure copy for working over networks 
* The C and FORTRAN compilers (in the Xcode toolset)

OSX is probably the best-designed commercial Unix variant for consumer use in operation today.

#### Unix v. Linux

Linux is a [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Unix-like operating system. It is the leading operating system on servers and other big iron systems such as mainframe computers and supercomputers, but is used on only around 1% of personal computers. Typically, Linux is packaged in a form known as *Linux distribution* such as the one in [Ubuntu](http://www.ubuntu.com/about/about-ubuntu).

## Key Components of Unix 

(Adapted from [Indiana University](https://kb.iu.edu/d/agat))

Unix has three main components

#### Kernel

The kernel of UNIX is the hub of the operating system: it allocates time and memory to programs and handles the filestore and communications in response to system calls. 

#### Shell

The shell is an interactive program that provides an interface between the user and the kernel. The shell interprets commands entered by the user or supplied by a shell script, and passes them to the kernel for execution. 

As an illustration of the way that the shell and the kernel work together, suppose a user types `rm myfile` (which has the effect of removing the file *myfile*). The shell searches the filestore for the file containing the program `rm`, and then requests the kernel, through system calls, to execute the program `rm` on *myfile*. When the process `rm myfile` has finished running, the shell then returns the UNIX prompt % to the user, indicating that it is waiting for further commands.

We'll talk more about shells in a little bit.

#### File system

Unix and Unix-like operating systems employ a hierarchical (i.e., inverted tree) directory structure, with the root directory (/) at the top. 

The standard file system has, among others, the following directories:

| Directory | Description |
| --------- | ----------- |
| /  | The root directory, where the whole tree starts |
| /bin  | Contains fundamental executables (i.e., binaries) generally used by all users on the system (e.g., chmod, cp, mv, grep, and tar) |
| /etc | Contains local configuration files, subdirectories containing configuration files for large software packages (e.g., the X11 window system) |
| /lib  | Contains shared libraries needed to boot the system and run the commands in the root file system |
| /tmp  | Local scratch space for storing temporary files, which may be deleted without notice |
| /usr/bin | The primary directory for most executables used by normal users on the system (e.g., emacs, make, scp, sftp, ssh, and yum) |
| usr/lib |Contains static and dynamic libraries, a few executables that usually are not invoked directly, and subdirectories for complex programs |

We'll also be talking more about files + directories.

## The Berkeley Common Environment

#### Virtual Machines

A **virtual machine (VM)** is an operating system OS or application environment that is installed on software which imitates dedicated hardware. The end user has the same experience on a virtual machine as they would have on dedicated hardware ([citation](http://searchservervirtualization.techtarget.com/definition/virtual-machine))

So a virtual machine is like using somebody else's computer on your very own laptop!

#### The Berkeley Common Environment (BCE)

The Berkeley Common Environment (BCE) is a standardized virtual machine (VM). It uses [VirtualBox](https://www.virtualbox.org/), Linux, and Ubuntu.

> BCE is designed for classwork and research in the sciences at Berkeley,
> broadly defined to include social science, life science, physical science, 
> and engineering. Using these tools, users can start up a virtual machine (
> VM) with a standardized Linux operating environment containing a set of 
> standard software for scientific computing. 

Why use BCE?

* Includes a number of standard scientific computing software such as Python, R, git, etc.
* No more obscure installation issues - download and run a single virtual machine or get the same environment on a bare metal or virtual server.
* Good for teaching - when you tell a student that a program behaves a certain way, it does!
* Good for research collaboration - now all of your collaborators can run your code without complex installation instructions.

[Install BCE using the instructions found here](http://ucberkeley.github.io/bce-documentation/laptop-installation.html)

#### Using BCE

BCE is like working on a completely different computer. So there are some things to remember:

**You will have different files.**

One useful thing will be to share folders between the VM and the host machine so that you can access the files on your computer from the VM. Do the following:

1. Got to “Devices > Shared Folder Settings” and click on the icon of a folder with a “+” on the right side.
2. Select a folder to share, e.g. your home directory on your computer by clicking on “Folder Path” and choosing “Other” and navigating to the folder of interest. For our purposes here, assume we click on “Documents”.
3. Click “make permanent” and “auto-mount” and then click “Ok”.
4. Reboot the machine by going to applications button on the left of the top toolbart, clicking on “Log Out”, and choosing “Restart” in the window that pops up.
5. Once the VM is running again, click on the “Shared” folder on the desktop. You should see the folder “sf_Documents” (or whatever the folder name you selected was, in place of “Documents”). You can drag and drop files to manipulate them.
6. Alternatively, from the Terminal, you can also see the directory by doing “cd ~/Desktop/shared/sf_Documents” and then “ls” will show you the files. Be careful: unless you selected “read only” at the same time as “make permanent”, any changes to the shared folder on the VM affects the folder in the real world, namely your computer.

**Your keyboard may be weird**

If you're use to a Mac, CMD+C will no longer work. Use CTRL+C instead.

## Exercises

#### Challenge 1

1. Make a duplicate of a folder on your regular computer. 
2. Add the copy you just made as a shared folder to your BCE VM. 

#### Challenge 2

1. Open up a text a file in your shared folder. Make an edit and save.
2. Now go back to your regular machine. Did the edit appear? Why or why not?


