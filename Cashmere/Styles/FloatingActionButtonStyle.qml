import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import ".."

ButtonStyleBase {
   id: root

   property bool mini: false
   property bool light: false
   property color color: Theme.primaryColor

   label: Icon {
      name: control.action.iconName
      light: root.light
   }

   background: Item {
      implicitWidth: root.mini ? 40 : 56
      implicitHeight: implicitWidth

      DropShadow {
         width: buttonRect.width
         height: buttonRect.height
         radius: buttonRect.radius

         verticalOffset: 6
         samples: 14

         source: ShaderEffectSource {
            width: control.width
            height: control.height
            sourceItem: buttonRect
         }

         color: Qt.rgba(0, 0, 0, 0.46)
      }

      Rectangle {
         id: buttonRect
         color: root.color

         width: parent.implicitWidth
         height: parent.implicitHeight
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
