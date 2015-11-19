import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   width: selectedLabel.paintedWidth + icon.width + 16
   height: 48

   property alias currentItemText: selectedLabel.text
   property alias actions: dropdownMenu.actions
   property alias items: dropdownMenu.items

   Label {
      id: selectedLabel

      fontStyle: FontStyles.subheading
      color: Theme.secondaryText

      text: actions[dropdownMenu.currentItemIndex].text

      anchors.verticalCenter: parent.verticalCenter
   }

   MouseArea {
      anchors.fill: parent
      onClicked: dropdownMenu.open()
   }

   DropdownMenu {
      id: dropdownMenu

      function calculateVecticalMargin() {
         return 0
      }

      anchors {
         centerIn: parent
      }
   }

   Icon {
      id: icon

      name: "arrow_drop_down"
      anchors {
         right: parent.right
         verticalCenter: parent.verticalCenter
      }
   }

   Divider {
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 8

      height: 1
   }
}

