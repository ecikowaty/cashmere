import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   property int      size: 24
   property bool     lightBackground: false

   label: Label {

   }

   background: Item {
      opacity: control.enabled ? 1 : 0.5

      Ripple {
         id: ripple
         expandedSize: parent.width * 2.5
         anchors.centerIn: parent
         color: lightBackground ? Qt.rgba(1, 1, 1, 0.2) : Qt.rgba(0, 0, 0, 0.2)

         Connections {
            target: control
            onClicked: {
               if (!ripple.running && control.pressed) {
                  ripple.start()
               }
            }
         }
      }

      Icon {
         anchors.centerIn: parent
         name: control.action.iconName
         lightBackground: root.lightBackground
      }
   }
}

