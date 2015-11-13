import QtQuick 2.0
import QtQuick.Controls 1.4
import "."
import "Styles"


Page {
   id: view

   actionBar {
      width: parent.width
      height: 56

      color: Colors.deepOrange.regular[5]

      title: "Page"

      actions: [
         Action {
            text: "Backup"
            iconName: "backup"
         },
         Action {
            text: "Settings"
            iconName: "settings"
         },
         Action {
            text: "Tags"
            iconName: "local_offer"
         },
         Action {
            text: "About"
            iconName: "info_outline"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Close"
            iconName: "info_outline"
            onTriggered: console.debug(text)
         }
      ]
   }

   content: ListView {
      id: listView
      clip: true

      model: 20

      delegate: Button {
         width: parent.width
         height: 48
         text: "This is item number " + index + " on the list"
         style: SingleListItemStyle {

         }
      }
   }
}

