HUGO_IMG=jojomi/hugo:0.18
S3_BUCKET=s3://www.yunspace.com

deps:
	git clone https://github.com/vjeantet/hugo-theme-casper themes/casper
.PHONY: deps

build: clean deps
	$(call dockerHugoBuild) 
.PHONY: build

start:
	$(call dockerHugoServer)
.PHONY: start

stop:
	docker stop "hugo-yunspace"
	docker rm "hugo-yunspace"
.PHONY: stop

deploy:
	aws s3 sync public $(S3_BUCKET)
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E3CYI74S0HW74Z --paths /index.html /post /about /talks /tags
.PHONY: deploy

clean:
	rm -rf public themes
.PHONY: clean

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