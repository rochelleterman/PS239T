#Setup

To participate in PS239T, you will need access to the software described below. In addition, you will need an up-to-date web browser.

Once you've installed all of the software below, test your installation by following the instructions below (Moved here from the Etherpad).

## The Bash Shell
Bash is a commonly-used shell that gives you the power to do simple tasks more quickly.

#### Windows

Install Git for Windows by downloading and running the [installer](http://msysgit.github.io/). This will provide you with both Git and Bash in the Git Bash program.

#### Mac OS X

The default shell in all versions of Mac OS X is bash, so no need to install anything. You access bash from the Terminal (found in `/Applications/Utilities`). You may want to keep Terminal in your dock for this class.

#### Linux

The default shell is usually Bash, but if your machine is set up differently you can run it by opening a terminal and typing bash. There is no need to install anything.

## Git
Git is a version control system that lets you track who made changes to what when and has options for easily updating a shared or public version of your code on github.com. You will need a supported web browser (current versions of Chrome, Firefox or Safari, or Internet Explorer version 9 or above).

####Windows

Git should be installed on your computer as part of your Bash install (described above).

####Mac OS X

**For OS X 10.9 and higher**, install Git for Mac by downloading and running the most recent "mavericks" installer from [this list](http://sourceforge.net/projects/git-osx-installer/files/). After installing Git, there will not be anything in your `/Applications` folder, as Git is a command line program. **For older versions of OS X (10.5-10.8)** use the most recent available installer labelled "snow-leopard" available [here](http://sourceforge.net/projects/git-osx-installer/files/).

####Linux

If Git is not already available on your machine you can try to install it via your distro's package manager. For Debian/Ubuntu run sudo apt-get install git and for Fedora run sudo yum install git.

##Text Editors
When you're writing code, it's nice to have a text editor that is optimized for writing code, with features like automatic color-coding of key words. The default text editor on Mac OS X and Linux is usually set to Vim, which is not famous for being intuitive. if you accidentally find yourself stuck in it, try typing the escape key, followed by `:q!` (colon, lower-case 'q', exclamation mark), then hitting Return to return to the shell.

For this class, we use **nano** as a default in the terminal. But I also really like [Sublime Text](https://www.sublimetext.com/) to write markdown and other basic text files. I recommend you download both.

####Windows

nano is a basic editor and the default that we use in this class. To install it, download the `Software Carpentry Windows installer`[http://files.software-carpentry.org/SWCarpentryInstaller.exe] and double click on the file to run it. **This installer requires an active internet connection.**

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

####Mac OS X

nano is a basic editor and the default that we use in this class. It should be pre-installed.

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

####Linux

nano is a basic editor and the default that we use in this class. It should be pre-installed.

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

##Python
Python is a popular language for scientific computing, and great for general-purpose programming as well. Installing all of its scientific packages individually can be a bit difficult, so we recommend an all-in-one installer.

Regardless of how you choose to install it, please make sure you install Python version 2.x and not version 3.x (e.g., 2.7 is fine but not 3.4). Python 3 introduced changes that will break some of the code we teach during the workshop.

We will teach Python using the IPython notebook, a programming environment that runs in a web browser. For this to work you will need a reasonably up-to-date browser. The current versions of the Chrome, Safari and Firefox browsers are all supported (some older browsers, including Internet Explorer version 9 and below, are not).

####Windows

* Download and install [Anaconda](https://store.continuum.io/cshop/anaconda/).
* Download the default Python 2 installer (do not follow the link to version 3). Use all of the defaults for installation except make sure to check **Make Anaconda the default Python.**

####Mac OS X

* Download and install [Anaconda](https://store.continuum.io/cshop/anaconda/).
* Download the default Python 2 installer (do not follow the link to version 3). Use all of the defaults for installation.

####Linux

We recommend the all-in-one scientific Python installer [Anaconda](http://continuum.io/downloads.html). (Installation requires using the shell and if you aren't comfortable doing the installation yourself just download the installer and we'll help you during the class.)

1. Download the installer that matches your operating system and save it in your home folder. Download the default Python 2 installer (do not follow the link to version 3).
2. Open a terminal window.
3. Type `bash Anaconda-` and then press tab. The name of the file you just downloaded should appear.
4. Press enter. You will follow the text-only prompts. When there is a colon at the bottom of the screen press the down arrow to move down through the text. Type `yes` and press enter to approve the license. Press enter to approve the default location for the files. Type `yes` and press enter to prepend Anaconda to your `PATH` (this makes the Anaconda distribution the default Python).

##R

[R](http://www.r-project.org/) is a programming language that is especially powerful for data exploration, visualization, and statistical analysis. To interact with R, we use [RStudio](http://www.rstudio.com/.

####Windows

Install R by downloading and running [this .exe file from CRAN](http://cran.r-project.org/bin/windows/base/release.htm). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

####Mac OS X

Install R by downloading and running [this .pkg file from CRAN](http://cran.r-project.org/bin/macosx/R-latest.pkg). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

####Linux

You can download the [binary files](http://cran.r-project.org/index.html) for your distribution from CRAN. Or you can use your package manager (e.g. for Debian/Ubuntu run `sudo apt-get install r-base` and for Fedora run `sudo yum install R`). Also, please install the [RStudio IDE](http://www.rstudio.com/ide/download/desktop).

##Testing your installation

If you have trouble with installation, please come to the Installfest [TBD].

Open a command line window ('terminal' or, on windows, 'git bash'), and enter the following commands (without the $ sign): 

```bash
$ git --version
$ python --version
$ nano --version
```

If git and python and nano (a text editor) have been installed, those commands *should* print output version information. The python version should include "Anaconda" and its version information.

Ipython is a python development environment that comes pre-installed with the Anaconda python distribution. To see if you have it, type the following into your terminal window:

```bash
$ ipython notebook
```

This should open a programming interface in your default web browser. It may take a few minutes the first time. To close, just close your browser and then `CTRL-C` to end the process in the command line.

Software Carpentry maintains a list of common issues that occur during installation may be useful for our class here: [Configuration Problems and Solutions wiki page.](https://github.com/swcarpentry/workshop-template/wiki/Configuration-Problems-and-Solutions)

Credit: Thanks to [Software Carpentry](http://software-carpentry.org/workshops/) for providing installation guidelines.