HUGO_IMG=jojomi/hugo:0.18

deps:
    git clone https://github.com/vjeantet/hugo-theme-casper themes/casper
.PHONY: deps

build: deps
	$(call dockerHugo) 
.PHONY: build

clean:
	rm -rf public themes
.PHONY: clean

define dockerHugo
	docker run -ti \
		-v $(shell PWD):/src \
   		-v $(shell PWD)/public:/output \
		$(HUGO_IMG)  
endef
