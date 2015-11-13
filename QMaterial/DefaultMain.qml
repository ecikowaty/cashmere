import QtQuick 2.0
import QtQuick.Controls 1.4
import "."
import "Styles"

Page {
   id: view

   actionBar {
      width: parent.width
      height: 56

      title: "Material demo"

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
            onTriggered: close()
         }
      ]
   }

   content: Column {
      anchors.fill: parent
      anchors.topMargin: 56

      spacing: 10

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "push page"

         style: RaisedButtonStyle { }
         onClicked: {
            console.debug("pushing")
            app.pushPage(Qt.resolvedUrl("qrc:/QMaterial/TempRandomCards.qml"))
         }
      }

      Button {
         anchors.horizontalCenter: parent.horizontalCenter
         text: "pop page"

         style: FlatButtonStyle { }
         onClicked: {
            console.debug("popping")
            app.popPage()
         }
      }
   }
}

