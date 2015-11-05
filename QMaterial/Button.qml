import QtQuick 2.5
import "."

View {
    width: 120
    height: 36

    property alias  text: label.text
    property bool   flat: false

    anchors.horizontalCenter: parent.horizontalCenter
    id: testView

    Label {
        id: label
        style: FontStyles.button
        anchors.centerIn: parent
    }
}

