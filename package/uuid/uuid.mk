#############################################################
#
# uuid
#
#############################################################

UUID_VERSION = 1.6.2
UUID_SITE = ftp://ftp.ossp.org/pkg/lib/uuid/uuid-$(UUID_VERSION).tar.gz
UUID_INSTALL_STAGING = YES
UUID_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
UUID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
UUID_DEPENDENCIES = host-pkgconf
UUID_LICENSE = MIT
UUID_LICENSE_FILES = README

$(eval $(autotools-package))
$(eval $(host-autotools-package))
