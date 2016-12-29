HUGO_IMG=jojomi/hugo:0.18
S3_BUCKET=s3://www.yunspace.com

deps:
	git clone https://github.com/vjeantet/hugo-theme-casper themes/casper
.PHONY: deps

build: clean deps
	$(call dockerHugo) 
.PHONY: build

deploy:
	aws s3 sync public $(S3_BUCKET)
.PHONY: deploy

clean:
	rm -rf public themes
.PHONY: clean

define dockerHugo
	docker run --rm \
		-v $(shell pwd):/src \
   		-v $(shell pwd)/public:/output \
		$(HUGO_IMG)  
endef
