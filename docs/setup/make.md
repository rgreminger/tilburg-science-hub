# Reproducible Research with Make

Make is a tool that will allow us to control the execution of a set of command line statements.
We will use make to automate the execution of our research projects with a "single click" so that our entire work flow is reproducible.

## Installation Guide

### For Windows Users

We will install Make so that it plays nicely within CygWin.
Its time to go back to the **setup-x86_64.exe** we told you not to delete. We will use it to install make.
Proceed as follows:

* Click through the installation until you arrive at the page "Select packages."
* Type make into the search function and wait for the results to be filtered.
* Click the '+' next to "Devel" and then find the following lines:
    * make
    * gcc-tools-epoch1-automake
    * gcc-tools-epoch2-automake
 and then click on the word 'Skip' located next to each of these. 'Skip' should then be replaced with some numbers (the version which we will install).
 * Now click on "Next" in the bottom right corner and continue accepting all options until the installation is complete.

### For Mac Users

Installation of the command line toold for X-code that you previously completed has installed make for you.

### For Linux Users

Make is pre-installed on Linux operating systems so there is nothing to be done.


## Verifying Your Installation

To check that Make is installed and working correctly, open a terminal session and type (then hit the return key):

    make

If everything is working correctly, you should get the following output:

    make: *** No targets specified and no makefile found.  Stop.
