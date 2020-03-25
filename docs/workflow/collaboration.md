# Collaborating using GitHub

While you can use Git exclusively to keep track of your files' version history,
the real power of Git lies in **collaborating on coding projects with others**. Below, we outline how you can contribute to existing (open-source) projects that are hosted on GitHub.

## Repositories versus Gists

GitHub knows two types of "projects". Full-fledged projects (e.g., for software
development or research) are hosted in so-called "repositories", which offer you
the full range of development features available. Configuring a GitHub repository
to work well may take a while.

Gists, in turn, are only code snippets - e.g., a small piece of R code to
clean some data, or a bit of Python code with some data to demonstrate a feature
that you have developed. Gists are *ideal* to very quickly share stuff with
the community to receive feedback. At the same time, you can hope for members of
your wider network to comment on your code and improve it!

Below, we refer to repositories and Gists as "projects".

## Contributing to a project (Gist or repository)

### Publicly available Gist or repository (mostly open source projects; the "default")

GitHub hosts thousands of open-source Gists and repositories that you can
integrate in your own work, or - alternatively - that you can contribute to.

Here's our guide on how to contribute. These instructions
also apply to [contributing to this site](https://github.com/hannesdatta/tilburg-science-hub/blob/tilburg-update/README.md) - tilburgsciencehub.com.

<!--If you choose to contribute via GitHub, you may want to look at [How to Contribute to an Open Source Project on GitHub][how-contribute].
-->

### Using the GitHub web interface to contribute content:

1. To get started... (you need to only do this once per repository)
    - **Fork** the originating Gist or repository, which creates a copy of the original Gist/repository in your own GitHub profile (press the "fork" button on GitHub). You can now edit the project without breaking the original version.
2. Make changes
    - Within your version of the forked repository, create a branch for each significant change you are planning to make. To do so, click on the [branch selector menu](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-and-deleting-branches-within-your-repository) and enter a name for your branch. Gists do not know branches - so no need to trying to create one.
    - Navigate to the file(s) you wish to change (within the new branch), and make revisions as required.
    - Commit all changed files within the appropriate branches.
3. Contribute your changes to the originating repository
    - For *repositories*:
        - It's time to shine! Share your changes with the world, by creating individual pull requests from each of your changed branches to the `master` branch within the originating repository.
        - You will likely receive feedback and may be requested to make changes using issue-specific branches of the forked repository. Repeat as needed until all feedback has been addressed.
    - For *Gists*:
        - Navigate to the original Gist, and scroll down to the comment section. Write about the changes you have made in your Fork, and
        include a URL to your fork! The project owner will then get in touch with you to discuss how the changes can be implemented.
        (Unfortunately, GitHub does not know the concepts of pull requests for Gists...).

### Using your local computer to contribute content:

1. To get started... (you need to only do this once per repository)
    - **Fork** the originating Gist or repository, which creates a copy of the original Gist or repository in your own GitHub profile (press the "fork" button on GitHub). You can now edit the project without breaking the original version.
    - **Clone** a copy of your Gist/repository to your computer via Git Bash:

        `git clone https://github.com/[your-user-name]/repository-name.git`

        or

        `git clone https://gist.github.com/[your-user-name]/gistname`

    - **Get the Gist/repository working** on your computer (e.g., install the necessary software tools for it to run). Check the project's readme file, which will point you to the repository-specific installation instructions.

2. Make changes
    - For *repositories* (which know the concept of branching):
        - Within your version of the forked repository, create a branch for each significant change you are planning to make. To do so, use Git Bash and use the command `git branch branch-name`. Create a branch for each feature you would like to implement.
        - Change to the newly created branch (instead of making changes to the master branch), by using `git checkout branch-name` in Git Bash.
        - Navigate to the file(s) you wish to change within the new branch, and make revisions as required (e.g., using your favorite software tools, like R or Python - depending on the type of source code, obviously).
        - Commit all changed files within the appropriate branches (`git status`, `git add`, `git commit -m "your description here"`). Finally, push your changes to GitHub (`git push`). Need a refresher? You can review the [necessary steps on working with Git/GitHub here](versioning.md).
    - For *gists*:
        - Navigate to the file(s) you wish to change, and make revisions as required (e.g., using your favorite software tools, like R or Python - depending on the type of source code, obviously).
        - Commit all changed files (`git status`, `git add`, `git commit -m "your description here"`). Finally, push your changes to GitHub (`git push`). Need a refresher? You can review the [necessary steps on working with Git/GitHub here](versioning.md).

3. Contribute your changes to the originating repository
    - For *repositories*:
        - It's time to shine! Share your changes with the world, by creating individual pull requests from each of your changed branches tto the `master` branch within the originating repository. To do so, navigate to the forked copy of the repository, available at your personal GitHub page. Then, click on "pull request" to notify the owner of the original repository about the new features.
        - You will likely receive feedback and may be requested to make changes using issue-specific branches of the forked repository. Repeat as needed until all feedback has been addressed.
    - For *Gists*:
        - Navigate to the original Gist, and scroll down to the comment section. Write about the changes you have made in your Fork, and
        include a URL to your fork! The project owner will then get in touch with you to discuss how the changes can be implemented.
        (Unfortunately, GitHub does not know the concepts of pull requests for Gists...).

<iframe width="560" height="315" src="https://www.youtube.com/embed/pOhl932vbTI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### The project is publicly or privately available, and you are a team member

If you're a member of an existing GitHub repository (e.g., such as one
in which you work jointly with classmates), you typically have "full rights" to
make changes to the project. For example, you can `git clone` the project to your
computer, make changes to files and commit those (`git add`, `git commit`), and
synchronize your changes with the remote repository on GitHub (e.g., using `git push`).

For an overview of these workflows, see our detailed [tutorial here](versioning.md).

applies to repositorie
!!! warning

    - Before starting to make any changes in your forked repository, make sure the fork is up-to-date with its originating repository.
    - Please only work from your newly-created branch(es) in a forked repository, and *not* in a clone of the originating master branch.

!!! tip
    More info? Follow this [fantastic tutorial on contributing to an open-source project on GitHub](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/).
