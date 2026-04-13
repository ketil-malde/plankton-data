
default:
	@echo "Select a target"

get-uvp6-net:
	@echo "Getting uvp6-net data"
	mkdir -p tmp uvp6-net
	test -e tmp/119452.tar || (wget https://www.seanoe.org/data/00908/101948/data/119452.tar -O tmp/119452.tar && tar -C uvp6-net -xf tmp/119452.tar)

get-flowcam:
	@echo "Getting flowcam data"
	mkdir -p tmp flowcam
	test -e tmp/113201.tar || (wget https://www.seanoe.org/data/00908/101961/data/113201.tar -O tmp/113201.tar && tar -C flowcam -xf tmp/113201.tar)

get-zoocam:
	@echo "Getting ZooCam data"
	mkdir -p tmp/zoocam
	test -e tmp/113094.tar || (wget https://www.seanoe.org/data/00907/101928/data/113094.tar -O tmp/113094.tar && tar -C zoocam -xf tmp/113094.tar)

get-zooscan:
	@echo "Getting ZooScan data"
	mkdir -p tmp/zooscan
	test -e tmp/113141.tar || (wget https://www.seanoe.org/data/00446/55741/data/113141.tar -O tmp/113141.tar && tar -C zooscan -xf tmp/113141.tar)

get-isiis:
	@echo "Getting ISIIS data"
	mkdir -p tmp/isiis
	test -e tmp/113146.tar || (wget https://www.seanoe.org/data/00908/101950/data/113146.tar -O tmp/113146.tar && tar -C isiis -xf tmp/113146.tar)



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
