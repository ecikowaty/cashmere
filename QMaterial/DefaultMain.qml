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

   content: Item {

      AlertDialog {
         id: dialog

         title: "A sample dialog"
         description: "This is a sample message"

         accepted: Action {
            text: "yes"
            onTriggered: console.debug(text)
         }

         rejected: Action {
            text: "no"
            onTriggered: console.debug(text)
         }
      }

      Column {
         anchors.fill: parent
         anchors.topMargin: 56
         spacing: 25

         Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "push page"

            style: RaisedButtonStyle {

            }

            onClicked: app.pushPage(Qt.resolvedUrl("qrc:/QMaterial/TempRandomCards.qml"))
         }

         Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "show dialog"

            style: FlatButtonStyle {

            }

            onClicked: dialog.open()
         }
      }
   }
}

