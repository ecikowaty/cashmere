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
         id: alertDialog
         title: "Alert dialog"
         description: "With some description placed here (multiline)"

         accepted: Action {
            text: "ok"
         }

         rejected: Action {
            text: "cancel"
         }
      }

      SimpleDialog {
         id: simpleDialog

         title: "Simple dialog"
         actions: [
            Action {
               text: "Item"
               iconName: "group"
               onTriggered: console.debug(text)
            },
            Action {
               text: "Dupa"
               iconName: "face"
               onTriggered: console.debug(text)
            },
            Action {
               text: "Kupa"
               iconName: "person"
               onTriggered: console.debug(text)
            },
            Action {
               text: "Cipa"
               iconName: "cake"
               onTriggered: console.debug(text)
            },
            Action {
               text: "Test 1"
               iconName: "mood"
               onTriggered: console.debug(text)
            },
            Action {
               text: "Test 2"
               iconName: "public"
               onTriggered: console.debug(text)
            }
         ]
      }

      ConfirmationDialog {
         id: confirmationDialog

         title: "Confirmation dialog"

         items: [ "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8" ]
         visibleItems: 4

         onSelected: console.debug(item)
      }

      Column {
         anchors.fill: parent
         anchors.topMargin: 56
         spacing: 25

//         Button {
//            anchors.horizontalCenter: parent.horizontalCenter
//            text: "push page"

//            style: RaisedButtonStyle {

//            }

//            onClicked: app.pushPage(Qt.resolvedUrl("qrc:/QMaterial/TempRandomCards.qml"))
//         }

         Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "open"

            style: RaisedButtonStyle {

            }

            onClicked: confirmationDialog.open()
         }

         TextField {
            height: 48

            placeholderText: "Name"

            validator: IntValidator {

            }

            anchors.horizontalCenter: parent.horizontalCenter
            onAccepted: card.elevation = text
         }

         TextFieldDropdown {
            width: 100
            height: 48

            items: [ "London", "Warsaw", "Cracow", "Berlin", "Szczecin"]

            anchors.horizontalCenter: parent.horizontalCenter
         }
      }
   }
}

