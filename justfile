
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

get-uvp6-net: tmpdir
	@echo "Getting uvp6-net data"
	# UVP6 does not create its own directory
	mkdir -p UVP6Net
	test -e tmp/119452.tar || (wget https://www.seanoe.org/data/00908/101948/data/119452.tar -O tmp/119452.tar && tar -C UVP6Net -xf tmp/119452.tar)

get-flowcam: tmpdir
	@echo "Getting flowcam data"
	test -e tmp/113201.tar || (wget https://www.seanoe.org/data/00908/101961/data/113201.tar -O tmp/113201.tar && tar -xf tmp/113201.tar)

get-zoocam: tmpdir
	@echo "Getting ZooCam data"
	test -e tmp/113094.tar || (wget https://www.seanoe.org/data/00907/101928/data/113094.tar -O tmp/113094.tar && tar -xf tmp/113094.tar)

get-zooscan: tmpdir
	@echo "Getting ZooScan data"
	test -e tmp/113141.tar || (wget https://www.seanoe.org/data/00446/55741/data/113141.tar -O tmp/113141.tar && tar -xf tmp/113141.tar)

get-isiis: tmpdir
	@echo "Getting ISIIS data"
	test -e tmp/113146.tar || (wget https://www.seanoe.org/data/00908/101950/data/113146.tar -O tmp/113146.tar && tar -xf tmp/113146.tar)

# From Womack et al.
get-hboi:        (get-zenodo "18497521" "hboi19-preprocessed.zip")
get-kaggle38:    (get-zenodo "18497521" "kaggle38-preprocessed.zip")
get-kaggle83:    (get-zenodo "18497521" "kaggle83-preprocessed.zip")
get-linnaeus466: (get-zenodo "18497521" "linnaeus466.zip")
get-pmid23:      (get-zenodo "18497521" "pmid23-preprocessed.zip")
get-syke51:      (get-zenodo "18497521" "syke51-preprocessed.zip")
get-uvp66:       (get-zenodo "18497521"  "uvp66-preprocessed.zip")
get-uw38:        (get-zenodo "18497521" "uw38-preprocessed.zip")
get-whoi22:      (get-zenodo "18497521" "whoi22-preprocessed.zip")
get-whoi79:      (get-zenodo "18497521" "whoi79-preprocessed.zip")
get-zoolake35:   (get-zenodo "18497521" "zoolake35-preprocessed.zip")
get-zooscan20:   (get-zenodo "18497521" "zooscan20-preprocessed.zip")
get-zooscan93:   (get-zenodo "18497521" "zooscan93-preprocessed.zip")

# From WHOI
get-whoi: tmpdir
	@echo "Getting WHOI IFCB data"
	mkdir -p whoi
	for x in 5bf89ef0-0155-5ac2-923b-f2a8578c963a e1fd23e9-1b79-51a8-a165-1f9bb30177d8 67fd1c6a-9268-58f6-808d-a757bf49a345 c1b63530-b104-5a1f-a8b3-f55898f788e7 7d6bd792-3fad-59aa-8906-af1fb377115e 18b14b5a-2a68-5f85-845f-1c1591a8f1a6 c9bf8e43-fa1c-5fd7-9328-04598db52c2e ff635112-6337-5b34-9354-4035847dae24 6968c380-3713-57b1-bdca-5b21e514a996; do \
	    test -e tmp/$x.zip || (wget https://darchive.mblwhoilibrary.org/bitstreams/$x/download -O tmp/$x.zip && cd whoi && unzip ../tmp/$x.zip) \
	done

# CSIRO provides some data sets, but the S3 storage and front end make the data difficult to download

get-zenodo record filename:
        test -e tmp/{{filename}} || (wget https://zenodo.org/records/{{record}}/files/{{filename}}?download=1 -O tmp/{{filename}} && unzip tmp/{{filename}})

get-all-data: get-uvp6-net get-flowcam get-zoocam get-zooscan get-isiis get-uw38 get-whoi

validate zipfile:
        @echo "Validating {{zipfile}}"
        (cd tmp && grep {{zipfile}} checksums.txt | sha256sum -c -)

