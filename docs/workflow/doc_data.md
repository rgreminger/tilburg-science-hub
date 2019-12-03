# Documentation of New Data

If your project contains data that has been newly created (i.e., which is not otherwise (publicly) available yet), you are
required to include a documentation of that data in your project.

Instances of "new data" may included, but are not restricted to be:

* data scraped from websites
* data gathered via APIs
* manually labeled data
	* e.g., to assign GDP per capita to a list of countries
	* e.g., to classify a music label as a major versus independent label
	* ...

!!! tip
	Think of "new data" as *any* data that feeds into your project; it really needs
	not to be "big" data, but can simply consist of a `.csv` file with
	names and associated labels (e.g., as in the case of countries --> GDP per capita).

## How to Describe my Dataset(s)?

Ideally, your data description includes the questions outlined in `Datasheets for datasets` by Gebru, Timnit, et al. (2018). 
**We strongly** refer you to the [original paper](https://arxiv.org/abs/1803.09010), which explains in detail the seven key ingredients of a proper dataset documentation. As a start, you can copy-paste the text below
in a `readme.txt`, and start answering the question.

```
==========================================================
          D A T A S E T   D E S C R I P T I O N 
==========================================================

Name of the dataset:

----------------------------------------------------------

(1) Motivation of data collection (why was the data collected?)

[...]

(2) Composition of dataset (what's in the data?)

[...]

(3) Collection process (how was the data collected?)

[...]

(4) Preprocessing/cleaning/labeling (how was the data cleaned, if at all?)

[...]

(5) Uses (how is the dataset intended to be used?)

[...]

(6) Distribution (how will the dataset be made available to others?)

[...]

(7) Maintenance (will the dataset be maintained? how? by whom?)

[...]

```

<!--
==========================================================
MOTIVATION
==========================================================

* For what purpose was the dataset created?
  Was there a specific task in mind? Was therea specific gap that needed to be filled? 
  Please provide a description.
  
* Who created this dataset 
  (e.g., which team, research group) and on behalf of which entity (e.g., company, institution, organization)?

* Who funded the creation of the dataset?
  If there is an associated grant, please provide thename of the grantor and the grant name and number.
  
* Any other comments?

==========================================================
COMPOSITION
==========================================================

* What do the instances that comprise the dataset represent 
  (e.g., documents, photos,people, countries)?
  Are there multiple types of instances (e.g., movies, users, and ratings;
  people and interactions between them; nodes and edges)? 
  Please provide a description.
  
* How many instances are there in total (of each type, if appropriate)?

* Does the dataset contain all possible instances or is it a sample 
  (not necessarily random) of instances from a larger set?
  If the dataset is a sample, then what is the larger set?
  Is the sample representative of the larger set (e.g., geographic coverage)? 
  If so, please describehow this representativeness was validated/verified. 
  If it is not representative of the larger set, please describe why not 
  (e.g., to cover a more diverse range of instances, because instanceswere withheld or unavailable).



```



At the *bare minimum*, your data should be accompanied by the following `readme.txt`
description:

```
SOURCE
==========================================================
- Provide the source of the data

WHEN/WHERE OBTAINED & ORIGINAL FORM OF FILES
==========================================================
- Describe when and where each of the original files was obtained, 
  how they were obtained (email, downloaded from a website, etc.).
  
``` 
-->
