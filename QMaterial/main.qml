import QtQuick 2.5
import QtQuick.Window 2.2
import "."

Window {
    visible: true
    width: 480
    height: 800

    Column {
        anchors.fill: parent

        Label {
            text: "Light"
            style: FontStyles.display4
        }

        Label {
            text: "Regular"
            style: FontStyles.display2
        }

        Label {
            text: "Medium"
            style: FontStyles.body2
        }

        Label {
            text: "Random body text"
        }

    }
}

