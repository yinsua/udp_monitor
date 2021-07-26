TEMPLATE = app
QT += core quick qml

CONFIG += c++17 qmltypes

QML_IMPORT_NAME = THE_NAME
QML_IMPORT_MAJOR_VERSION = 1

SOURCES += \
        main.cpp \
        server.cpp \

HEADERS += \
        network.h \
        server.h \

RESOURCES += qml.qrc
LIBS += -lwsock32 -lws2_32
