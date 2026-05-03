
default:
	@echo "Select a target"

tmpdir:
	mkdir -p tmp

# From Panaoïtis 2026:
#   FlowCAM: <https://www.seanoe.org/data/00908/101961/>
#   ISIIS: <https://www.seanoe.org/data/00908/101950/>
#   UVP6: <https://www.seanoe.org/data/00908/101948/>
#   ZooCam: <https://www.seanoe.org/data/00907/101928/>
#   ZooScan: <https://www.seanoe.org/data/00446/55741/>

# UVP6Net, 630k images, 54 classes
get-uvp6-net: tmpdir
	@echo "Getting uvp6-net data"
	# UVP6 does not create its own directory
	mkdir -p UVP6Net
	test -e tmp/119452.tar || (wget https://www.seanoe.org/data/00908/101948/data/119452.tar -O tmp/119452.tar && tar -C UVP6Net -xf tmp/119452.tar)

# FlowCamNet, 300k images, 93 classes
get-flowcam: tmpdir
	@echo "Getting flowcam data"
	test -e tmp/113201.tar || (wget https://www.seanoe.org/data/00908/101961/data/113201.tar -O tmp/113201.tar && tar -xf tmp/113201.tar)

# ZooCamNet, 1.3M images, 93 classes
get-zoocam: tmpdir
	@echo "Getting ZooCam data"
	test -e tmp/113094.tar || (wget https://www.seanoe.org/data/00907/101928/data/113094.tar -O tmp/113094.tar && tar -xf tmp/113094.tar)

# ZooScanNet, 1.5M images, 120 classes.
get-zooscan: tmpdir
	@echo "Getting ZooScan data"
	test -e tmp/113141.tar || (wget https://www.seanoe.org/data/00446/55741/data/113141.tar -O tmp/113141.tar && tar -xf tmp/113141.tar)

# ISIISNet, 400k images, 32 classes.
get-isiis: tmpdir
	@echo "Getting ISIIS data"
	test -e tmp/113146.tar || (wget https://www.seanoe.org/data/00908/101950/data/113146.tar -O tmp/113146.tar && tar -xf tmp/113146.tar)

# From Womack et al.

# HOLOCAM digital holography, 107k images, 19 classes
get-hboi:        (get-zenodo "18497521" "hboi19-preprocessed.zip")

# ISIIS data, 14k images, 38 classes.
get-kaggle38:    (get-zenodo "18497521" "kaggle38-preprocessed.zip")

# Expanded ISIIS data set, Kaggle38, 15k images, 83 classes
get-kaggle83:    (get-zenodo "18497521" "kaggle83-preprocessed.zip")

# 95k images, 466 classes taxonomically standardized to WoRMS
get-linnaeus466: (get-zenodo "18497521" "linnaeus466.zip")

# High resolution, 2.8k images in 23 phytoplankton classes
get-pmid23:      (get-zenodo "18497521" "pmid23-preprocessed.zip")

# Unknown instrument, 214k images, 51 classes.
get-syke51:      (get-zenodo "18497521" "syke51-preprocessed.zip")

# UVP5, 630k images, 60 (sic) classes
get-uvp66:       (get-zenodo "18497521"  "uvp66-preprocessed.zip")

# NOAA/University of Washington ZooCam data, 16k images in 38 classes.
get-noaa38:        (get-zenodo "18497521" "uw38-preprocessed.zip")

# Curated IFCB data from WHOI, 6.6k images, 22 classes.
get-whoi22:      (get-zenodo "18497521" "whoi22-preprocessed.zip")

# Curated IFCB data from WHOI, 250k images, 79 classes.
get-whoi79:      (get-zenodo "18497521" "whoi79-preprocessed.zip")

# DSPC, 18k images of 35 freshwater species from Lake Greifensee
get-zoolake35:   (get-zenodo "18497521" "zoolake35-preprocessed.zip")

# ZooScan, 3700 images, 20 classes
get-zooscan20:   (get-zenodo "18497521" "zooscan20-preprocessed.zip")

# ZooScan images, 1.4M images, 92 (sic) classes
get-zooscan93:   (get-zenodo "18497521" "zooscan93-preprocessed.zip")

# Years 2006-2014 from the WHOI, IFCB 3.5M images, automatic annotations
get-whoi: tmpdir
	@echo "Getting WHOI IFCB data"
	mkdir -p whoi
	for x in 5bf89ef0-0155-5ac2-923b-f2a8578c963a e1fd23e9-1b79-51a8-a165-1f9bb30177d8 67fd1c6a-9268-58f6-808d-a757bf49a345 c1b63530-b104-5a1f-a8b3-f55898f788e7 7d6bd792-3fad-59aa-8906-af1fb377115e 18b14b5a-2a68-5f85-845f-1c1591a8f1a6 c9bf8e43-fa1c-5fd7-9328-04598db52c2e ff635112-6337-5b34-9354-4035847dae24 6968c380-3713-57b1-bdca-5b21e514a996; do \
	    test -e tmp/$x.zip || (wget https://darchive.mblwhoilibrary.org/bitstreams/$x/download -O tmp/$x.zip && cd whoi && unzip ../tmp/$x.zip) \
	done

# CSIRO provides some data sets, but the S3 storage and front end make the data difficult to download
# SYKE 24k/20 classes ZooScan: https://etsin.fairdata.fi/dataset/6fa42787-9772-41a5-a6fc-0dde489ed908
# SYKE 63k/50 IFCB: https://b2share.eudat.eu/records/xvnrp-7ga56

get-zenodo record filename:
        test -e tmp/{{filename}} || (wget https://zenodo.org/records/{{record}}/files/{{filename}}?download=1 -O tmp/{{filename}} && unzip tmp/{{filename}})

get-all-data: get-uvp6-net get-flowcam get-zoocam get-zooscan get-isiis get-uw38 get-whoi

validate zipfile:
        @echo "Validating {{zipfile}}"
        (cd tmp && grep {{zipfile}} checksums.txt | sha256sum -c -)

