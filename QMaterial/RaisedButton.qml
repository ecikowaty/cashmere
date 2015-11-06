import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Button {
    id: root

    width: label.paintedWidth < 88 ? 88 : label.paintedWidth + 32
    height: 36
//    clip: true

    property alias  labelText: label.text
    property Color  color
    property int    colorIndex: 5

    onColorIndexChanged: {
        if (colorIndex > 7) {
            colorIndex = 7
        }
    }

    style: RaisedButtonStyle {
        baseColor: root.color
        colorIndex: root.colorIndex
        touchArea: mouseArea
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
        id: label
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

