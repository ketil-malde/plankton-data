
default:
	@echo "Select a target"

tmpdir:
	mkdir -p tmp

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

get-womack: tmpdir
	@echo "Getting data from Womack et al"
	mkdir -p tmp womack
	test -e tmp/womack.zip || (wget https://darchive.mblwhoilibrary.org/bitstreams/6968c380-3713-57b1-bdca-5b21e514a996/download -O tmp/womack.zip)

get-whoi: tmpdir
	@echo "Getting WHOI IFCB data"
	mkdir -p whoi
	for x in 5bf89ef0-0155-5ac2-923b-f2a8578c963a e1fd23e9-1b79-51a8-a165-1f9bb30177d8 67fd1c6a-9268-58f6-808d-a757bf49a345 c1b63530-b104-5a1f-a8b3-f55898f788e7 7d6bd792-3fad-59aa-8906-af1fb377115e 18b14b5a-2a68-5f85-845f-1c1591a8f1a6 c9bf8e43-fa1c-5fd7-9328-04598db52c2e ff635112-6337-5b34-9354-4035847dae24 6968c380-3713-57b1-bdca-5b21e514a996; do \
	    test -e tmp/$x.zip || (wget https://darchive.mblwhoilibrary.org/bitstreams/$x/download -O tmp/$x.zip && cd whoi && unzip ../tmp/$x.zip) \
	done


# fucking CSIRO wankers.
# https://s3.data.csiro.au/dapprd/000064786v001/data/data/FC8400/CS17/2022-08-25/02/images/FC8400_CS17_02_2X_1000FOV_20220825T124500%2B0800_000001.JPG?response-content-disposition=attachment%3B%20filename%3D%22FC8400_CS17_02_2X_1000FOV_20220825T124500%2B0800_000001.JPG%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260409T151654Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Credential=BR3J2PWXHENVTUT1NQVX%2F20260409%2FCDC%2Fs3%2Faws4_request&X-Amz-Signature=a83e7b9e41a8ec5075cc52a5c098e35ece86ef79882b1f3969ce7ce116d41e2d



get-data: get-uvp6-net get-flowcam get-zoocam get-zooscan get-isiis
	@echo "Getting data"

train:
	@echo "Training VAE"

# From Panaoïtis 2026:
#   FlowCAM: <https://www.seanoe.org/data/00908/101961/>
#   ISIIS: <https://www.seanoe.org/data/00908/101950/>
#   UVP6: <https://www.seanoe.org/data/00908/101948/>
#   ZooCam: <https://www.seanoe.org/data/00907/101928/>
#   ZooScan: <https://www.seanoe.org/data/00446/55741/>
