import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
    id: root

    property string state: "normal"
    property Color  baseColor
    property int    colorIndex: 5

    property MouseArea touchArea

    background: Card {
        id: card

        color: baseColor.regular[colorIndex]
        Behavior on color { ColorAnimation { duration: 100 } }

        states: [
            State {
                name: "normal"
                when: !touchArea.containsMouse && !touchArea.pressed
                PropertyChanges {
                    target: card
                    color: baseColor.regular[colorIndex]
                }
            },
            State {
                name: "hover"
                when: touchArea.containsMouse && !touchArea.pressed
                PropertyChanges {
                    target: card
                    color: baseColor.regular[colorIndex + 1]
                }
            },
            State {
                name: "pressed"
                when: touchArea.pressed
                PropertyChanges {
                    target: card
                    color: baseColor.regular[colorIndex + 2]
                }
            }
        ]
    }
}

