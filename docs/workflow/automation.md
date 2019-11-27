# Automation

## Make

If you've followed the [installation guide properly](../setup/make.md), you have `make` installed on your computer.

`Make` helps you to automize 

- what code is executed and when, and

- what inputs a given script needs to run.

## An Illustration of a Typical Workflow using `make`

### Basics

Imagine you have three raw data sets in Excel, that you wish to convert into csv files and then merge. Finally, you want to analyze the data using an OLS regression, and produce some plots, and put the results in a PDF document.

This workflow can be visualized as follows:

![Workflow](make_flowchart.png)

In `make`, the worflow collapses to a set of rules, which are structured as follows:

```bash
target : source(s) 
    execution command
```

A *target* refers to **what** needs to be build (e.g., a file),
*source(s)* specify what is **required** to execute the build, and
the *execution command* specifies **how** to execute the build.

### Translating the Pipeline into `make` Code

In "make code", the workflow above - saved in a *makefile* (a file called `makefile`, without a file type ending) - will become:

```bash

../temp/cleaned_data1.csv ../temp/cleaned_data2.csv ../temp/cleaned_data3.csv: ../input/raw_data1.xlsx ../input/raw_data2.xlsx ../input/raw_data3.xlsx python to_csv.py
   	python to_csv.py
	
../temp/merged.csv: ../temp/cleaned_data1.csv ../temp/cleaned_data2.csv ../temp/cleaned_data3.csv merge.R
   	R --vanilla --args "" < "merge.R"

../temp/analysis.RData: ../temp/merged.csv analyze.R
   	R --vanilla --args "" < "analyze.R"

../temp/plot.png: ../temp/merged.csv plot.R
   	R --vanilla --args "" < "plot.R"

../output/report.pdf: ../temp/plot.png ../temp/analysis.RData
	R -e "rmarkdown::render('make_report.Rmd', output_file = '../output/report.pdf')"

```

!!! hint
	Pay attention to the subdirectory structure used here: the rules refer to files in different folders (code, temp, input, output, audit), which are explained [earlier in this guide](directories.md).

### Running `make` 

You can run the workflow by typing `make` in the directory where the `makefile` is located.
If you type `make -n`, the code will not be executed, but you only are shown a set commands
`make` *would* execute if it was run (so you can check what files need to be re-built).

## Some examples of when `make` becomes useful

- You have a script that takes a very long time to build a dataset 
(let's say a couple of hours), and another script that runs an analysis on it.
You only would like to produce a new dataset if actually code to make that dataset has changed. 
Using `make`, your computer will figure out what code to execute to get you your final analysis.

- You want to run a robustness check on a larger sample, using a virtual computer you have rented in the cloud.
To run your analysis, you would have to spend hours of executing script after script to make sure the project runs the way you want.
Using `make `, you can simply ship your entire code off to the cluster, change the sample size, and wait for the job to be done.


## Make versus ...

### Readme.txt

A `readme.txt` - or, in other words, a plain text file with some documentation - is great. 
They are very useful to provide an overview about what the project is
about, and many researchers also use them to explain in which order to run scripts. But then again, 
you would have to execute that code manually. 

### A bash script

What you see with other researchers is that they put the running instructions into a bash script, 
for example a `.bat` file on Windows. Such a file is helpful because it makes the order of 
execution *explicit*, but such a file will always build *everything*. Especially in data-intensive
projects, though, you would exactly want to avoid that to make quick progress.

Generally, `make` is preferred over a `readme.txt` - but better have a `readme.txt` than no documentation at all.

!!! summary
	
	With `make`, we 

	- explicitly document the workflow, making communication with colleagues (and especially our future selves) more efficient,

	- can reproduce the entire workflow with one command,

	- keep track of complicated file dependencies, and

	- are kept from *repeating* typos or mistakes - if we stick to using `make` everytime
	we want to run our project, then we *must* correct each mistake before we can continue.

## Want to know more?

This open source book explains you all the bells and whistles about using `make`. Definitely recommended!

* Mecklenburg, R. (2004). [Managing Projects with GNU Make: The Power of GNU Make for Building Anything.](https://www.oreilly.com/openbook/make3/book/index.csp)), O'Reilly Media, Inc.


<!--



- We have three raw data sets (.xlsx)

- We want to convert these files to .csv files

- We want to merge all three files

- We want to analyze the data using an OLS regression

- We want to produce plots

- We want to combine those into a PDF

- We need to clean this data - to do so, we have one code file


