import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   width: dropdownMenu.width
   height: 48

   property alias currentItemText: selectedLabel.text
   property alias items: dropdownMenu.items
   property alias dividerVisible: divider.visible
   property alias visibleItems: dropdownMenu.visibleItems
   property bool  lightBackground: false

   function open() {
      overlayBinder.bind(false)
      dropdownMenu.open()
   }

   MouseArea {
      anchors.fill: parent
      onClicked: {
         overlayBinder.bind(false)
         dropdownMenu.open()
      }

      enabled: dropdownMenu.state === "closed"
   }

   DropdownMenu {
      id: dropdownMenu
      widthMultiplier: 2
      visibleItems: 3

      OverlayBinder {
         id: overlayBinder
         enableWhen: dropdownMenu.state === "open"
         onClicked: dropdownMenu.close()
      }
   }

   Label {
      id: selectedLabel

      fontStyle: FontStyles.subheading

      color: root.lightBackground
             ? Theme.onLightBackground.primary
             : Theme.onDarkBackground.primary

      text: dropdownMenu.text
      opacity: dropdownMenu.state === "closed"
      Behavior on opacity { NumberAnimation {} }

      anchors.verticalCenter: parent.verticalCenter
   }

   Icon {
      id: icon

      name: "arrow_drop_down"
      lightBackground: root.lightBackground

      anchors {
         right: parent.right
         verticalCenter: parent.verticalCenter
      }
   }

   Divider {
      id: divider

      anchors.bottom: parent.bottom
      anchors.bottomMargin: 8

      height: 1
   }
}

