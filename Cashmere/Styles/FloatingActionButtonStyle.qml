import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import ".."

ButtonStyleBase {
   id: root

   label: Icon {
      name: control.action.iconName
      light: true
   }

   background: Item {
      implicitWidth: 56
      implicitHeight: implicitWidth

      DropShadow {
         width: buttonRect.width
         height: buttonRect.height
         radius: buttonRect.radius

         verticalOffset: 3
         samples: 17

         source: ShaderEffectSource {
            width: control.width
            height: control.height
            sourceItem: buttonRect
         }

         color: Qt.rgba(0, 0, 0, 0.26)
      }

      Rectangle {
         id: buttonRect
         color: Colors.pink.accent[2]

         width: parent.width
         height: parent.height
         radius: width / 2

         anchors.centerIn: parent

         Ripple {
            id: ripple
            anchors.centerIn: parent
            color: root.light ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(0, 0, 0, 0.16)
         }

         Connections {
            target: control
            onClicked: ripple.start()
         }

      }
   }
}
