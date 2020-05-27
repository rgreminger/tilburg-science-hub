% Key building blocks of efficient workflows
% [Hannes Datta](https://hannesdatta.com)
% May 29, 2020

# Overview

## Get-data

Amazon S3 (https://aws.amazon.com/s3/)
Pair of access keys (access control)
Upload and download .bat using AWS’ command line interface (awscli) orPython’s boto3

Your company’s FTP server

Google Drive / Dropbox

Make use of command-line tools or Python packages to retrieve data for projects, or write data for others to use

## Setting up a file exchange


## Take a database offline

Databases have the benefit of “structuring” data for you (even unstructured databases!)
For example:
get weather data for every day 2018-2019
scraper crashes
checks what data is available, and only gets data that is missing

Databases can run locally (on your PC), remotely (on a server, self-managed), or in the cloud (also on the server, but managed with tools)

Structured databases: SQL
Local: SQlite
Remotely: your company’s SQL server
Cloud: AWS RDS, …

Unstructured databases: MongoDB
Local: collection of JSON objects, tinyDB
Remotely: Self-managed MongoDB distribution
Cloud: MongoDB Atlas

## Git workflows

- what NOT to version
- .gitignore

```
Solution: create .gitignore in root


**/temp 	excludes everything in the directories temp
**/output	excludes everything in the dir output
**/external
/slides_beamer/*.pdf
/slides_beamer/*.tex
~* (excludes temp files)
*~
*log
*.RHistory
*.RData
*.Rproj.user*
Thumbs.db
```

## Implementing Git

Pick your own project (e.g., graduation project, your webscraper, ...)

Install git from git-scm.org

Port project to a Git repository

Start implementing things from the checklist & perform Git work cycles. See cheatsheet handout!


I will provide you with feedback.



What to do
Download Git from git-scm.org
Download Git Cheatsheet from https://education.github.com/git-cheat-sheet-education.pdf
Run Git Batch in your main directory [tip: type cmd in Windows explorer]
Type: git init to initialize a repository. Celebrate.

Perform work cycles (over and over again)
git status
git add directory
git add files (e.g., git add code.R)
git commit -m “message”

Possible “to do’s”: improve folder structure
Modules by “function” in project, e.g., raw, derived, analysis
Within each module, split by temp/code/output/external


## Version control - local

## Collaboration using an open source software project

## Working with submodules in Git

## Integrate cloud storage

##
