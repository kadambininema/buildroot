################################################################################
#
# dbus-cxx
#
################################################################################

DBUS_CXX_VERSION = 2.5.2
DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
DBUS_CXX_INSTALL_STAGING = YES
DBUS_CXX_DEPENDENCIES = libsigc

ifeq ($(BR2_PACKAGE_QT5BASE),y)
DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=ON
DBUS_CXX_DEPENDENCIES += qt5base
else
DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=ON
DBUS_CXX_DEPENDENCIES += libglib2
else
DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_LIBUV),y)
DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=ON
DBUS_CXX_DEPENDENCIES += libuv
else
DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=OFF
endif

$(eval $(cmake-package))
