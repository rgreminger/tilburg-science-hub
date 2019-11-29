# Reproducible Science Checklist 

There is quite some material to cover to make sure your work becomes
reproducible and is well-structured.

Here's a checklist you can fill in to see how well you are
adhering to the suggestions put forward in this guide.

!!! warnings
	This checklist is **work-in-progress**, and still be incomplete, and not perfectly aligned with other sections on this website.
	Use at your own risk!

	
|                                                                         | data-prepation | analysis    | paper       | ...     |
| ------------------------------------------------------------------------|:--------------:|:-----------:|:-----------:|:-------:|
| **Main documentation**
| Readme with project description and technical instruction how to run/build the project
| Authentication credentials stored outside of the repository (e.g., in a JSON file), NOT clear-text in source code
|
| **Documentation at the sub-module level**
| *Documentation*                           
| Readme with explanation what module does + running instructions | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Documenting output files (e.g., variable operationalization for data sets) | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Production of audit files (e.g., statistics, tables, or figures to check data quality/model convergence) | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| *File/directory structure*
| Compliant with project architecture (e.g., code/input/output/temp/audit for submodule-centric project)  | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| All file names are relative (i.e., not absolute) | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| *Automation*
| Makefile available | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Import of dependencies via source code | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Script to delete temp and output files | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Dependencies between source code and temp files made explicit? | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Creation of directories or use of .gitkeep | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| *Versioning*
| All files versioned that need to be versioned? | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Use of .gitignore | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| *Housekeeping*
| Clear variable names | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Loop what can be looped | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Functions modularized | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Delete what can be deleted (including legacy calls to packages/libraries, variables) | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Use of asserts | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| *Testing for portability*
| Tested on own computer | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |
| Tested on different computer (ideally different OS) | &#9744;        | &#9744;     | &#9744;     | &#9744; |    |

