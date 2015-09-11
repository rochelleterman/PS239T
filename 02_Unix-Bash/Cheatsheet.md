---
title: Programming Fundamentals
subtitle: Reference
---

# Summaries and Resources

## [Unix](01_unix.md)

*   An operating system is a suite of programs which make the computer work.
*   UNIX is an very popular operating system, used on Macs and bunch of others.
*   UNIX has a kernel, file system, and programs.
*   Linux is an open source Unix-like system
*   Unix has three main components: kernael, shell, and file system.

## [Introducing the Shell](02_shell.md)

*   A shell is a program whose primary purpose is to read commands and run other programs.
*   The shell's main advantages are its high action-to-keystroke ratio,
    its support for automating repetitive tasks,
    and that it can be used to access networked machines.
*   The shell's main disadvantages are its primarily textual nature
    and how cryptic its commands and operation can be.

## [Files and Directories](03_filedir.md)

*   The file system is responsible for managing information on the disk.
*   Information is stored in files, which are stored in directories (folders).
*   Directories can also store other directories, which forms a directory tree.
*   `cd path` changes the current working directory.
*   `ls path` prints a listing of a specific file or directory;
    `ls` on its own lists the current working directory.
*   `pwd` prints the user's current working directory.
*   `whoami` shows the user's current identity.
*   `/` on its own is the root directory of the whole filesystem.
*   A relative path specifies a location starting from the current location.
*   An absolute path specifies a location from the root of the filesystem.
*   Directory names in a path are separated with '/' on Unix, but '\\' on Windows.
*   '..' means "the directory above the current one";
    '.' on its own means "the current directory".
*   Most files' names are `something.extension`.
    The extension isn't required,
    and doesn't guarantee anything,
    but is normally used to indicate the type of data in the file.
*   Most commands take options (flags) which begin with a '-'.
*   `~` stands for the user's home directory. Use it at the beginning of a path, like `~/path/to/file`
*   If you type enough letters of your command or argument, then you can press tab to have it automatically completed. 
	Double tab displays all the available options.
*	Up Arrow displays last command in the command line.
*	Copy a file/directory in the GUI and paste them into the command line to give the file/directory's full path.


## [Creating Things](04_create.md)

*   `cp old new` copies a file.
*   `mkdir path` creates a new directory.
*   `mv old new` moves (renames) a file or directory.
*   `rm path` removes (deletes) a file.
*   `rmdir path` removes (deletes) an empty directory.
*   `touch path` creates an empty file if it doesn't already exist.
*   Unix documentation uses '^A' to mean "control-A".
*   The shell does not have a trash bin: once something is deleted, it's really gone.
*   Nano is a very simple text editor --- please use something else for real work.
*   `*` is a wildcard. It matches zero or more characters
*   Naming/structuring your files and directories in a systematic way is important. 

## [Pipes and Filters](05_pipe.md)

*   `cat` displays the contents of its inputs.
*   `head` displays the first few lines of its input.
*   `tail` displays the last few lines of its input.
*   `sort` sorts its inputs.
*   `uniq` reports or filters out repeated lines in a file.
*   `wc` counts lines, words, and characters in its inputs.
*   `command > file` redirects a command's output to a file.
*   `first | second` is a pipeline: the output of the first command is used as the input to the second.
*   The best way to use the shell is to use pipes to combine simple single-purpose programs (filters).

## [Loops](06_loop.md)

*   `history` displays recent commands, and `!number` to repeat a command by number.
*   A `for` loop repeats commands once for every thing in a list.
*   Every `for` loop needs a variable to refer to the current "thing".
*   Use `$name` to expand a variable (i.e., get its value).
*   Do not use spaces, quotes, or wildcard characters such as '*' or '?' in filenames, as it complicates variable expansion.
*   Give files consistent names that are easy to match with wildcard patterns to make it easy to select them for looping.
*   Use the up-arrow key to scroll up through previous commands to edit and repeat them.
*   Use `history` to display recent commands, and `!number` to repeat a command by number.

## [Shell Scripts](07_scripts.md)

*   Save commands in files (usually called shell scripts) for re-use.
*   `bash filename` runs the commands saved in a file.
*   `$*` refers to all of a shell script's command-line parameters.
*   `$1`, `$2`, etc., refer to specified command-line parameters.
*   `$@` refer to all command-line parameters. Especially helpful for wildcards.
*   Place variables in quotes if the values might have spaces in them.
*   Letting users decide what files to process is more flexible and more consistent with built-in Unix commands.

## Finding Things: (Not covered, but helpful)

*   `find` finds files with specific properties that match patterns.
*   `grep` selects lines in files that match patterns.
*   `man command` displays the manual page for a given command.
*   `*` matches zero or more characters in a filename, so `*.txt` matches all files ending in `.txt`.
*   `?` matches any single character in a filename, so `?.txt` matches `a.txt` but not `any.txt`.
*   `$(command)` inserts a command's output in place.
*   Find the whole lesson [here](http://software-carpentry.org/v5/novice/shell/06-find.html)

## [Getting Help](08_Help.md)

*   Don't learn specific programming languages; learn *how to program*
*   Most of your programming will be spent debugging, looking things up on the internet, and testing. 
*   Google errors!


## Glossary

absolute path
:  or a full path, points to the location of a filesystem object (i.e.,file, directory or link) in a file system regardless of the current working directory. It must contain the root directory.

argument
:   FIXME

command shell
:   FIXME

command-line interface
:   FIXME

comment
:   text added to code syntax which is ignored by the computer/compiler but provides guidance to coders for debuging and review.  Generally specifies the purpose of following code as well as helpful hints

current working directory
:   FIXME

file system
:   FIXME

filename extension
:   FIXME

filter
:   FIXME

flag
:   FIXME

graphical user interface
:   FIXME

home directory
:   FIXME

loop
:   FIXME

loop body
:   FIXME

orthogonal
:   FIXME

parent
:   FIXME

pipe
:   FIXME

process
:   FIXME

prompt
:   FIXME

quoting
:   FIXME

read-evaluate-print loop
:   FIXME

redirect
:   FIXME

regular expressions
:   FIXME

relative path
:   FIXME

root directory
:   FIXME

shell script
:   FIXME

standard input
:   FIXME

standard output
:   FIXME

sub-directories
:   FIXME

tab completion
:   FIXME

uniq
:   FIXME

variable
:   FIXME

wildcard
:   a meta-character, usually an asterisk, that allows a coder to search for an object, directory, etc. without specifying a full path. For instance, if one searches for Desktop/D*, that search will return all folders and items on the desktop that begin with a capital letter 'D.' 
