import QtQuick 2.5
import QtQuick.Window 2.2
import "."

Window {
    visible: true
    width: 480
    height: 800

    Column {
        anchors.fill: parent
        spacing: 10

        Item {
            width: 20
            height: 20
        }

        Button {
            text: "hello"
            flat: true
        }
    }
}

