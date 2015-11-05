import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    width: 200
    height: 50

    radius: 2

    property alias elevation: root.z

    RectangularGlow {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        width: parent.width * 1.02
        height: parent.height * 1.06

        z: parent.z - 1

        color: Qt.rgba(0, 0, 0, 0.3)

        glowRadius: 1
        cornerRadius: 4
        spread: 0.0
    }
}

