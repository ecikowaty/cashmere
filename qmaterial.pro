TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc \
    fonts.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML2_IMPORT_PATH = c:\Users\wro00782\projects\qmaterial\qml\

# Default rules for deployment.
include(deployment.pri)

