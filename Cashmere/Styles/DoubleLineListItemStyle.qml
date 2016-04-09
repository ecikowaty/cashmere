import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property string secondaryText

   property Component icon: Icon {
      name: control.action.iconName
      color: Theme.onLightBackground.secondary
   }

   label: Item {

   }

   background: ListItem {
      id: background

      control: root.control

      Loader {
         id: iconLoader
         width: 24
         height: 24

         anchors.left: parent.left
         anchors.leftMargin: 16
         anchors.verticalCenter: parent.verticalCenter

         sourceComponent: root.icon
      }

      Item {
         width: Math.max(primaryLabel.paintedWidth, secondaryLabel.paintedWidth)
         height: primaryLabel.paintedHeight + secondaryLabel.paintedHeight

         anchors {
            left: root.icon ? iconLoader.right : parent.left
            leftMargin: root.icon ? 32 : 16
            verticalCenter: parent.verticalCenter
         }

         Label {
            id: primaryLabel

            fontStyle: FontStyles.subheading
            text: control.text
         }

         Label {
            id: secondaryLabel
            anchors.bottom: parent.bottom

            fontStyle: FontStyles.body1
            color: Theme.onLightBackground.secondary
            text: root.secondaryText
         }

      }
   }
}

