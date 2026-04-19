This repository provides an index to a variety of public plankton image data sets in a from that make them simple to download in a uniform way.

The `justfile` in the repostiory defines a list of targets, each corresponding to a data set.  To get a specific set, you need the `just` executable, and then it's just (ah ha) a matter of typing `just get-X` to get the `X` dataset.

If you don't have `just` (and refuse to install it), you can read the `justfile` and figure out the shell commands it would execute fairly easily.

The currently provided targets are:

get-flowcam
: The FlowCamNet data set (300k images, 93 classes)

get-isiis
: ISIIS data set (400k images, 32 classes).

get-uvp6-net
: The UVP6Net data set (630 000 images, 54 classes)

get-zoocam
: The ZooCamNet data set (1.3M images, 93 classes)

get-zooscan
: The ZooScanNet data set (1.5M images, 120 classes)

get-whoi
: The IFCB dataset from WHOI (years 2006-2014, 3.5M images)

get-all-data
: Shortcut to download all of the above.
