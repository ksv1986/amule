ADD_SUBDIRECTORY (docs)

ADD_EXECUTABLE (cas
	cas.c
	configfile.c
	functions.c
	graphics.c
	html.c
	lines.c
)

FIND_PACKAGE(GD REQUIRED)

IF (WIN32)
	TARGET_SOURCES (cas
		${CMAKE_SOURCE_DIR}/version.rc
	)
ENDIF (WIN32)

TARGET_LINK_LIBRARIES (cas
	${GD_LIBRARIES}
)

INSTALL (TARGETS cas
	RUNTIME DESTINATION bin
)


INSTALL ( FILES tmp.html stat.png
	DESTINATION "${DATADIR}/cas"
)

