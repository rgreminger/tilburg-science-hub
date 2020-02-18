# Directory Structure of your Project

## Overview

From previous steps in this guide, recall that a project can be logically structured in
the following components:

1. raw data: e.g., datasets,
2. source code: e.g., code to prepare your data and to analyze it
3. generated temporary/output files: e.g., some diagnostic plots orthe results of your analysis,
4. a file exchange to ping-pong temporary/output files between different stages of your pipeline, and
5. a collection of notes, literature, etc.

Below, we give you some more guidance on how to *actually make use of these components*,
by casting a prototypical directory structure that you need to set up on your computer.
Our governing principles are that:

- others should understand your project and
pipeline, merely by looking at your directory and file structure, and
- each step in the pipeline is self-contained, i.e., it can be executed without actually having
to run previous stages in the pipeline.

<!---!!! hint
		Remember that next to the components (i.e., the most basic building blocks of the projects),
		your project has a **pipeline** which defines the different tasks to accomplish (e.g.,
		such as preparing and analyzing the data, writing the paper, etc.).
--->

## Example of a directory structure

Let's suppose we're working on a project, called `my_project`. Let's
further suppose your pipeline has three stages: `data-preparation`, `analysis`,
and `paper`.

Your project's directory structure will look like this:

```
Contents of folder my_project
=============================
├───data
│   ├───dataset1
│   │       file1.csv
│   │       file2.csv
│   │       readme.txt
│   │       
│   └───dataset2
│           coding.csv
│           readme.txt
│           
├───gen
│   ├───analysis
│   │   ├───audit
│   │   │       audit.txt
│   │   │       
│   │   ├───input
│   │   │       cleaned_data.csv
│   │   │       
│   │   ├───output
│   │   │       model_results.RData
│   │   │       
│   │   └───temp
│   │           imported_data.csv
│   │           
│   ├───data-preparation
│   │   ├───audit
│   │   │       checks.txt
│   │   │       
│   │   ├───input
│   │   │       dataset1.csv
│   │   │       dataset2.csv
│   │   │       
│   │   ├───output
│   │   │       cleaned_data.csv
│   │   │       
│   │   └───temp
│   │           tmpfile1.csv
│   │           tmpfile2.RData
│   │           
│   └───paper
│       ├───audit
│       │       audit.txt
│       │       
│       ├───input
│       │       model_results.RData
│       │       
│       ├───output
│       │       figure1.png
│       │       figure2.png
│       │       tables.html
│       │       
│       └───temp
│               table1.tex
│               table2.tex
│               
└───src
    ├───analysis
    │       analyze.R
    │       
    ├───data-preparation
    │       clean_data.R
    │       load_data.R
    │       
    └───paper
            figures.R
            paper.tex
            tables.R

```

1. **Raw data** gets downloaded into the `data` folder from either
a network drive, or a remote file storage that is securely backed up.
Here, we have created subdirectories for major parts of our dataset (e.g.,
data that comes from different data providers).
2. **Source code** is written in the `src` folder, with each step of
your pipeline getting its own subdirectory - here, ordered from "upstream"
to "downstream" steps in your pipeline:
 	- `data-preparation`,
	- `analysis`, and
  	- `paper`.

3. **Generated files** are written to the `gen` folder, again with subdirectories
for each step in your pipeline. Note the following subdirectories:

	- `input`: This subdirectory contains any required input files to run this
	step of the pipeline. Think of this as a directory that holds files from
	preceding modules (e.g., the analysis uses the *file exchange* to pull in the
	dataset from its preceding stage in the pipeline, `\data-preparation`).

	- `temp`: These are temporary files, like an Excel dataset that
	needed to be converted to a CSV data set before reading it in
	your statistical software package.

	- `output`: This subdirectory stores the *final* result of the module.
	For example, in the case of a data preparation module, you would expect this
	subdirectory to hold the final dataset. In the case of the analysis module,
	you would expect this directory to contain a document with the results of
	your analysis (e.g., some tables, or some figures).If necessary,
	pass these to a file exchange	for use in other stages of your pipeline.

	- `audit`: Checking data and model quality is important. So use this
	directory to generate diagnostic information on the performance of each
	step in your pipeline. For example, for a data preparation, save a txt
	file with information on missing observations in your final data set.
	For an analysis, write down a txt file with some fit measures, etc.

4. **Notes** are kept on an easily accessible cloud provider, like
Dropbox, Google Drive, or - if you're located in The Netherlands - Surfdrive.

<!--
!!! summary
	Each submodule contains five subdirectories:

	- `\code` for the code
	- `\temp` for any temp files that are generated on the fly
	- `\input` for any input files required to run your code (e.g., datasets)
	- `\output` for the final "output" of your module (e.g., dataset, analysis report)
	- `\audit` for some auditing files such as plots or text files, which will you allow to check whether the module was executed well.

-->

!!! hint
	- [Download our example directory structure here](dir_structure.zip), so you can get started right away.
	- Remember that horrible [directory and file structure](structure_phd_2013.html) from Hannes' project from back in 2013? Well, things have been getting a bit better since then, and by 2018, Hannes' project on [how streaming services change music consumption](https://pubsonline.informs.org/doi/pdf/10.1287/mksc.2017.1051) looked [like this](structure_spotify_2018.html#spotify).
	- You've seen those readme.txt's?! These are super helpful to include at the top of your project ("what is your project about"), and in each module ("what is the module about?").


!!! tip "Not fully set up? A good directory structure may be enough to collaborate!"
	Need feedback on your code, e.g., by your advisor? Just zip the entire step of the pipeline you are stuck with and use [SURF's filesending service](https://filesender.surf.nl/) to email it!

	!!! warning "Uhh, email, really?!"
		- Indeed, email is not what we ideally want to advocate.
		- But then again, we want you to get started with reproducible science in a very easy way, and adhering to the modular project structure outlined above already makes your project so much better structured.
		- So, before you proceed to the future chapters of this guide, sit back, and relax, and keep on using good old email.
