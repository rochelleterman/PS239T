---
title: The Unix Shell
subtitle: Python and Beyond
minutes: 15
---

# Python and Beyond

> ## Learning Objectives
>
> *   Explain how the shell relates to other programs like Python.
> *   Open a Python interpreter from the shell.
> *   Run a Python script from the shell.
> *   Explain the importance of IDE's and program-specific tools.
> *   Find which version of Python is used by the interpreter.
> *   Explain what Python modules and packages are
> *   Install Python packages from the shell.

Why are we doing all this shell stuff? After all, anyone who wants to rename several thousand data files can easily do so interactively in the Python interpreter, and anyone who's doing serious data analysis is probably going to do most of their work inside the IPython Notebook or R Studio. In fact, many of you are here to prepare for programming in Python or R. So why teach the shell?

The first answer is, "Because it's an easy way to introduce some fundamental ideas about how to use computers." As we learn how to use the Unix shell, we also learn we should get the computer to repeat things (via tab completion, `!` followed by a command number, and `for` loops) rather than repeating things ourselves. We also learn to take things we've discovered we do frequently and save them for later re-use (via shell scripts), to give things sensible names, and to write a little bit of documentation (like comment at the top of shell scripts) to make our future selves' lives better.

The second answer is, "Because so much else depends on it." Installing software, configuring your default editor, and controlling remote machines frequently assume a basic familiarity with the shell, and with related ideas like standard input and output. Many tools also use its terminology (for example, the `%ls` and `%cd` magic commands in IPython).

Thus, if you want to learn Python or some other programming language, you need some familiarity with the Shell. 

### Running Python in Shell: Interactive Mode

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

### Running Python in Shell: Normal Mode

Python has two basic modes: normal and interactive. Interactive mode allows you to test out and see what Python will do. If you ever feel the need to play with new Python statements, go into interactive mode and try them out.

If you quit from the Python interpreter and enter it again, the definitions you just made (functions and variables) are lost. Therefore, if you want to write a somewhat longer program, you are better off using a text editor to prepare the input for the interpreter and running it with that file as input instead. This is known as creating a **script** (just like the shell scripts we created earlier).

The normal mode is the mode where the scripted and finished .py files are run in the Python interpreter. To run a program, make sure you're in bash mode in your terminal (the default mode), `cd` into the directory in which the Python program (.py file) is located, and then enter the command `python [name of file]`. Here's an example:

~~~
$ cd ~/programming-fundamentals
$ python madlib.py
~~~

Once the program ends, it will give a `$` prompt, returning to bash mode. If you want to keep it in interactive python mode, add the `-i` flag:

~~~
$ cd ~/programming-fundamentals
$ python -i madlib.py
~~~

Now once the program ends, it will give you a `>>>` prompt, meaning it's now in interactive python mode.

### Modules and Packages

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
> * Installs easily without lots of dependencies (or has detailed installation instructions)
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

### IDEs and other Tools

A shell is all you need to use Python. But it's not exactly ideal. We can't easily write and edit scripts as we go. It's not very pretty. There are no debugging tools. That's why most people who use Python use an IDE.

An interpreter is embedded in a number of larger programs that allow people to develop Python programs. Such an environment is called an integrated development environment or interactive development environment (IDE). An IDE  is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of a source code editor, build automation tools and a debugger. Some of them come with package managers and other features, too.

There are many Python IDE's. You can see a comparison [here](https://en.wikipedia.org/wiki/Comparison_of_integrated_development_environments#Python)

> #### Don't forget me quite yet
> 
> Even if you use an IDE, you'll be hard pressed to avoid the shell the rest
> of your life. When it comes to package installation, `pip install` via
> the shell is still the easiest way. 

The Python Intensive training will be covering Python tools in more detail. But some worth mentioning now:

**PyCharm**

[PyCharm](https://www.jetbrains.com/pycharm/) is a Python IDE that is included in BCE. PyCharm is what we'll be using for the Python Intensive training.

**IPython**

[IPython](http://ipython.org/) provides a rich toolkit to help you make the most out of using Python interactively. It includes a web-based notebook (Ipython Notebooks) with the same core features but support for rich media, text, code, mathematical expressions and inline plots. If you're familiar with R, it's kind of like R Markdown. 

You can check out some cool notebooks [here](http://nbviewer.ipython.org/)

IPython is included in BCE. To start a notebook, simply type `ipython notebook` into the shell.

**Canopy**

[Canopy](https://www.enthought.com/products/canopy/) is a Python distribution that gives you Python, an IDE, and all the standard packages one needs for scientific analysis. 

> #### Editors v. IDEs
> 
> Notepad++, Vim, SublimeText etc are text editors. They is not specific 
> to Python, or to any other language. They are not an IDE. That said, 
> these editors are extensible, and through the use of plugins they allow the 
> user to implement IDE like functionality for as broad a range of languages 
> or syntaxes as plugin writers care to cover.

## Rochelle's Pipeline

Did you forget about Rochelle's text analysis project? She had to:

1.  Combine all the bulk downloads from LexisNexis into one file.
2.  Parse the articles by putting each article into a row, and each field (BYLINE, LENTH, text, etc) into its own column.
3.  Analyze, publish, get a great tenure track job, and retire early.

So far she's done #1. The file all.txt is in the programming-fundamentals/data/new-york-times/2015-01-01 directory, and contains all of the text files.

How does she do #2? That seems tough. She could take Dav Clark's Python Intensive course and learn how to program a script that would do it for her. Or she could get somebody else to write the code for her.

Rochelle's pretty lazy, so she's going for option #2.

She goes into her web browser and googles `python lexisnexis`. Sure enough, the first results is [Neal Caren's website](http://nealcaren.web.unc.edu/cleaning-up-lexisnexis-files/). Neal Caren in an assistant professor of Sociology at the University of North Carolina, Chapel Hill. He wrote a small Python [script](http://www.unc.edu/~ncaren/haphazard/split_ln.py) that converts a plain text file into a comma-separated values (CSV) file - exactly what Rochelle's needs!

Rochelle reads Neal Caren's website to make sure that she's allowed to use his script. Since Neal put the code but doesn't give a license, Rochelle is going to assume a standard open source license: use, but credit.

Rochelle then downloads the script and takes a quick look at it. The opening comments gives sample usage:

~~~
sample usage:
$ python split_ln.py ap_tp_201201.txt
Processing ap_tp_201201.txt
Done
~~~

So Rochelle tries it out. First  has to put the python script in the same directory as her text files. Then she can run the script on all.txt using Python's normal mode.

#### Challenge

Run Rochelle's final task above. What output did you get? Did it work? Why or why not? (Hint: Read Neal Caren's webpage explaining possible glitches.)

Other fun text analysis programs in python:

* [Another LexisNexis parser with more options](https://github.com/alexstorer/lexisparse)
* [Python wrapper for the New York Times article API](https://github.com/evansherlock/nytimesarticle)
