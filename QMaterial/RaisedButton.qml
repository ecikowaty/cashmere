import QtQuick 2.5
import "."

Card {
    width: label.paintedWidth < 88 ? 88 : label.paintedWidth + 32
    height: 36

    color: "#2196F3"

    property alias  text: label.text
    property bool   flat: false

    anchors.horizontalCenter: parent.horizontalCenter
    id: testView

    Label {
        id: label
        style: FontStyles.button
        anchors.centerIn: parent

        color: "white"
    }
}

