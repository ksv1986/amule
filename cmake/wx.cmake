#
# This file is part of the aMule Project.
#
# Copyright (c) 2011 Werner Mahr (Vollstrecker) <amule@vollstreckernet.de>
#
# Any parts of this program contributed by third-party developers are copyrighted
# by their respective authors.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
#
#
# This file provides the CHECK_WX Macro which checks if wx is at least in a
# version defined by MIN_WX_VERSION. This check will go away, when cmake
# findWX module supports check of version
# 
# Furthermore it sets the LIBS, LIBDIR and DEFS needed for compilation.
# This can be controled by setting wx_NEED_BASE and wx_NEED_GUI vars.
#

MACRO (CHECK_WX)
	SET (wx_COMPONENTS base)

	IF (wx_NEED_GUI)
		SET (wx_COMPONENTS ${wx_COMPONENTS} core)
	ENDIF (wx_NEED_GUI)

	IF (wx_NEED_NET)
		SET (wx_COMPONENTS ${wx_COMPONENTS} net)
	ENDIF (wx_NEED_NET)

	IF (wx_NEED_ADV)
		SET (wx_COMPONENTS ${wx_COMPONENTS} adv)
	ENDIF (wx_NEED_ADV)

	FIND_PACKAGE (wxWidgets ${MIN_WX_VERSION} COMPONENTS ${wx_COMPONENTS} REQUIRED)

	INCLUDE( "${wxWidgets_USE_FILE}" )

	IF (wx_NEED_GUI)
		SET (wxWidgets_DEFINITIONS "${wxWidgets_DEFINITIONS};USE_WX_EXTENSIONS")
	ENDIF (wx_NEED_GUI)

ENDMACRO (CHECK_WX)
