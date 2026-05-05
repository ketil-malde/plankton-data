
default:
	@echo "Select a target"

# From Panaoïtis 2026:
#   FlowCAM: <https://www.seanoe.org/data/00908/101961/>
#   ISIIS: <https://www.seanoe.org/data/00908/101950/>
#   UVP6: <https://www.seanoe.org/data/00908/101948/>
#   ZooCam: <https://www.seanoe.org/data/00907/101928/>
#   ZooScan: <https://www.seanoe.org/data/00446/55741/>

# UVP6Net, 630k images, 54 classes, 2.6 GB
get-uvp6net:
	# UVP6 does not create its own directory
	mkdir -p UVP6Net
	test -e downloads/119452.tar || (wget https://www.seanoe.org/data/00908/101948/data/119452.tar -O downloads/119452.tar && tar -C UVP6Net -xf downloads/119452.tar)

# FlowCamNet, 300k images, 93 classes, 1.5 GB
get-flowcamnet:
	test -e downloads/113201.tar || (wget https://www.seanoe.org/data/00908/101961/data/113201.tar -O downloads/113201.tar && tar -xf downloads/113201.tar)

# ZooCamNet, 1.3M images, 93 classes, 6.8 GB
get-zoocamnet:
	test -e downloads/113094.tar || (wget https://www.seanoe.org/data/00907/101928/data/113094.tar -O downloads/113094.tar && tar -xf downloads/113094.tar)

# ZooScanNet, 1.5M images, 120 classes, 12 GB
get-zooscannet:
	test -e downloads/113141.tar || (wget https://www.seanoe.org/data/00446/55741/data/113141.tar -O downloads/113141.tar && tar -xf downloads/113141.tar)

# ISIISNet, 400k images, 32 classes, 2 GB
get-isiisnet:
	test -e downloads/113146.tar || (wget https://www.seanoe.org/data/00908/101950/data/113146.tar -O downloads/113146.tar && tar -xf downloads/113146.tar)

# From Womack et al.

# HOLOCAM digital holography, 107k images, 19 classes, 45 GB
get-hboi:        (_get-zenodo "18497521" "hboi19-preprocessed.zip")

# ISIIS data via Kaggle, 14k images, 38 classes, 120 MB
get-kaggle38:    (_get-zenodo "18497521" "kaggle38-preprocessed.zip")

# Expanded ISIIS data set via Kaggle, 15k images, 83 classes, 130 MB
get-kaggle83:    (_get-zenodo "18497521" "kaggle83-preprocessed.zip")

# 95k images, 466 classes taxonomically standardized to WoRMS, 5.8 GB
get-linnaeus466: (_get-zenodo "18497521" "linnaeus466.zip")

# High resolution, 2.8k images in 23 phytoplankton classes, 40 MB
get-pmid23:      (_get-zenodo "18497521" "pmid23-preprocessed.zip")

# Unknown instrument, 214k images, 51 classes, 7 GB
get-syke51:      (_get-zenodo "18497521" "syke51-preprocessed.zip")

# UVP5, 630k images, 60 (sic) classes, 5.2 GB
get-uvp66:       (_get-zenodo "18497521"  "uvp66-preprocessed.zip")

# NOAA/University of Washington ZooCam data, 16k images in 38 classes, 500 MB
get-noaa38:        (_get-zenodo "18497521" "uw38-preprocessed.zip")

# Curated IFCB data from WHOI, 6.6k images, 22 classes, 2.8 GB
get-whoi22:      (_get-zenodo "18497521" "whoi22-preprocessed.zip")

# Curated IFCB data from WHOI, 250k images, 79 classes, 7.6 GB
get-whoi79:      (_get-zenodo "18497521" "whoi79-preprocessed.zip")

# DSPC, 18k images of 35 freshwater species from Lake Greifensee, 150 MB
get-zoolake35:   (_get-zenodo "18497521" "zoolake35-preprocessed.zip")

# ZooScan, 3700 images, 20 classes, 30 MB
get-zooscan20:   (_get-zenodo "18497521" "zooscan20-preprocessed.zip")

# ZooScan images, 1.4M images, 92 (sic) classes, 11 GB
get-zooscan93:   (_get-zenodo "18497521" "zooscan93-preprocessed.zip")


# FlowCam, possibly macro, 130k images, 76 classes. (Raw, as the processed include augmentations), 2 GB
get-planktonflow76:
    mkdir -p planktonflow76
    test -e downloads/planktonflow76.zip || (wget https://zenodo.org/records/16840846/files/raw_PlanktonFlow76.zip -O downloads/planktonflow76.zip && cd planktonflow76 && unzip ../downloads/planktonflow76)


# SYKE IFCB data, 63k images, 50 classes, 7 GB
get-syke50:
    mkdir -p syke50
    test -e downloads/syke50.zip || (wget https://b2share.eudat.eu/records/xvnrp-7ga56/files/phytoplankton_labeled.zip -O downloads/syke50.zip && cd syke50 && unzip ../downloads/syke50.zip)


# Years 2006-2014 from the WHOI, IFCB 3.5M images, automatic annotations, 21 GB
get-whoi:
	@echo "Getting WHOI IFCB data"
	mkdir -p whoi
	for x in 5bf89ef0-0155-5ac2-923b-f2a8578c963a e1fd23e9-1b79-51a8-a165-1f9bb30177d8 67fd1c6a-9268-58f6-808d-a757bf49a345 c1b63530-b104-5a1f-a8b3-f55898f788e7 7d6bd792-3fad-59aa-8906-af1fb377115e 18b14b5a-2a68-5f85-845f-1c1591a8f1a6 c9bf8e43-fa1c-5fd7-9328-04598db52c2e ff635112-6337-5b34-9354-4035847dae24 6968c380-3713-57b1-bdca-5b21e514a996; do \
	    test -e downloads/$x.zip || (wget https://darchive.mblwhoilibrary.org/bitstreams/$x/download -O downloads/$x.zip && cd whoi && unzip ../downloads/$x.zip) \
	done


# Not yet processed
# A collection of VPR data sets: https://www.bco-dmo.org/instrument/451

# Unworkable data:
# CSIRO provides some data sets, but the S3 storage and front end make the data difficult to download
# SYKE 24k/20 classes ZooScan: https://etsin.fairdata.fi/dataset/6fa42787-9772-41a5-a6fc-0dde489ed908  -- can't be downloaded directly (needs authorization)


_get-zenodo record filename:
        test -e downloads/{{filename}} || (wget https://zenodo.org/records/{{record}}/files/{{filename}}?download=1 -O downloads/{{filename}} && unzip downloads/{{filename}})

# By instrument type

get-all-uvp6: get-uvp6net
get-all-uvp5: get-uvp66
get-all-isiis: get-isiisnet get-kaggle83 get-kaggle38
get-all-ifcb: get-whoi get-whoi22 get-whoi79 get-syke50
get-all-flowcam: get-flowcamnet get-planktonflow76
get-all-zoocam: get-zoocamnet
get-all-zooscan: get-zooscannet get-zooscan20 get-zooscan93
get-all-misc: get-zoolake35 get-linnaeus466 get-pmid23 get-noaa38 get-hboi

# Download everything
get-everything: get-all-uvp6 get-all-uvp5 get-all-isiis get-all-ifcb get-all-flowcam get-all-zoocam get-all-zooscan get-all-misc

validate zipfile:
        @echo "Validating {{zipfile}}"
        grep {{zipfile}} downloads/checksums.txt | sha256sum -c -

