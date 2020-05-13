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

    !!! tip "Using counters"
        - In `parse.py`, we make use of a "counting variable", called `cnt`. We set this variable to 0 at the beginning of the script, and then increment it with 1 every time we parse a JSON object (`cnt+=1` is the same as `cnt = cnt + 1`).
        - That way, for each iteration of our loop, we exactly know how many objects we have already parsed!
        - Ultimately, we are using this variable to abort the loop when we have parsed 1000 objects (we consider this a reasonable amount of tweets to parse for a "prototype").
        - Next to prototyping, counters are very useful for diagnosing errors. For example, your parsing script may crash while parsing, and then the value of `cnt` will show you at which object this error happened. That way, you directly know with which data you need to start debugging your code.

    2) Let's now also add the username of the Twitter user to the parsed
    CSV file. Again, check `parse.py` for the code on how to
    extract attributes form the JSON Twitter data. Hint: use the
    attribute `.get('user').get('screen_name')`.

    **Watch the solutions here.**

    <iframe width="560" height="315" src="https://www.youtube.com/embed/EgiLBt1njo4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
