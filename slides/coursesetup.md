% Efficient Workflows for Data- and Computation-intensive Projects
% [Hannes Datta](https://hannesdatta.com)
% May 29, 2020

# Let's get started!

## Slides

...are available at the course website at [https://tiu.nu/dep](https://tiu.nu/dep)

## Agenda

(before we *really* start)

- About myself
- Motivation for course
- Learning goals
- Agenda and practical arrangements

# About myself

## Key areas of expertise

- marketing-mix modeling
- ownership versus access-based buisness models
- causality in observational data
- data management of structured and unstructured data

## Educational background

- PhD, quantitative marketing (Maastricht University)
- Associate professor Tilburg University

## Teaching activities

- MSc Marketing Analytics and Management: Data science skills for digital and social media research
- This class (at various levels; academic, exec)

## Research experience

- see [https://hannesdatta.com](https://hannesdatta.com) for papers
- Impact of digitization on consumers, producers
    - How did online streaming (Spotify, Netflix) chaneg behavior?
    - Bunch of follow-ups now (e.g., playlists, discovery of new music, music "filter" bubbles, change in production)
- Large-scale observational (big) data

# About you

## Projects

Getting to know you through your projects

- Text
- Predictive analytics
- Marketing optimization
- Process mining
- Modeling

::: notes

Look at the XLS sheet, talk about some projects

1) 360 degrees stakeholder impact scan (data and text analysis); How to improve the bachelor programs at UvT for both students and academic staff (1st project)
2) Mobile telecom congestion prediction for beach radio stations
3) Cluster analysis, segmentation models for loyalty programs, banking app Zalando?


:::

## Covid-19

- Where are you at right now?

. . .

- Home office, on a scale from 1 to 10...?

. . .

- Wanna have the last half-an-hour of this with a borrel? ;)

# Motivation for course

## Chaos

- did my PhD in quant marketing
    - data prep and analysis in R
    - fitted various models to data
- let's have a look at how my project (published!) looked like [like this](http://tilburgsciencehub.com/workflow/structure_phd_2013.html)

## Can't find stuff...

- Cannot find code that prepped the dataset
- Cannot find code of the econometric model that eventually got published

## What was so bad about it?

- Replicability
    - I couldn't reproduce results whenever I wanted to
- Efficiency
    - when making changes to data, I had to go the the beginning, repeating all steps
    - a colleague asked me for the data years after; it wasn't properly documented!

## Why should you care?

- You will change code *continuously* before project is final!
- Colleagues will look at your code
    - to help you
    - to continue your work
- Small efficiency gains will pay off soon!

# This course

## Course objective

Work __efficiently__ on __data- and computation-intensive__ projects

## What's efficient?

> - not making mistakes...
  - catching mistakes early
  - catching mistakes at all!!!
  - zero setup costs to return to a project
  - prototype the "final product" soon, refine later
  - rotating on tasks
  - sharing code

## What's *not* efficient?

> - Waiting (e.g., for results, for estimation)
- Getting distracted while waiting
- Forgetting how things *are* done
- Forgetting how things *were* done (history)
- Losing data
- Using code which isn't properly documented ("don't know how to use it")
- Becoming frustrated, feeling chaotic

## What's a *data*-intensive project?

- Big data: volume, variety, veracity, velocity
- "Where prototyping on small data makes sense"
- Overall: memory-intensive (RAM)

## What's a *computation*-intensive project?

- Small data, but long computation time
- Overall: CPU-intensive

## What about your projects?

- What do *you* feel has been __efficient__ or __unefficient__ so far?
- Are your projects __data- and computation-intensive__?

Let's discuss by *type of graduation project*

## How to achieve the course objectives

- Make work reproducible & transparent
    - Own efficiency
    - Others' efficiency
- Some dry theory...
    - key building blocks available at [http://tilburgsciencehub.com/workflow]()
- Discuss own work, and how to implement suggestions

::: notes

- Other's efficiency
    - Not recollect what has been collected
    - Not reprogram what has been programmed
    - Learn from one's code, etc.
    - Share ideas
- Light-weight structure: no commercial tools, readily implementable, do not need admin rights [...]

:::


## Direct link to CRISP-DM

...across many stages!

<a title="Kenneth Jensen / CC BY-SA (https://creativecommons.org/licenses/by-sa/3.0)" href="https://commons.wikimedia.org/wiki/File:CRISP-DM_Process_Diagram.png"><img width="412" alt="CRISP-DM Process Diagram" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/CRISP-DM_Process_Diagram.png/512px-CRISP-DM_Process_Diagram.png"></a>

::: notes

data prep, modeling, evaluation, deployment, data

:::

## Disclaimer

> - I prefer to do this in English...
- I assume you have viewed the [course page](https://hannesdatta.github.io/course-jads2020/)
- If I’m going too fast (and I will), slow me down!
- I may deviate from the timing
- I'm from marketing analytics, *not* data science, not IT
- I heavily refer to [Tilburg Science Hub](http://tilburgsciencehub.com)
- I'm using this slide deck for the first time
- I'm not the most efficient person to talk to... ;)


::: notes

- If everybody is speaking Dutch, that would be fine, too

- I'm a marketer
    - I do marketing analytics
    - It’s close to data science in terms of data acquisition, but...
    - rather distant in terms of methods (e.g., ML methods only enter the field gradually; we’re mostly applied econometricians)

- In the (spontaneous) exercises, I may not know all the answers all the time – but will deliver later if required

:::

## Success factors

Please tell me __what would make this course a success__ for you

::: notes

(for me): become more efficient, use Tilburg Science Hub, give me feedback

:::

# Agenda & practical arrangements

## Agenda (1)

- 13:15 - 14:15 (now): Introduction
  - Course setup (done that)
  - Preview of efficient workflows
  - Key building blocks
      - Pipelines & components
      - Data management & directory structure
      - Automation

## Agenda (2)

- 14:30 - 15:30: Running and *extending* a reproducible workflow
  - Putting things in practice
      - [TSH workflow tutorial](http://tilburgsciencehub.com/tutorial) + Q&A
      - Activity: Drafting your project pipeline
  - Key building blocks (*'cntd*)
      - Documentation
      - Versioning
      - Collaboration

::: notes
- skip documentation?

:::

## Agenda (3)

- 15:45 - 16:45: Advanced topics & implementation
  - Inventorizing your needs + picking activities/extra content
  - Implementation plan
  - Wrap-up

::: notes

- Schedule
    - 1-hour blocks, but may deviate

Q&A: fixing problems, automation basics

:::

## Practical arrangements

- Installation fine?
- Could run the workflow?
- All digital
    - make use of public chat (tell me if I don't see it! who can take that role?)
    - maybe share screen (install [TeamViewer](http://tilburgsciencehub.com/setup/teamviewer))
    - if you have, use two screens (one to program, one to view slides/others)

# Preview of efficient workflows

## Reproducibility & transparency

- Running [text mining tutorial](http://tilburgsciencehub.com/tutorial) on TSH

- Why is it useful?
    - Runs with one command (`make`)
    - Template to kickstart your projects
    - Endless possibilities to extend

__What are standard templates for your domain of expertise?__

## A bird eye's view

- What is it about?
    - Build entire pipeline first
    - Then refine steps

- Good for
    - quick prototype
    - swapping/upgrading modules
    - focus on the "big" picture


::: notes

how i Use what I teach

:::

## Portability across computers, operating systems

- What is it about?
    - Prototype on Mac and Windows
    - Move to Linux Cloud

- Good for
    - performance issues
    - collaboration

## Branching out

- What is it about?
    - Take a "copy" of your project
    - Do changes there, test those without breaking the main project

- Good for
    - Testing
    - Robustness checks
    - Going back in time

## Time capsule

- What is it about?
    - Use version history on Git to view code (from the past)

- Good for
    - Because you *can*, you delete code and keep your project clean
    - Finding code that you want to use again
    - Search code *across* projects

## Software agility

- What is it about?
    - Use automation to connect different programs (e.g., R, Python, ...)
    - Use outputs of one as inputs of another

- Good for
    - Use a program what it's best for (e.g., R for data preparation, Python for ML)
    - Extreme flexibility

::: notes

show EC2

:::

# Wrap-up

## Summary

What are __your__ takeaways?

## Met the objective?

Work __efficiently__ on __data- and computation-intensive__ projects

## Your feedback

- About this course
    - About me
    - The format of this course
    - Communication
- About Tilburg Science Hub
    - About the text mining tutorial
    - About the installation instructions
    - About the overall workflows
- ...anything else

## Contact

Hannes Datta

https://hannesdatta.com
