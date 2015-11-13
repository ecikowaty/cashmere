import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   property Action   action
   property int      size: 24
   property bool     light: true

   background: Item {
      opacity: control.enabled ? 1 : 0.5

      Ripple {
         id: ripple
         expandedSize: parent.width * 2.5
         anchors.centerIn: parent
         color: Qt.rgba(1, 1, 1, 0.2)
      }

      Icon {
         anchors.centerIn: parent
         name: action.iconName
         light: root.light
      }

      Connections {
         target: control
         onClicked: {
            ripple.start()
            if (action) {
               action.trigger(root)
            }
         }
      }
   }
}

