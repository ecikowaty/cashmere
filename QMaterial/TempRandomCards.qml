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

   Column {
      spacing: 20
      anchors.fill: parent

      Item {
         height: 100
         width: parent.width
      }

      Card {
         width: 300
         height: 180
         anchors.horizontalCenter: parent.horizontalCenter

         Label {
            anchors.centerIn: parent
            text: "This is a sample text"
         }
      }

      Card {
         width: 300
         height: 180
         anchors.horizontalCenter: parent.horizontalCenter

         Label {
            anchors.centerIn: parent
            text: "Another card"
         }
      }
   }
}

