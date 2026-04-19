This repository provides an index to a variety of public plankton image data sets in a from that make them simple to download in a uniform way.

The `justfile` in the repostiory defines a list of targets, each corresponding to a data set.  To get a specific set, you need the `just` executable, and then it's just (ah ha) a matter of typing `just get-X` to get the `X` dataset.

If you don't have `just` (and refuse to install it), you can read the `justfile` and figure out the shell commands it would execute fairly easily.
