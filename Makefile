VERSION_FILE=Version
RELEASE_VERSION=`cat $(VERSION_FILE)`

build-base:
	docker build \
		-t sh1d0w/alpine-nvim \
		-t sh1d0w/alpine-nvim:${RELEASE_VERSION} \
		./base

release-base: build-base
	docker push sh1d0w/alpine-nvim:latest
	docker push sh1d0w/alpine-nvim:${RELEASE_VERSION}

build-ts: release-base
	docker build \
		-t sh1d0w/nvim-typescript \
		-t sh1d0w/nvim-typescript:${RELEASE_VERSION} \
		./typescript

release-ts: build-ts
	docker push sh1d0w/nvim-typescript:latest
	docker push sh1d0w/nvim-typescript:${RELEASE_VERSION}

build-php: release-base
	docker build \
		-t sh1d0w/nvim-php \
		-t sh1d0w/nvim-php:${RELEASE_VERSION} \
		./php

release-php: build-php
	docker push sh1d0w/nvim-php:latest
	docker push sh1d0w/nvim-php:${RELEASE_VERSION}

release: release-base release-ts release-php
	echo "Done."
