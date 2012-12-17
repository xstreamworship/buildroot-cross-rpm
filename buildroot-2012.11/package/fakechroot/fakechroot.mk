#############################################################
#
# fakechroot
#
#############################################################
FAKECHROOT_VERSION = 2.15
FAKECHROOT_SOURCE = fakechroot_$(FAKECHROOT_VERSION).orig.tar.gz
FAKECHROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakechroot/
FAKECHROOT_LICENSE = GPLv3+
FAKECHROOT_LICENSE_FILES = COPYING

$(eval $(host-autotools-package))
