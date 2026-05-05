# Summary

This repository provides an index to a variety of public plankton image data sets in a form that make them simple to download in a uniform way.  It thus serves both as a catalog over available data sets, and a method to obtain them.

# How to use it

The `justfile` in the repository defines a list of targets, each corresponding to a data set.  To get a specific set, you need the [`just`](https://github.com/casey/just) executable, (probably available as `apt insatll just` or similar on your favorite Linux distribution). And then it's just (ah ha) a matter of typing `just get-X` to get the `X` dataset.

If you don't have `just` (and refuse to install it), you can read the `justfile` and figure out the shell commands each target would execute.

# Instruments

Below is a quick overview of the instruments used to capture the different data sets.  It is intended to give a quick overview, not as a rigorous or authoritative (i.e. correct) source of information.  *Caveat lector*.

The [Underwater Vision Profiler](http://www.hydroptic.com/index.php/public/Page/product_item/UVP6-LP)s, UVP5 and UVP6, are cameras that creates a "sheet" of light in front to capture in focus particles.  Often used as a drop camera (e.g. on a CTD probe) or mounted on gliders.

[FlowCam](https://www.fluidimaging.com/applications/aquatic/plankton-research) is a lab instrument that siphons a water sample in front of a flow cell camera.  Different variants capture particles of specific sizes.

[ZooScan](http://www.hydroptic.com/index.php/public/Page/product_item/ZOOSCAN) is essentially a waterproofed flatbed scanner that captures images of water samples in the lab.

HOLOCAM is a digital holography instrument from Scripps that captures volumetric 3d information.

[ZooCam](https://archimer.ifremer.fr/doc/00407/51833/52432.pdf) is an IFREMER system using a dual camaera setup to detect fish eggs and metazooplankton in situ.

The [Dual Scripps Plankton Camera](https://jaffeweb.ucsd.edu/research-projects/scripps-plankton-camera-system/spc-dual/), DSPC, uses two cameras with different magnifications to capture images in situ.

[IFCP](https://mclanelabs.com/wp-content/uploads/2022/12/McLane-IFCB-Datasheet.pdf) is a flow instrument that captures small particles in situ, used by WHOI.

The In Situ Ichtyoplankton Imaging System [ISIIS](https://twilightzone.whoi.edu/work-impact/technology/stingray/) is a towed instrument using high resolution shadowgraphy.

For instruments where there are several data sets, you should be able to do `just get-all-$instrument` to download all available data for the instrument of type `$instrument`.

# Data sets

Some of the currently provided targets are detailed below.  You can use `just --list` to show all available targets.

The first chunk is from Panaoïtis et al.:

get-flowcam
: The [FlowCamNet](https://www.seanoe.org/data/00908/101961/) data set (300k images, 93 classes)

get-isiis
: The [ISIISNet](https://www.seanoe.org/data/00908/101950/) data set (400k images, 32 classes).

get-uvp6-net
: The [UVP6Net](https://www.seanoe.org/data/00908/101948/) data set (630 000 images, 54 classes)

get-zoocam
: The [ZooCAMNet](https://www.seanoe.org/data/00907/101928/) data set (1.3M images, 93 classes)

get-zooscan
: The [ZooScanNet](https://www.seanoe.org/data/00446/55741/) data set (1.5M images, 120 classes)

Woods Hole have been collecting and publishing data from their IFCB for several years:

get-whoi
: The [IFCB dataset](https://darchive.mblwhoilibrary.org/collections/aad045e7-1fcf-5650-82ee-c62bd604d225) from WHOI (years 2006-2014, 3.5M images, 103 classes)

Womack et al. have [published](https://zenodo.org/records/18497521) an overview of multiple data sets.  These may or may not overlap with the other data sets, e.g. the Kaggle datasets contain ISIIS images, and there are several WHOI datasets with curated annotations..

get-uw38
: The [Univeristy of Washington ZooCam](https://www.bco-dmo.org/dataset/927518) data set (16k images, 38 classes)

Or you can just download everthing:

get-everything
: Shortcut to download all of the above.
