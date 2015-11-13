import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

ApplicationWindow {
   id: app

   visible: true

   width: 480
   height: 800

   x: 450
   y: 50

   color: "#fafafa"

   function pushPage(page) {
      pageStack.push(page)
   }

   function popPage() {
      if (pageStack.depth > 1) {
         pageStack.pop()
      }
   }

   StackView {
      id: pageStack
      anchors.fill: parent
      initialItem: initialPage

      delegate: StackViewDelegate {
         id: defaultAnimation

         pushTransition: StackViewTransition {
            NumberAnimation {
               target: enterItem
               property: "opacity"
               from: 0; to: 1
               duration: 300
               easing.type: Easing.OutQuart
            }
            NumberAnimation {
               target: enterItem
               property: "y"
               from: enterItem.height * 0.05; to: 0
               duration: 300
               easing.type: Easing.OutQuart
            }
         }

         popTransition: StackViewTransition {
            NumberAnimation {
               target: exitItem
               property: "opacity"
               from: 1; to: 0
               duration: 300
               easing.type: Easing.OutQuart
            }
            NumberAnimation {
               target: exitItem
               property: "y"
               from: 0; to: enterItem.height * 0.05
               duration: 300
               easing.type: Easing.OutQuart
            }
         }
      }
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }


   Component {
      id: initialPage

      Page {
         id: view

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
   }
}
