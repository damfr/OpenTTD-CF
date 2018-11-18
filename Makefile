CI =
CI += ci-linux
CI += ci-commit-checker
CI += ci-osx

RELEASE =
RELEASE += release-linux-deb-gcc
RELEASE += release-linux-generic-gcc
RELEASE += release-osx
RELEASE += release-windows-bundle

.PHONY: all
all: release ci

.PHONY: prune
prune:
	docker image prune -f

.PHONY: release
release: $(RELEASE)

.PHONY: ci
ci: $(CI)

.PHONY: $(RELEASE)
$(RELEASE):
	$@/build.sh openttd/compile-farm

.PHONY: $(CI)
$(CI):
	$@/build.sh openttd/compile-farm-ci
