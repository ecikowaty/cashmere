import QtQuick 2.0
import QtQuick.Controls 1.4
import "."
import "Styles"

Page {
   id: view
   anchors.fill: parent

   actionBar {
      width: parent.width
      height: 56

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
      anchors.fill: parent
      spacing: 10

      Item {
         width: 20
         height: 70
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "raised"

         style: RaisedButtonStyle { }
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "flat"

         style: FlatButtonStyle { }
      }
   }
}

