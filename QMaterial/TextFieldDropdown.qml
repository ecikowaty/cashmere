import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   width: selectedLabel.paintedWidth + icon.width + 16
   height: 48

   property alias currentItemText: selectedLabel.text
//   property alias actions: dropdownMenu.actions
//   property alias items: dropdownMenu.items

   OverlayBinder {
      enableWhen: dropdownMenu.state === "open"
      onClicked: dropdownMenu.close()
   }

   MouseArea {
      anchors.fill: parent
      onClicked: dropdownMenu.open()
   }

   DropdownMenu {
      id: dropdownMenu
      width: 70
      anchors.verticalCenter: parent.verticalCenter
      anchors.right: parent.right
   }

   Label {
      id: selectedLabel

      fontStyle: FontStyles.subheading
      color: Theme.secondaryText

      text: "London"
      z: dropdownMenu.z + 1
//      text: actions[dropdownMenu.currentItemIndex].text

      anchors.verticalCenter: parent.verticalCenter
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

