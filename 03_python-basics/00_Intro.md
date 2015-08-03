---
title: Python Basics
subtitle: Introduction and Running Python
---

# Introduction

This unit provides a basic introduction to Python. By the end of the day, you should be able to:

1. Run Python from both the Shell and in an IPython Notebook
2. Write basic commands using Python syntax
3. Grasp the major Python object types, including integers, floats, strings, lists, sets, and dictionaries
4. Operate and manipulate those objects
5. Integrate choices into your programs using conditionals
6. Re-use code by creating functions
7. Repeat actions through loops

# Running Python

> ## Learning Objectives
>
> *   Explain how the shell relates to other programs like Python.
> *   Open a Python interpreter from the shell.
> *   Run a Python script from the shell.
> *   Understand the importance of IDE's and program-specific tools.
> *   Find which version of Python is used by the interpreter.
> *   Explain what Python modules and packages are.
> *   Install Python packages from the shell. 

## Running Python in Shell: Interactive Mode

Remember that shell's job is to run other programs rather than to do calculations itself. In the previous lessons, we were using shell as the interface between us and the UNIX operating system.

But we can also use shell to interact with other programs. For example, we can run a Python interpreter right in shell. An **interpreter** is a program that reads and executes code. This includes source code and scripts. 

~~~ {.input}
$ python
~~~
~~~ {.output}
Python 2.7.6 (default, Mar 22 2014, 22:59:56) 
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
~~~

The `>>>` is Python's way of telling you that you are in **interactive mode**. In interactive mode, what you type is immediately run. 

~~~
>>> 5
5
>>> print (5*7)
35
>>> "hello" * 4
'hellohellohellohello'
>>> type("hello")
<type 'str'>
~~~

Interactive mode is a command line shell which gives immediate feedback for each statement, while running previously fed statements in active memory. As new lines are fed into the interpreter, the fed program is evaluated both in part and in whole.

~~~
>>> the_world_is_flat = 1
>>> if the_world_is_flat==1:
...     print "Be careful not to fall off!"
...
Be careful not to fall off!
~~~

The `...` tells us that Python doesn't think the statement or command is complete. 

Be sure to end each command (even multi-line statements like the one above) with the Enter key. You should see an output and/or the `>>>` prompting you to enter another command.

To escape the Python interpreter and go back to Shell, type 

~~~
>>> quit()
$
~~~

Notice that the terminal window will go back to bash, giving you a `$` prompt.

> #### Which Python?
> 
> Python, like other programs, come in versions. And with each version, the
> features may change. That means that running code made for Python 2 might
> not work on Python 3. This is one of the motivations behind BCE -
> to standardize software versions for teaching, etc.
> 
> To see which version of Python you have, enter the command `which python` in 
> bash. You can use the `which` command with other programs, too.

## Running Python in Shell: Normal Mode

Python has two basic modes: normal and interactive. Interactive mode allows you to test out and see what Python will do. If you ever feel the need to play with new Python statements, go into interactive mode and try them out.

If you quit from the Python interpreter and enter it again, the definitions you just made (functions and variables) are lost. Therefore, if you want to write a somewhat longer program, you are better off using a text editor to prepare the input for the interpreter and running it with that file as input instead. This is known as creating a **script** (just like the shell scripts we created earlier).

The normal mode is the mode where the scripted and finished .py files are run in the Python interpreter. To run a program, make sure you're in bash mode in your terminal (the default mode), `cd` into the directory in which the Python program (.py file) is located, and then enter the command `python [name of file]`. Here's an example:

~~~
$ cd ~/PS239T/python-basics
$ python madlib.py
~~~

Once the program ends, it will give a `$` prompt, returning to bash mode. If you want to keep it in interactive python mode, add the `-i` flag:

~~~
$ python -i madlib.py
~~~

Now once the program ends, it will give you a `>>>` prompt, meaning it's now in interactive python mode.

## Modules and Packages

As your program gets longer, you may want to split it into several files for easier maintenance. You may also want to use a handy function that you’ve written in several programs without copying its definition into each program.

To support this, Python has a way to put definitions in a file and use them in a script or in an interactive instance of the interpreter. Such a file is called a **module**. In other words, modules in Python are simply Python files with the `.py` extension, which implement a set of functions. Modules are imported from other modules using the `import` command. (You'll learn more about functions and importing in the Python Intensive).

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

BCE already comes with many of the packages you need. To see if you have a package installed, simply go to into a Python interpreter and enter:

~~~
import [packagename]
help([packagename])
~~~

If the package is installed, a help file should print.

There are two standard methods for installing a package.

**pip install**

The `pip install` script is available in BCE and is very easy to use (when it works). To run it, go into your shell and (from any directory) enter:

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

## IDEs and other Tools

A shell is all you need to use Python. But it's not exactly ideal. We can't easily write and edit scripts as we go. It's not very pretty. There are no debugging tools. That's why most people who use Python use an IDE.

An interpreter is embedded in a number of larger programs that allow people to develop Python programs. Such an environment is called an integrated development environment or interactive development environment (IDE). An IDE  is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of a source code editor, build automation tools and a debugger. Some of them come with package managers and other features, too.

There are many Python IDE's. You can see a comparison [here](https://en.wikipedia.org/wiki/Comparison_of_integrated_development_environments#Python)


> #### Editors v. IDEs
> 
> Notepad++, Vim, SublimeText etc are text editors. They is not specific 
> to Python, or to any other language. They are not an IDE. That said, 
> these editors are extensible, and through the use of plugins they allow the 
> user to implement IDE like functionality for as broad a range of languages 
> or syntaxes as plugin writers care to cover.

## IPython

This course will be using [IPython](http://ipython.org/) extensively. IPython provides a rich toolkit to help you make the most out of using Python interactively. It includes a web-based notebook (IPython Notebooks) with the same core features but support for rich media, text, code, mathematical expressions and inline plots. 

You can check out some cool notebooks [here](http://nbviewer.ipython.org/)

IPython is included in the Anaconda distribution. To start a notebook server, simply type `ipython notebook` into the shell.

Let's get programming!

