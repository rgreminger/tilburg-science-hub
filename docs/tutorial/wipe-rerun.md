# Dry run and first modifications to the data preparation scripts

Sometimes, running a workflow may take hours, or even days. That's why `make`
supports so-called "dry-runs", which you can initiate by typing `make -n` (for NOT run). Watch
our video to walk you through the intuition.

Watch our video here.

<iframe width="560" height="315" src="https://www.youtube.com/embed/h7f9bHnOLm0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

!!! questions "Practice questions and answers"

    1) Let's start modifying our workflow a little bit! For example,
    instead of parsing only the first 1000 lines (which we did
    to prototype our scripts - a useful thing you should try to remember!),
    let's now parse the first 2000 lines, and then remove the prototyping
    condition altogether! Hint: check `parse.py` for the code!

    2) Let's now also add the username of the Twitter user to the parsed
    CSV file. Again, check `parse.py` for the code on how to
    extract attributes form the JSON Twitter data. Hint: use the
    attribute `.get('user').get('screen_name')`.

    Watch the solutions here.

    <iframe width="560" height="315" src="https://www.youtube.com/embed/EgiLBt1njo4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
