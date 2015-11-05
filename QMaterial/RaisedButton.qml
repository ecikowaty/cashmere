import QtQuick 2.5
import "."

Card {
    width: label.paintedWidth < 88 ? 88 : label.paintedWidth + 32
    height: 36

    property alias  text: label.text

    anchors.horizontalCenter: parent.horizontalCenter
    id: testView

    Label {
        id: label
        style: FontStyles.button
        anchors.centerIn: parent

        color: "white"
    }
}

