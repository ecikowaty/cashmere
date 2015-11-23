import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   width: selectedLabel.paintedWidth + icon.width + 16
   height: 48

   property alias currentItemText: selectedLabel.text
   property alias items: dropdownMenu.items

   OverlayBinder {
      enableWhen: dropdownMenu.state === "open"
      onClicked: dropdownMenu.close()
   }

   MouseArea {
      anchors.fill: parent
      onClicked: dropdownMenu.open()
      enabled: {
         overlay.mapPlaceholderTo(parent)
         overlay.darken = true
         dropdownMenu.state === "closed"
      }
   }

   DropdownMenu {
      id: dropdownMenu
      width: 70
      anchors.left: parent.left
      anchors.leftMargin: -16
      visibleItems: 3

      items: [ "Szczecin", "Londyn", "Warszawa", "Berlin" ]
   }

   Label {
      id: selectedLabel

      fontStyle: FontStyles.subheading
      color: Theme.secondaryText

      text: dropdownMenu.text
      opacity: dropdownMenu.state === "closed"
      Behavior on opacity { NumberAnimation {} }

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

