# Contributing

[Tilburg Science Hub](https://github.com/hannesdatta/tilburg-science-hub) is an open source project,
and we welcome contributions of all kinds:
new tutorials,
fixes to existing material,
bug reports,
and reviews of proposed changes are all welcome.

## Contributor Agreement

By contributing,
you agree that we may redistribute your work under [our license](README.md#License).
In exchange,
we will address your issues and/or assess your change proposal as promptly as we can,
and help you become a member of our community.
Everyone involved
agrees to abide by our [code of conduct](CONDUCT.md).

## Using GitHub

If you choose to contribute via GitHub, you may want to look at
[How to Contribute to an Open Source Project on GitHub][how-contribute].

<!--To manage changes, we follow [GitHub flow][github-flow].

Each lesson has one or two maintainers who review issues and pull requests or encourage others to do so.
The maintainers have final say over what gets merged into the lesson.
-->


More info? [Follow this fantastic tutorial on contributing to an open-source
project on GitHub](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/).

### Using the GitHub web interface to contribute content:

1.  Fork the originating repository to your GitHub profile (press the "fork" button
on GitHub, which creates a copy of this project in your own GitHub account).
2.  Within your version of the forked repository, move to the `tilburg-update` branch and
create a **new branch for each significant change being made**.
3.  Navigate to the file(s) you wish to change within the new branches and make revisions as required.
4.  Commit all changed files within the appropriate branches.
5.  Create individual pull requests from each of your changed branches
to the `tilburg-update` branch within the originating repository.
6.  If you receive feedback, make changes using your issue-specific branches of the forked
repository and the pull requests will update automatically.
7.  Repeat as needed until all feedback has been addressed.

### Using your local computer to contribute content:

1.  Fork the originating repository to your GitHub profile (press the "fork" button
on GitHub, which creates a copy of this project in your own GitHub account).

2. Clone the repository to your computer.
```{.bash}
git clone https://github.com/[your-user-name]/tilburg-science-hub.git
```

3. Get the repository working on your machine, by installing the following
Python packages
```{.bash, id:"j29ie3c7"}
pip install mkdocs
pip install mkdocs-material
```

4. Last, check whether you can view the site served locally on your machine:

```{.bash}
mkdocs serve
```
5. Then, navigate your browser to the URL indicated by mkdocs, which most likely is http://127.0.0.1:8000/.

6. Make your changes to any of the files in the `\docs` directory in a new branch (here, called *my_changes*)

```{.bash}
git branch my_changes
```

7. Done with your changes? First push your branch(es) to your own repository.

```{.bash}
git push -u origin my_changes
```

8. Create individual pull requests (PRs) from each of your changed branches
to the `tilburg-update` branch within the originating repository, by clicking
on the "compare & pull request" button on GitHub.

9.  If you receive feedback, make changes using your issue-specific branches of the forked
repository and the pull requests will update automatically.
10.  Repeat as needed until all feedback has been addressed.

## Important!
When starting work, please make sure your clone of the originating `tilburg-update` branch is up-to-date
before creating your own revision-specific branch(es) from there.
Additionally, please only work from your newly-created branch(es) and *not*
your clone of the originating `tilburg-update` branch.
Lastly, published copies of the material are available in the `tilburg-update` branch of the originating
repository for reference while revising.

## Useful Links:
- [Github](https://github.com)
- [Github flow](https://guides.github.com/introduction/flow/)
- [Join GitHub](https://github.com/join)
- [Tutorial on how to contribute to an open source project](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)
- [How to use GitHub issues to communicate with other contributors](https://guides.github.com/features/issues/)
