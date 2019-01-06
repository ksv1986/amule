#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=amule
PKG_VERSION:=3946fa2a6e39c4c0cd20ee353b065420d0fb51b9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).zip
PKG_SOURCE_URL:=https://github.com/ksv1986/amule/archive
PKG_HASH:=eb992c9f4680024673819ed37047454367f3982b09ea8e8f9f442b409ae8d662
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/amuled
  SUBMENU:=P2P
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A multi-platform eMule-like ed2k client
  URL:=http://www.amule.org/
  DEPENDS:=+libpthread +libwxbase +openssl
endef

CONFIGURE_ARGS+= \
	--enable-amule-daemon \
	--disable-static \
	--disable-rpath \
	--disable-ccache \
	--disable-profile \
	--disable-debug \
	--disable-monolithic \
	--disable-amulecmd \
	--disable-webserver \
	--disable-amule-gui \
	--disable-cas \
	--disable-wxcas \
	--disable-ed2k \
	--disable-alc \
	--disable-alcc \
	\
	--with-gnu-ld \
	--with-zlib="$(STAGING_DIR)/usr" \
	--with-wx-prefix="$(STAGING_DIR)/usr" \


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		HOSTCC="$(HOSTCC)" \
		DESTDIR="$(PKG_INSTALL_DIR)"
endef

define Package/amuled/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/amuled $(1)/usr/bin/
endef

$(eval $(call BuildPackage,amuled))
