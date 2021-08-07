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

ts: release-base
	docker build \
		-t sh1d0w/nvim-typescript \
		-t sh1d0w/nvim-typescript:${RELEASE_VERSION} \
		./typescript

release-ts: ts
	docker push sh1d0w/nvim-typescript:latest
	docker push sh1d0w/nvim-typescript:${RELEASE_VERSION}
