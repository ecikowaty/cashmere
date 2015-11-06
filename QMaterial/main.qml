import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
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
            height: 70
        }

        RaisedButton {
            color: Colors.blue
            colorIndex: 6

            anchors.horizontalCenter: parent.horizontalCenter

            labelText: "hello"
        }
    }
}

