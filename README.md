This repository provides an index to a variety of public plankton image data sets in a from that make them simple to download in a uniform way.

The `justfile` in the repostiory defines a list of targets, each corresponding to a data set.  To get a specific set, you need the [`just`](https://github.com/casey/just) executable, and then it's just (ah ha) a matter of typing `just get-X` to get the `X` dataset.

If you don't have `just` (and refuse to install it), you can read the `justfile` and figure out the shell commands it would execute fairly easily.

The currently provided targets are:

get-flowcam
: The [FlowCamNet](https://www.seanoe.org/data/00908/101961/) data set (300k images, 93 classes)

get-isiis
: Teh [ISIISNet](https://www.seanoe.org/data/00908/101950/) data set (400k images, 32 classes).

get-uvp6-net
: The [UVP6Net](https://www.seanoe.org/data/00908/101948/) data set (630 000 images, 54 classes)

get-zoocam
: The [ZooCAMNet](https://www.seanoe.org/data/00907/101928/) data set (1.3M images, 93 classes)

get-zooscan
: The [ZooScanNet](https://www.seanoe.org/data/00446/55741/) data set (1.5M images, 120 classes)

get-whoi
: The [IFCB dataset](https://darchive.mblwhoilibrary.org/collections/aad045e7-1fcf-5650-82ee-c62bd604d225) from WHOI (years 2006-2014, 3.5M images, 103 classes)

get-all-data
: Shortcut to download all of the above.
