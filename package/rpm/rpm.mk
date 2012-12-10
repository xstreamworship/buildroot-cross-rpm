#############################################################
#
# rpm
#
#############################################################
RPM_VERSION = 5.4.10
RPM_SITE = http://rpm5.org/files/rpm/rpm-5.4/
RPM_DEPENDENCIES = host-rpm zlib beecrypt neon popt berkeleydb uuid
HOST_RPM_DEPENDENCIES = host-zlib host-beecrypt host-popt host-neon host-openssl host-berkeleydb host-uuid

RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
		ac_cv_va_copy=yes

HOST_RPM_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -DHAVE_MUTEX_THREAD_ONLY -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_CROSSRPM" \
		ac_cv_va_copy=yes ac_cv_lib_beecrypt_mpfprintln=yes LDFLAGS="$(HOST_LDFLAGS) -L$(HOST_DIR)/usr/lib"

#-I$(HOST_DIR)/usr/include/beecrypt -I$(HOST_DIR)/usr/include/neon -I$(HOST_DIR)/usr/include

RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
	--without-selinux \
	--without-python --without-perl \
	--disable-openmp \
	--with-uuid=external \
	--with-openssl=external \
	--with-db=external --with-dbsql --without-db-tools-integrated \
	--with-zlib=$(STAGING_DIR) \
	--with-libbeecrypt=$(STAGING_DIR) \
	--with-neon=external \
	--with-popt=$(STAGING_DIR)

HOST_RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
	--with-sysroot=$(HOST_DIR) \
	--without-selinux \
	--without-python --without-perl \
	--disable-openmp \
	--with-uuid=external \
	--with-openssl=external \
	--with-db=external --with-dbsql --without-db-tools-integrated \
	--with-zlib=external \
	--with-libbeecrypt=external \
	--with-neon=external \
	--with-popt=external


ifeq ($(BR2_PACKAGE_PCRE),y)
RPM_DEPENDENCIES += pcre
RPM_CONF_OPT += --with-pcre=external
HOST_RPM_DEPENDENCIES += host-pcre
HOST_RPM_CONF_OPT += --with-pcre=external
else
RPM_CONF_OPT += --with-pcre=no
HOST_RPM_CONF_OPT += --with-pcre=no
endif


ifeq ($(BR2_PACKAGE_FILE),y)
RPM_DEPENDENCIES += file
RPM_CONF_OPT += --with-file=external
HOST_RPM_DEPENDENCIES += host-file
HOST_RPM_CONF_OPT += --with-file=external
else
RPM_CONF_OPT += --with-file=no
HOST_RPM_CONF_OPT += --with-file=no
endif

ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
RPM_CONF_OPT+=--with-xz
endif

ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
RPM_CONF_OPT+=--with-bzip2
RPM_DEPENDENCIES+=bzip2
endif

RPM_MAKE = $(MAKE1)

RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install

$(eval $(autotools-package))
$(eval $(host-autotools-package))

