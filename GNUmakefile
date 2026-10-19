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
$(eval $(call PACKAGE,ccache,4.14.1))
$(eval $(call PACKAGE,rclone,1.75.2))
$(eval $(call PACKAGE,rsync,6.2.7))
