DEST = build

.PHONEY: all

################################################################################
define PACKAGE
all: $(DEST)/$(1)$(2).nupkg

$(DEST)/$(1)$(2).nupkg: pkgs/$(1)/$(1).nuspec
	@ mkdir -p $(DEST)
	choco pack --outdir $(DEST) pkgs/$(1)/$(1).nuspec
endef

################################################################################
$(eval $(call PACKAGE,doxygen,1.14.0))
