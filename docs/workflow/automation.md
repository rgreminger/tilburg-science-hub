# Automating your Pipeline

## Make

If you've followed the [installation guide properly](../setup/make.md), you have `make` installed on your computer.

`Make` is a build tool used by software developers to compile computer code into programs that you can install. For us
researchers, `make` can be used to automate

- what code runs and when, and

- what inputs a given script needs to run.

## An Illustration of a Typical Workflow using `make`

### Basics

Remember the different stages of a project's pipeline, explained earlier. Let's suppose
we're in the process of preparing our data set for analysis. For example:

- You have three raw data sets in Excel that you wish to convert into CSV files.
- You want to merge these three CSV files and apply some cleaning steps.
- Finally, you want to save the final data set, so that it can be used by
  other stages of your project pipeline (e.g., such as the analysis).

This workflow for your specific pipeline can be visualized as follows:

![Workflow](make_flowchart.png)

In `make`, the workflow collapses to a set of rules, which are structured as follows:

```bash
target : source(s)
    execution command
```

A *target* refers to **what** needs to be built (e.g., a file),
*source(s)* specify what is **required** to execute the build, and
the *execution command* specifies **how** to execute the build.

### Translating the Pipeline into `make` Code

In "make code," the workflow above - saved in a *makefile* (a file called `makefile`, without a file type ending) - will become:

```bash

../../gen/data-preparation/temp/cleaned_data1.csv ../../gen/data-preparation/temp/cleaned_data2.csv ../../gen/data-preparation/temp/cleaned_data3.csv: ../../data/dataset1/raw_data1.xlsx ../../data/dataset2/raw_data2.xlsx ../../data/dataset3/raw_data3.xlsx python to_csv.py
   	python to_csv.py

../../gen/data-preparation/temp/merged.csv: ../../gen/data-preparation/temp/cleaned_data1.csv ../../gen/data-preparation/temp/cleaned_data2.csv ../../gen/data-preparation/temp/cleaned_data3.csv merge.R
   	R --vanilla --args "" < "merge.R"
```

<!--
../temp/analysis.RData: ../temp/merged.csv analyze.R
   	R --vanilla --args "" < "analyze.R"

../temp/plot.png: ../temp/merged.csv plot.R
   	R --vanilla --args "" < "plot.R"

../output/report.pdf: ../temp/plot.png ../temp/analysis.RData
	R -e "rmarkdown::render('make_report.Rmd', output_file = '../output/report.pdf')"
-->


!!! hint
	Pay attention to the subdirectory structure used here: the rules refer to files in different folders (src, gen, data, etc.), which are explained [earlier in this guide](directories.md).

### Running `make`

#### Basic Use
You run the entire workflow by typing `make` in the directory where the `makefile` is located.

#### Preview Workflow
If you type `make -n`, you are entering a sort-of "preview" mode: `make`
will provide you a list of commands it would execute - but it does not
actually execute them. Great to preview how a workflow would be executed!

#### Consider Some Files and Targets as Up-to-Date

By default, `make` runs each step in a workflow that *needs* to be
updated. However, sometimes you wish to only rebuild *some* but not all
parts of your project. For example, consider the case where you have only
added some comments to some R scripts, but re-running that part of the project
would not change any of the resulting output files (e.g., let's say a dataset).

There are two ways in which you can "skip" the re-builds, depending on
whether you want to consider **file(s)**, or **targets** as up-to-date.
Recall that *targets* are higher-order recipes, whereas files are, well,
merely files.

##### Considering a **target** as up-to-date.

Pass the parameter `-t targetname` to `make`, and press enter. For example,
```
make -t targetname
```

The `targetname` is now "up-to-date". When you then run `make`,
it will only run those files necessary to build the remainder of the workflow.

##### Considering **file(s)** as up-to-date

Pass the parameter `-o filename1 filename2` to `make`.
In other words, `filename1` and `filename2` will be considered "infinitely old",
and when rebuilding, that part of the project will not be executed.

!!! warning
    Of course, using `-t` and `-o` should only be used for *prototyping* your
    code. When you're done editing (e.g., at the end of the day), make
    your temporary and output files, and re-run `make`
    to see whether everything works (and reproduces).

## Some examples of when `make` becomes useful

- You have a script that takes a very long time to build a dataset
(let's say a couple of hours), and another script that runs an analysis on it.
You only would like to produce a new dataset if actually code to make that dataset has changed.
Using `make`, your computer will figure out what code to execute to get you your final analysis.

- You want to run a robustness check on a larger sample, using a virtual computer you have rented in the cloud.
To run your analysis, you would have to spend hours of executing script after script to make sure the project runs the way you want.
Using `make `, you can simply ship your entire code off to the cluster, change the sample size, and wait for the job to be done.

## Make versus...

Below is a list of some popular pipeline tools. For more, please check [Awesome Pipeline](https://github.com/pditommaso/awesome-pipeline) and [Awesome Workflow](https://github.com/meirwah/awesome-workflow-engines).

- [Dagster](https://github.com/dagster-io/dagster)/[Dask](https://github.com/dask/dask)/[Kedro](https://github.com/quantumblacklabs/kedro)/[Pachyderm](https://github.com/pachyderm/pachyderm)/[Reflow](https://github.com/grailbio/reflow): for data analysts

- [Airflow](https://github.com/apache/airflow) by Airbnb/[Azkaban](https://github.com/azkaban/azkaban) by Linkedin: for programmers
- [Cmake](https://cmake.org/)/[Scons](https://scons.org/): general make tools
- [Bazel](https://bazel.build): Google's next generation build system

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
