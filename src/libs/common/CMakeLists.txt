ADD_LIBRARY (mulecommon STATIC
	FileFunctions.cpp
	Format.cpp
	MD5Sum.cpp
	MuleDebug.cpp
	Path.cpp
	strerror_r.c
	StringFunctions.cpp
	TextFile.cpp
)

TARGET_INCLUDE_DIRECTORIES (mulecommon
	PRIVATE ${OPENSSL_INCLUDE_DIR}
)

TARGET_COMPILE_DEFINITIONS (mulecommon
	PRIVATE "${wxWidgets_BASE_DEFS}"
)

TARGET_LINK_LIBRARIES (mulecommon ${wxWidgets_BASE_LIBRARIES})
