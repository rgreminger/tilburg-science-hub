# Tutorial to Implement an Efficient and Reproducible Workflow

Longing to put your knowledge from our [workflow guide](../workflow) into practice? Then follow this tutorial to implement a fully automated workflow to conduct sentiment analysis on tweets, using our [GitHub workflow template](https://github.com/hannesdatta/textmining-workflow).

## Objectives of this tutorial

-	Familiarize yourself with a [robust directory structure](../workflow/directories.md) for data-intensive projects
-	Experience the benefits of [automating workflows with makefiles/GNU make](../workflow/automation.md)
-	Learn to use Git templates for your own research projects
-	Adjust the workflow template to
    -	...download different datasets from the web
    - ...unzip data automatically
    -	...parse JSON objects and select relevant attributes
    - ...add new text mining metrics to the final data set using Python's `textblob`
    - ...modify the analysis in an RMarkdown/html document

## Prerequisites

-	Computer setup following our [setup instructions](../setup)
    - [Python](../setup/python.md) and the `textblob` package

        ```
        pip install -U textblob
        ```

        Then, open Python and type

            import nltk
            nltk.download('punkt')

    -	[R, RStudio](../setup/r.md) and the following packages:

        ```
        install.packages(c("data.table", "knitr", 'Rcpp', 'ggplot2'))
        ```

    -	[GNU Make](../setup/make.md)

- Familiarity with our [workflows](../workflow), in particular on [pipelines and project components](../workflow/pipeline.md), [directory structure](../workflow/directories.md) and [pipeline automation](../workflow/automation.md).

-	Nice-to-haves:
    - Basic experience with Python and R
    -	Familiarity with common data operations using `data.table` in R
    -	Familiarity with text mining using Python and TextBlob
    - If you want to learn Git on the way...
        - Have Git installed on your computer (see here)
    	  - Have GitHub login credentials

## Disclaimer

To keep this tutorial as accessible as possible, it will mention Git/GitHub a few times, but assume you will acquire details on these skills elsewhere. In other words, versioning and contributing to Git repositories is not part of this tutorial.
