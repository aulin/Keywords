Keywords by Johan Aulin
=======================
This is a personal, nifty tool I use together with my _MultiMarkDown_ based text notes. If you want to try it, you're welcome, but it's not my primary intention to make this for anyone but myself.

Usage: `kw [-p command] [keyword list...]`

Given files which contain rows that begin with "Title:" and "Keywords:", list those files that contain the given keyword[s] in either of those rows.

    Options:
    -p command    Pipe the output to the
                  specified command via
                  null terminals and xargs.

    Example: kw recipe
    Example: kw -p vim recipe
