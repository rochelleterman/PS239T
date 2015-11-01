# Python Basics: 0-2 Running Python

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

~~~python
$ python

Python 2.7.6 (default, Mar 22 2014, 22:59:56) 
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
~~~

The `>>>` is Python's way of telling you that you are in **interactive mode**. In interactive mode, what you type is immediately run. 

~~~python
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

~~~python
>>> the_world_is_flat = 1
>>> if the_world_is_flat==1:
...     print "Be careful not to fall off!"
...
Be careful not to fall off!
~~~

The `...` tells us that Python doesn't think the statement or command is complete. 

Be sure to end each command (even multi-line statements like the one above) with the Enter key. You should see an output and/or the `>>>` prompting you to enter another command.

To escape the Python interpreter and go back to Shell, type 

~~~python
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

~~~bash
$ cd ~/PS239T/03_python-basics
$ python madlib.py
~~~

Once the program ends, it will give a `$` prompt, returning to bash mode. If you want to keep it in interactive python mode, add the `-i` flag:

~~~bash
$ python -i madlib.py
~~~

Now once the program ends, it will give you a `>>>` prompt, meaning it's now in interactive python mode.

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

