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

      property bool horizontal: true
      property bool alternativeAnimation: false

      delegate: StackViewDelegate {
         id: defaultAnimation

         property int animationDuration: pageStack.alternativeAnimation ? 800 : 400
         property int animationEasing: pageStack.alternativeAnimation ? Easing.OutQuint : Easing.OutQuart

         pushTransition: StackViewTransition {
            NumberAnimation {
               target: enterItem
               property: "opacity"
               from: 0; to: 1
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }
            NumberAnimation {
               target: enterItem
               property: pageStack.horizontal ? "x" : "y"
               from: (pageStack.horizontal ? enterItem.width : enterItem.height) * 0.3; to: 0
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }

            NumberAnimation {
               target: exitItem
               property: "opacity"
               from: 1; to: 0
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }
            NumberAnimation {
               target: exitItem
               property: pageStack.horizontal ? "x" : "y"
               from: 0; to: -(pageStack.horizontal ? enterItem.width : enterItem.height) * 0.3
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }
         }

         popTransition: StackViewTransition {
            NumberAnimation {
               target: enterItem
               property: "opacity"
               from: 0; to: 1
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }
            NumberAnimation {
               target: enterItem
               property: pageStack.horizontal ? "x" : "y"
               from: -(pageStack.horizontal ? enterItem.width : enterItem.height) * 0.3; to: 0
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
            }

            NumberAnimation {
               target: exitItem
               property: "opacity"
               from: 1; to: 0
               duration: defaultAnimation.animationDuration
            }
            NumberAnimation {
               target: exitItem
               property: pageStack.horizontal ? "x" : "y"
               from: 0; to: (pageStack.horizontal ? enterItem.width : enterItem.height) * 0.3
               duration: defaultAnimation.animationDuration
               easing.type: defaultAnimation.animationEasing
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
                  app.pushPage(initialPage)
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
