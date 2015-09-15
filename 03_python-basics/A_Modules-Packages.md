#Python Basics: Modules and Packages

As your program gets longer, you may want to split it into several files for easier maintenance. You may also want to use a handy function that you’ve written in several programs without copying its definition into each program.

To support this, Python has a way to put definitions in a file and use them in a script or in an interactive instance of the interpreter. Such a file is called a **module**. In other words, modules in Python are simply Python files with the `.py` extension, which implement a set of functions. Modules are imported from other modules using the `import` command. 

A **package** is just a collection of modules that are bundled together. Think of packages like a directory, with modules as files in that directory. 

One of the key features of Python is that the actual core language is fairly small. This is an intentional design feature to maintain simplicity. Much of the powerful functionality comes through external modules and packages.

> #### Finding Packages
> 
> Why reinvent the wheel? A key part of programming in Python is finding
> the relevant package that allows you to do what you want without
> having the write the code yourself.
> 
> To find packages, just google search `python package blah blah blah`
> 
> Alternatively, the [Python Package Index](http://pypi.python.org/pypi) is 
> the main repository for 3rd party Python packages (about 14000 packages and 
> growing).
> 
> When you find some package on the web, look for a few things:
> * Good modern-looking documentation with examples
> * Installs easily without lots of dependencies (or has detailed installation 
> instructions)
> * Actively developed

## Package installation

Anaconda already comes with many of the packages you need. To see if you have a package installed, simply go to into a Python interpreter and enter:

~~~bash
import [packagename]
help([packagename])
~~~

If the package is installed, a help file should print.

There are two standard methods for installing a package.

**pip install**

The `pip install` script shoudl be available in Anadonda and is very easy to use (when it works). To run it, go into your shell and (from any directory) enter:

~~~
$ pip install [package name]
~~~

If supplied with a package name then it will query the PyPI site to find out about that package. Assuming the package is there then `pip install` will automatically download and install the package.

**python setup.py install**

Some packages may fail to install via pip install. Most often there will be some obvious (or not) error message about compilation or missing dependency. 

In this case the likely next step is to download the installation `tar` file from whatever website you found it, and untar (unzip) it. Go into the package directory and look for files like:

~~~
INSTALL
README
setup.py
setup.cfg
~~~

If there is an INSTALL or README file then hopefully you will find useful installation instructions. Most well-behaved python packages do the installation via a standard setup.py script. This is used as follows:

~~~
$ python setup.py --help  # get options
$ python setup.py install # install in the python area (root / admin req'd)
$ python setup.py install --user # install to user's package area
$ More information is available in the Installing Python Modules page.
~~~

> #### Sudo!!!
> 
> If you run into permissions problems when installing something, try adding
> `sudo` before it, as in `sudo pip install [package name]`
>

For more on packages and modules, including what to do if you have multiple Python's on your computer: 

* [official documentationn](https://docs.python.org/2/tutorial/modules.html)
* [another helpful resource](https://python4astronomers.github.io/installation/packages.html)