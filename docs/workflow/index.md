# Project Setup and Workflow Management

## Motivation

When working on a project, most of us spend time thinking about *what* to create (e.g., a cleaned data set, a new algorithm, an analysis, and/or a paper and corresponding slides), but not about how to *manage* its creation.

Gradually, we write code and edit data sets, and put those files somewhere on our computer. When we update files, we either overwrite them, or save new versions under different file names (e.g., including dates like `20191126_mycode.R` or version numbers like `mycode_v2.R`). Even with *best intentions to keep everything tidy*, months or years of working on a project will very likely result in chaos. For example, have a look at the intransparent [directory and file structure of a PhD project](structure_phd_2013.html) Hannes once was working on (back in 2013).

As you will quickly realize, the folder structure is a mess, and it is close to impossible to find the code that prepared the datasets, or the code that was used to estimate the econometric model that eventually got published (if you do find these files, please let us know). ;-)

Avoiding this chaos is **at the core of managing data- and computation-intensive projects**, and your primary mission.

The following pages should help you to get introduced to a few principles of a project management.

!!! tip "Configure your computer"
    - Note that to implement our workflow suggestions, your computer needs to be configured properly - so we [suggest you to do that first](../setup/index.md).
    - Of course, you need not to install all software tools - but pick *at least* your statistical software package (e.g., [we use R](../setup/R.md), but others prefer [Stata](../setup/stata.md)), [Python](../setup/python.md), and [`make`](../setup/make.md).

!!! tip "Tips"
    * We may sometimes sound a bit dogmatic (e.g., you must do this or that). Some of our instructions will only make sense to you after a while. So, please stick with our recommendations during the course of your first few projects. Later on, take the liberty to re-design the workflows to your needs.
    * Consider adopting our suggestions **gradually**
        1. Start with a proper [directory structure on your local computer](directories.md)
        2. Start [automating](automation.md) your workflows
        3. Add [documentation](doc.md) to your modules/directories and your (raw) data
        4. Start to version your code to keep track of changes + clean up
	  * You should be able to complete this subchapter in one sitting within 60-120 minutes.

<!--
!!! warning
	This site is under development, and will be updated continuously. Please check back frequently.
--!>

<!--#* Please follow the steps one-by-one in the order they appear on the side bar and do not deviate from them, unless you really know what you are doing.
#* Where necessary, we have provided instructions for Mac, Windows and Linux machines.
--!>
