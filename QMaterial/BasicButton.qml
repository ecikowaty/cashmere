import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Button {
    id: root

    width: textLabel.paintedWidth < 88 ? 88 : textLabel.paintedWidth + 32
    height: 36

    property alias  label: textLabel
    property Color  color
    property int    colorIndex: 5

    property MouseArea touchArea: mouseArea

    onColorIndexChanged: {
        if (colorIndex > 7) {
            colorIndex = 7
        }
    }

    Item {
        anchors.fill: parent
        clip: true

        Ripple {
            id: ripple
            anchors.centerIn: parent
            color: Qt.rgba(0, 0, 0, 0.16)
        }
    }

    Label {
        id: textLabel
        style: FontStyles.button
        anchors.centerIn: parent

        color: "white"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: ripple.start()
    }
}

