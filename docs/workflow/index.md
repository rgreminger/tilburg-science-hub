# Project Setup and Workflow Management

## Motivation

When working on a project, most of us spend time thinking about *what* to create (e.g., a cleaned data set, a new algorithm, an analysis, and/or a paper and corresponding slides), but not about how to *manage* its creation.

Gradually, we write code and edit data sets, and put those files somewhere on our computer. When we update files, we either overwrite them, or save new versions under different file names (e.g., including dates like `20191126_mycode.R` or version numbers like `mycode_v2.R`). Even with *best intentions to keep everything tidy*, months or years of working on a project will very likely result in chaos. For example, have a look at the intransparent [directory and file structure of a PhD project](structure_phd_2013.html) Hannes once was working on (back in 2013).

As you will quickly realize, the folder structure is a mess, and it is close to impossible to find the code that prepared the datasets, or the code that was used to estimate the econometric model that eventually got published (if you do find these files, please let us know). ;-)

Avoiding this chaos is **at the core of managing data- and computation-intensive projects**, and the primary mission of this boot camp.

The following pages should help you to get introduced to a few principles of a project management.

## Guiding Principles

The objectives of this boot camp are:

- learn how to organize and track the evolution of your projects (e.g., by means of a proper [directory structure](directories.md), and [code versioning](versioning.md))
- learn how to [work on projects with others](collaboration.md) (e.g., by means of Git/GitHub)
- learn how to make your workflows reproducible (e.g., by using [automation](automation.md))
- learn how to [document datasets](documenting-data.md) and [workflows](documenting-code.md)
- learn how to write clean code (e.g., see our [tips here](../tips/coding.md))

## Gradual Implementation

!!! tip "Tips"
    * We may sometimes sound a bit dogmatic (e.g., you must do this or that). Some of our instructions will only make sense to you after a while. So, please stick with our recommendations during the course of your first few projects. Later on, take the liberty to re-design the workflows to your needs.
    * Consider adopting our suggestions **gradually**
        1. Start with a proper [directory structure on your local computer](directories.md)
        2. Start [automating](automation.md) (parts of) your pipeline
        3. Document your [project](documenting-code.md) and [raw data](documenting-data.md)
        4. Start to [track changes to your source code](versioning.md), and [clean up your source/"do your housekeeping"](checklist.md) regularly


!!! tip "Configure your computer"
    - Note that to implement our workflow suggestions, your computer needs to be configured properly - so we [suggest you to do that first](../setup/index.md).
    - Of course, you need not to install all software tools - but pick *at least* your statistical software package (e.g., [we use R](../setup/r.md), but others prefer [Stata](../setup/stata.md)), [Python](../setup/python.md), and [`make`](../setup/make.md).

<!---* You should be able to complete this subchapter in  sitting within 90-150 minutes.-->

<!--
!!! warning
	This site is under development, and will be updated continuously. Please check back frequently.
--!>

<!--#* Please follow the steps one-by-one in the order they appear on the side bar and do not deviate from them, unless you really know what you are doing.
#* Where necessary, we have provided instructions for Mac, Windows and Linux machines.
--!>
