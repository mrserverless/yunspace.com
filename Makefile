HUGO_IMG=jojomi/hugo:0.63.1
S3_BUCKET=s3://www.yunspace.com

build: clean 
	$(call dockerHugoBuild)
.PHONY: build

start:
	$(call dockerHugoServer)
.PHONY: start

stop:
	docker stop "hugo-yunspace"
	docker rm "hugo-yunspace"
.PHONY: stop

clean:
	rm -rf public
.PHONY: clean

_build:
	hugo

define dockerHugoBuild
	docker run --rm \
		-v $(shell pwd):/src \
   		-v $(shell pwd)/public:/output \
		$(HUGO_IMG)  
endef

define dockerHugoServer
	docker run --name "hugo-yunspace" -d \
		-p 1313:1313 \
		-e HUGO_WATCH=true \
		-v $(shell pwd):/src \
   		-v $(shell pwd)/public:/output \
		$(HUGO_IMG)  
endef